package com.web.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.web.Utils.WebUtils;
import com.web.model.Products;
import com.web.model.ShppingCart;
import com.web.model.Users;
import com.web.repository.PaymentMethodRepository;
import com.web.repository.ProductRepository;
import com.web.repository.ShppingCartRepository;

@Controller
@SessionAttributes("cart")
public class ProductCotroller {
	
	@Autowired
	private ProductRepository repo;
	
	@Autowired
	PaymentMethodRepository paymentRepository;
	
	@Autowired
	ShppingCartRepository shppingCartRepository;
	
	@Autowired
	private WebUtils webUtils;
	
		
	@PostMapping("saveproduct")
	String saveproduct(@ModelAttribute Products pro, RedirectAttributes redirect) throws IllegalStateException, IOException {
		MultipartFile[] file=pro.getFile();
		pro.setImg(file[0].getOriginalFilename());
		repo.save(pro);
	
		webUtils.multiplesave(file, pro.getId());
		
		redirect.addFlashAttribute("msg", "Product Saved");
		
		return "redirect:/profile";
	}
	
	@GetMapping("deleteproduct")
	String deleteproduct(@RequestParam Long id) {
		repo.deleteById(id);
		return "redirect:profile";	
	}
	
	@GetMapping("removeproduct")
	String remove(@RequestParam Long id) {
		repo.deleteById(id);
		return "checkout";	
	}
	
	@PostMapping("checkout")
	String completecheckout(Model model, @SessionAttribute("loggedInuser") Users user, HttpSession session,  RedirectAttributes redirect) {
		List<ShppingCart> mycart=shppingCartRepository.getCart(session.getId());
		mycart.forEach( item -> {
			webUtils.sendMail(user.getEmail(), "ordered " + item.getName(), "Order Completed");
			
			shppingCartRepository.deleteById(item.getId());
			
		});
	redirect.addFlashAttribute("cart", "0");
		return "redirect:/profile";	
	}
	
	
	
	@GetMapping("Shop")
	String shop(Model model) {
		model.addAttribute("list", repo.findAll());
		return "shop";	
	}
	
	@GetMapping("cart")
	String shop(Model model, HttpSession session) {
		List<?> mycart=shppingCartRepository.getCart(session.getId());
		model.addAttribute("list",mycart);
		model.addAttribute("cart", mycart.size());
		return "cart";	
	}
	

	@GetMapping("checkout")
	String checkout(Model model, HttpSession session) {
		List<?> mycart=shppingCartRepository.getCart(session.getId());
		model.addAttribute("list",mycart);
		model.addAttribute("cart", mycart.size());
		
		return "checkout";	
	
	}
	
	@GetMapping("bagme")
	String bagme(Model model, @RequestParam Long id, HttpSession session) {
		ShppingCart cart= new ShppingCart();
		
		repo.findById(id).ifPresent(a->{
			cart.setColor(a.getColor());
			cart.setName(a.getName());
			cart.setPrice(a.getPrice());
			cart.setType(a.getType());
			cart.setImg(a.getImg());
			cart.setSid(session.getId());
			cart.setRefid(id);
			shppingCartRepository.save(cart);
			
		});
		List<?> mycart=shppingCartRepository.getCart(session.getId());
		model.addAttribute("list",mycart);
		model.addAttribute("cart", mycart.size());
		
		return "cart";	
	}
	
	@GetMapping("remove")
	String deletfromcart(@RequestParam Long id) {
		shppingCartRepository.deleteById(id);
		return "redirect:cart";	
	}
	
	@ModelAttribute("product")
	Products prod() {
	return new Products();		
	}

}
