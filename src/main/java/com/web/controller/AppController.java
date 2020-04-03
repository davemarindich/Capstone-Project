package com.web.controller;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.web.Utils.WebUtils;
import com.web.model.Users;
import com.web.repository.ProductRepository;
import com.web.service.UserService;

@Controller
@SessionAttributes("loggedInuser")
public class AppController {
	
	@Autowired
	private UserService userService;
	
	
	@Autowired
	private ProductRepository productRepository;
	
	@Autowired
	private WebUtils webUtils;
	
	@GetMapping("allusers")
	@ResponseBody
	public List<Users> getEmployees(){
	    return userService.findAll();
	}
	
	@GetMapping({"/","/index"})
	String index(Model model) {
		model.addAttribute("_index", "active");
		model.addAttribute("comments", userService.findAll());		
	return "index";		
	}
	
	@GetMapping("/about")
	String about(Model model) {
		model.addAttribute("_about", "active");
		model.addAttribute("comments", userService.findAll());
		
	return "about";		
	}
	
	
	
	
		

	@GetMapping("/contact")
	String contact(Model model) {
	  model.addAttribute("_contact", "active");
	  model.addAttribute("msg", "Get in touch with us by filling contact form below");
	return "contact";		
	}
	
	@PostMapping("sendemail")
	String sendemail(@RequestParam String email, 
					 @RequestParam String name,
					 @RequestParam String subject,
					 @RequestParam String message, Model model) {
		try {
			webUtils.sendMail(email, message+" From "+ name, subject);
			model.addAttribute("msg", "Your message has been sent. Thank you! "+ name);
		} catch (Exception e) {
			e.printStackTrace();
			model.addAttribute("msg", "Email fail! "+ name);
			
		}
	 
	return "contact";		
	}
	
	
	
	
}
