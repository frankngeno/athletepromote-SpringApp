package com.athletepromote.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.athletepromote.dao.AddressRepository;
import com.athletepromote.dao.PaymentMethodRepository;
import com.athletepromote.dao.PhoneBookRepository;
import com.athletepromote.dao.UsersRepository;
import com.athletepromote.model.Addressess;
import com.athletepromote.model.PaymentMethod;
import com.athletepromote.model.PhoneBook;
import com.athletepromote.model.Users;

@Controller
public class UsersController {

	@Autowired
	private AddressRepository addressRepository;
	
	@Autowired
	private PhoneBookRepository phoneBookRepository;
	
	@Autowired
	private PaymentMethodRepository paymentMethodRepository;
	
	@Autowired
	private UsersRepository usersRepository;
	
	@PostMapping("addcard")
	String addcard(@ModelAttribute PaymentMethod payment, Model model) {
	
		try {
			Users user=usersRepository.findById(payment.getId()).get();	
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
			Users user=usersRepository.findById(id).get();	
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
	
	@PostMapping("updatecontact")
	String update(@ModelAttribute Addressess addressess, Model model) {
	
		try {
			Users user=usersRepository.findById(addressess.getId()).get();	
			addressess.setUser(user);
			
			addressRepository.save(addressess);
			model.addAttribute("msg", "Update success");
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return "redirect:profile";	
		
	}
	
	@GetMapping({"deletecard"})
	String deletecard(Model model, @RequestParam Long id){	
		
		try {
			paymentMethodRepository.deleteById(id);
			model.addAttribute("msg", "Delete success");
			
		} catch (Exception e) {			
			e.printStackTrace();
			model.addAttribute("error", "Delete Fail");
		}	
		
	return "redirect:profile";
	}	
	
	@PostMapping("changepassword")	
	String register(@ModelAttribute Users user, RedirectAttributes mod) {
		String passwordRegex ="^(?=.*[0-9])(?=.*[a-z])(?=.*[A-Z])(?=.*[!@#$%^&+=])(?=\\S+$).{8,}$";
		
		usersRepository.findById(user.getId()).ifPresent(a->{			
			
			if(!a.getPassword().equals(user.getPassword())) {
				mod.addFlashAttribute("error", "Password is different from current one");
			}
			
			if(!user.getPassword2().matches(passwordRegex)) { 				
				mod.addFlashAttribute("error", "Password should be at least 8 characters, lower case, upper case and a special character."); 
			}
			
			if(a.getPassword().equals(user.getPassword()) && user.getPassword2().matches(passwordRegex)) {
				a.setPassword(user.getPassword2());
				usersRepository.save(a);
				mod.addFlashAttribute("msg", "Password reset success");
			}
			
		});
		
		return "redirect:profile";
		
	}
	
	
	
}
