package com.web.controller;

import java.util.Arrays;
import java.util.List;
import java.util.Optional;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.web.Utils.DataValidation;
import com.web.Utils.States;
import com.web.Utils.WebUtils;
import com.web.model.Addressess;
import com.web.model.PaymentMethod;
import com.web.model.PhoneBook;
import com.web.model.Products;
import com.web.model.Users;
import com.web.repository.AddressRepository;
import com.web.repository.PaymentMethodRepository;
import com.web.repository.PhoneBookRepository;
import com.web.service.UserService;

@Controller
@SessionAttributes("loggedInuser")
public class LoginController {
	
	@Autowired
	private DataValidation dataValidation;
	@Autowired
	private UserService userService;
	@Autowired
	private AddressRepository addressRepository;
	
	@Autowired
	private PhoneBookRepository phoneBookRepository;
	
	@Autowired
	private WebUtils webUtils;
	
	@Autowired
	PaymentMethodRepository paymentMethodRepository;
	
	@GetMapping("register")
	String register(Model model) {
	 model.addAttribute("user", new Users());		
	return "register";		
	}
	
	@PostMapping("register")
	String register(@ModelAttribute("user") Users user, 
					BindingResult result, 
					RedirectAttributes redirect) {

			try {
				dataValidation.validate(user, result);
				if (result.hasErrors()) {
				   return "register";
		        }
			user.setRole("USER");
			userService.save(user);
			redirect.addFlashAttribute("msg", "Registration success");
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	return "redirect:/login";	
	}
	
	@GetMapping("login")
	String login() {		
	return "login";		
	}
	
	@GetMapping("profile")
	String profile(@SessionAttribute("loggedInuser") Users user, Model model) {
		model.addAttribute("_profile", "active"); 
		model.addAttribute("user_account", userService.findByEmail(user.getEmail()).get());
		return "profiles";		
	}
	
	@GetMapping("logout")
	String logout(SessionStatus status, Model model) {
		status.setComplete();
		model.addAttribute("loggedInuser", "");
		model.addAttribute("msg", "You have been logged out");
	return "login";		
	}
	
	@PostMapping("login")
	String login(@RequestParam String email,
			    @RequestParam String password, Model model) {
		
		try {
			Optional<Users> user= userService.login(email, password); 
			if(user.isPresent()) {				
			model.addAttribute("msg", "Welcome"); 
			Users usr=new Users();
			usr.setEmail(email);
			usr.setRole(user.get().getRole());
			model.addAttribute("loggedInuser",usr);
			return "redirect:profile";
			}
			model.addAttribute("error", "Invalid credential");
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	   return "login";		
	}
	
	@GetMapping("users")
	String users(Model model) {
		try {
			model.addAttribute("users", userService.findAll());
			model.addAttribute("msg", "All Users");
		} catch (Exception e) {
			e.printStackTrace();
		}
	return "users";		
	}
	
	@PostMapping("/addimages")
	public String add(@RequestParam("file") MultipartFile file, 
			@RequestParam Long id, Model model) {
    	    
		Pattern ext = Pattern.compile("([^\\s]+(\\.(?i)(png|jpg))$)");
		try {
			
			  if(file != null && file.isEmpty()){
				  model.addAttribute("error", "Error No file Selected "); 
			      return "redirect:profile"; 
			      } 
			  if(file.getSize()>1073741824){
				  model.addAttribute("error","File size "+file.getSize()+"KB excceds max allowed, try another photo ");
				  return "redirect:profile"; 
			      } 
			  Matcher mtch = ext.matcher(file.getOriginalFilename());
			  
			  if (!mtch.matches()) {
				  model.addAttribute("error", "Invalid Image type "); 
			      return "redirect:profile";			  
			  }
			 		
			//save image
			webUtils.addProfilePhoto(file, id, "users");
			model.addAttribute("msg", "Upload success "+ file.getSize()+" KB");
			//model.addAttribute("loggedInuser", userRepository.findById(id).get());
			model.addAttribute("_profile", "active");
		} catch (Exception e) {
			//e.printStackTrace);
		}

		return "redirect:profile";
	}
	
	@PostMapping("search")
	String search(@RequestParam String name, Model model) {
	    model.addAttribute("users", userService.SearchByname(name));
	    model.addAttribute("msg", "Users found with "+ name);
		return "users";
	}
	
	
	@GetMapping("delete")
	String delete(@RequestParam Long id, RedirectAttributes redirect) {
		
		try {
			userService.delete(id);
			redirect.addFlashAttribute("success", "Delete Success");
		} catch (Exception e) {
			e.printStackTrace();
			redirect.addFlashAttribute("success", "Delete Fail");
		}
		
		return "redirect:/users";		
	}
	
	@PostMapping("editrole")
	String editrole(@RequestParam Long id, @RequestParam String role, 
			RedirectAttributes redirect) {
		
		try {
			userService.findById(id).
			ifPresent(a->{a.setRole(role);
			userService.save(a);
			});
			
			redirect.addFlashAttribute("success", role+ " Role Granted ");
		} catch (Exception e) {
			e.printStackTrace();
			redirect.addFlashAttribute("success", "Operation Fail");
		}
		
		return "redirect:/users";		
	}
	
	@PostMapping("addcoment")
	String addcoment(@RequestParam String comment, 
			@RequestParam Long id,
			Model model) {
		
		userService.addcoment(id, comment);		
		model.addAttribute("msg", "Update success");
		return "redirect:profile";
	}
	
	@PostMapping("updatecontact")
	String update(@ModelAttribute Addressess addressess, Model model) {
	
		try {
			Users user=userService.findById(addressess.getId()).get();	
			addressess.setUser(user);
			addressRepository.save(addressess);
			model.addAttribute("msg", "Update success");
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return "redirect:profile";	
		
	}
	
	@PostMapping("addcard")
	String addcard(@ModelAttribute PaymentMethod payment, Model model) {
	
		try {
			Users user=userService.findById(payment.getId()).get();	
			payment.setUser(user);			
			paymentMethodRepository.save(payment);
			model.addAttribute("msg", "Card Added");
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return "redirect:profile";	
		
	}
	
	@PostMapping("addphone")
	String addphone(@RequestParam Long id, @RequestParam String type, 
					@RequestParam String tel, Model model) {
	
		try {
			PhoneBook book = new PhoneBook();
			Users user=userService.findById(id).get();	
			book.setUser(user);
			book.setTel(tel);
			book.setType(type);
			phoneBookRepository.save(book);
			model.addAttribute("msg", "Phone Added");
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return "redirect:profile";	
		
	}
	
	@GetMapping("deletephone")
	String deletephone(@RequestParam Long id, RedirectAttributes redirect) {
		
		try {
			phoneBookRepository.deleteById(id);
			redirect.addFlashAttribute("success", "Delete Success");
		} catch (Exception e) {
			e.printStackTrace();
			redirect.addFlashAttribute("success", "Delete Fail");
		}
		
		return "redirect:profile";		
	}
	
	@GetMapping("deletecard")
	String deletecard(@RequestParam Long id) {
		paymentMethodRepository.deleteById(id);
		return "redirect:profile";	
	}
	
	@ModelAttribute("states")
    public List<States> populateStates(){    	
        return Arrays.asList(States.values());
    }
	
	@ModelAttribute("product")
	Products prod() {
	return new Products();		
	}
	
	@ModelAttribute("card")
	PaymentMethod pay() {
	return new PaymentMethod();		
	}
	
	
	@ModelAttribute("address")
	Addressess address() {
	return new Addressess();		
	}
	
	
}
