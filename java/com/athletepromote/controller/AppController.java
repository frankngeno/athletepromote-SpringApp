package com.athletepromote.controller;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashSet;
import java.util.List;
import java.util.Optional;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.athletepromote.Utils.DataValidation;
import com.athletepromote.Utils.States;
import com.athletepromote.Utils.WebUtils;
import com.athletepromote.dao.RoleRepository;
import com.athletepromote.dao.UsersRepository;
import com.athletepromote.model.Addressess;
import com.athletepromote.model.AthleteStats;
import com.athletepromote.model.PaymentMethod;
import com.athletepromote.model.Products;
import com.athletepromote.model.Role;
import com.athletepromote.model.Users;

@Controller
@SessionAttributes({"loggedInuser","role"})
public class AppController {
	
	private static final Logger log=LoggerFactory.getLogger("AppController.class");
	
	@Autowired
	private UsersRepository usersRepository;
	
	@Autowired
	private WebUtils webUtils;
	
	@Autowired
	private RoleRepository roleRepository;
		
	@Autowired
	private DataValidation dataValidation;	
	
	@GetMapping({"/","home"})
	String index(Model model){	
		
		model.addAttribute("msg", "");
		model.addAttribute("home", "active");
	return "home";	
	}
	
	@GetMapping({"about"})
	String about(Model model){	
		model.addAttribute("msg", "about us");
		model.addAttribute("about", "active");
	return "about";
	}
	
	@GetMapping({"contact"})
	String contact(Model model){	
		model.addAttribute("msg", "Contact us");
		model.addAttribute("contact", "active");
	return "contact";
	}
	
	@GetMapping({"login"})
	String login(Model model){			
		model.addAttribute("login", "active");
	return "login";
	}
	
	@GetMapping({"register"})
	String signUp(Model model){			
		model.addAttribute("register", "active");
		model.addAttribute("users", new Users());	
	return "signup";
	}	
	
	
	@PostMapping("register")
	String register(@ModelAttribute Users user, BindingResult result, Model model) {

		dataValidation.validate(user, result);
			if (result.hasErrors()) {
			model.addAttribute("profile", "active");
			return "signup";
		}	
		
		// save users and put the in session/login
		user.setRole("USER");
		user.setRoles(new HashSet<Role>(Arrays.asList(roleRepository.findByRole("USER"))));
		usersRepository.save(user);
		model.addAttribute("user_account", user);		
		model.addAttribute("msg","Hi "+ user.getFname()+ " welcome");
		model.addAttribute("page", "Profile");
	    model.addAttribute("loggedInuser", user.getEmail());
	    model.addAttribute("role", "USER");
		
		return "profile";
		
	}
	
	@GetMapping("signup")
	public String sign(@RequestParam("fname") String fname,
					 @RequestParam String lname, @RequestParam String tel, 
					 @RequestParam String street,@RequestParam String city,
					 @RequestParam String state, @RequestParam String country,Model model) {		
		model.addAttribute("msg", "Name "+fname+" "+lname+"<br>"+"Contact " +tel+" "+city+" "+ state + " "+ country);		
	return "login";
		
	}
	
	@GetMapping("names")
	public String name(Model mode, @RequestParam String lname, @RequestParam String fname) {		
		mode.addAttribute("msg","<h3>Your eneterd "+ lname+" "+fname+"<h3>");		
	return "home";	
	}
		
	@GetMapping("name-{lname}-{fname}")
	public String names(Model mode, @PathVariable String lname, @PathVariable String fname) {		
		mode.addAttribute("msg","<h3>Your eneterd "+ lname+" "+fname+"<h3>");		
	return "home";
		
	}
	
	@GetMapping({"admin"})
	String admin(@SessionAttribute(required = false) String role,Model model){			
		if(role==null) {
			return "redirect:login";
		}
		if(role.equals("USER")) {
			return "accessdenied";
		}
		if(role.equals("ADMIN") || role.equals("DBA")  ) {
			model.addAttribute("admin", "active");
			model.addAttribute("list", usersRepository.findAll());	
		}else{
			return "accessdenied";	
		}
		
		
		
	return "admin";
	}
	
	 @GetMapping("profile") 
	  String profile(@SessionAttribute(required = false) String loggedInuser,
			  Model model) {
	     try {
	    	 log.info("{}","in profile method"+loggedInuser);
	    	 
	    	 model.addAttribute("profile", "active");
	    	 //if user is not in session return login page expired session
			if(loggedInuser ==null) {
				
				log.info("{}","You are not logged in "+loggedInuser);
				
				 model.addAttribute("error", "Expired session, please Login");
				 return "login"; 
			 }
			
			log.info("{}","in profile method Logged in "+loggedInuser);
			//populate user details from database 
			usersRepository.findUserByEmail(loggedInuser).ifPresent(a->{
				 model.addAttribute("user_account", a);
				 //model.addAttribute("image", Base64.getEncoder().encodeToString(a.getData()));
				 if(a.getAddress()!=null) {
					 model.addAttribute("address", a.getAddress());	 
				 }
				 
			 });
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} 
	  return "profile";
	 }
	
	@GetMapping({"removeuser"})
	String deleteUser(Model model, @RequestParam Long id){	
		
		try {
			usersRepository.deleteById(id);
			model.addAttribute("msg", "Delete success");
			
		} catch (Exception e) {			
			e.printStackTrace();
			model.addAttribute("error", "Delete Fail");
		}	
		
	return "redirect:admin";
	}	
	
	
	@PostMapping("editrole")
	String editrole(@RequestParam Long id, @RequestParam String role, 
			RedirectAttributes redirect) {
		
		try {			
			usersRepository.findById(id).
			ifPresent(a->{	
				a.setRole(role);
				if(role.equals("ADMIN")) {
					a.setRoles(new HashSet<Role>(roleRepository.findAll()));
					usersRepository.save(a);
				}
				else {
					a.setRoles(new HashSet<Role>(Arrays.asList(roleRepository.findByRole(role))));
					usersRepository.save(a);
				}				
			});
			
			redirect.addFlashAttribute("success", role+ " Role Granted ");
		} catch (Exception e) {
			e.printStackTrace();
			redirect.addFlashAttribute("success", "Operation Fail");
		}
		
		return "redirect:/users";		
	}
	
	//update user
	@PostMapping("updateUsers")
	String updateUsers(@ModelAttribute Users user, RedirectAttributes redirect) {
		
		try {
			usersRepository.findById(user.getId()).
			ifPresent(a->{	
				a.setRole(user.getRole());
				a.setRoles(new HashSet<Role>(Arrays.asList(roleRepository.findByRole(user.getRole()))));				
				a.setFname(user.getFname());
				a.setLname(user.getLname());
				usersRepository.save(a);
			});
			
			redirect.addFlashAttribute("success", "Update success");
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			redirect.addFlashAttribute("error", "Update Fail");
		}
		
	return "redirect:/admin";
	}
	
	@PostMapping("login")
	String login(RedirectAttributes redirect, Model model, @RequestParam String email, @RequestParam String password){
	  // login user
	  Optional<Users> user= usersRepository.login(email, password);
	 //add user email and role in session
	  if(user.isPresent()) {
		  model.addAttribute("loggedInuser", email);
		  model.addAttribute("role", user.get().getRole()); 
		  
	  }else {
		  redirect.addFlashAttribute("error", "Invalid Credentials");
		  return "redirect:/login";
	  }
	  
	return "redirect:/profile";
		
	}
	
	
	@GetMapping("logout")
	String logout(Model model){
		model.addAttribute("loggedInuser", "");
		model.addAttribute("role", "");		
		model.addAttribute("msg", "You have ben Logged out");
		model.addAttribute("page", "Login");
	return "login";
		
	}
	
		
	@GetMapping({"accessdenied"})
	String denied(Model model){			
		model.addAttribute("404", "active");
	return "accessdenied";
	}
	

	@PostMapping("updatemyinfo")
	public String udateMyinfo(@ModelAttribute Users user, RedirectAttributes red) {
		
		usersRepository.findById(user.getId()).ifPresent(u->{
			u.setFname(user.getFname());
			u.setLname(user.getLname());
			usersRepository.save(u);
			red.addFlashAttribute("success", "Update Success thanks "+user.getFname()+"!");
		});
		
		return "redirect:profile";
	}
	
	@PostMapping("search")
	public String search(@RequestParam String keyword, Model model) {			
		
		model.addAttribute("admin", "active");
		List<Users> users=usersRepository.seachUser(keyword);
		if(users.isEmpty()) {
			model.addAttribute("msg", " No match found");
		}else {
		model.addAttribute("list", users);
		model.addAttribute("msg", users.size()+ " found");
		}
		return "admin";
	}
	
	@PostMapping("customesearch")
	public String ccustomesearch(@RequestParam String email, @RequestParam String name, Model model) {			
		 
		model.addAttribute("admin", "active");
		List<Users> users=usersRepository.customeseachUser(name, email);
		if(users.isEmpty()) {
			model.addAttribute("msg", " No match found");
		}else {
		model.addAttribute("list", users);
		model.addAttribute("msg", users.size()+ " found");
		}
		return "admin";
	}
	
	
	@PostMapping("sendemail")
	String sendemail(@RequestParam String email, 
					 @RequestParam String name,
					 @RequestParam String subject,
					 @RequestParam String message, RedirectAttributes red) {
		
			try {
				webUtils.sendMail(email, message+" From "+ name, subject);
				red.addFlashAttribute("success", "Your message has been sent. Thank you! "+ name);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
				red.addFlashAttribute("error", "Email fail! ");
			}
		
	 
	return "redirect:contact";		
	}
	
	@PostMapping("/addimages")
	public String add(@RequestParam("file") MultipartFile file, 
			@RequestParam Long id, RedirectAttributes model) {
    	    
		Pattern ext = Pattern.compile("([^\\s]+(\\.(?i)(png|jpg))$)");
		try {
			
			  if(file != null && file.isEmpty()){
				  model.addFlashAttribute("error", "Error No file Selected "); 
			      return "redirect:profile"; 
			      } 
			  if(file.getSize()>1073741824){
				  model.addAttribute("error","File size "+file.getSize()+"KB excceds max allowed, try another photo ");
				  return "redirect:profile"; 
			      } 
			  Matcher mtch = ext.matcher(file.getOriginalFilename());
			  
			  if (!mtch.matches()) {
				  model.addFlashAttribute("error", "Invalid Image type "); 
			      return "redirect:profile";			  
			  }
			
			   webUtils.addProfilePhoto(file, id, "users");
			
				/*
				 * usersRepository.findById(id).ifPresent(a->{ try { a.setData(file.getBytes());
				 * } catch (IOException e) { // TODO Auto-generated catch block
				 * e.printStackTrace(); } String fileName =
				 * StringUtils.cleanPath(file.getOriginalFilename());
				 * a.setFileType(file.getContentType()); a.setFileName(fileName);
				 * usersRepository.save(a); });
				 */
			
			model.addFlashAttribute("msg", "Upload success "+ file.getSize()+" KB");
			
		} catch (Exception e) {
			//e.printStackTrace);
		}

		return "redirect:profile";
	}

	@GetMapping("users")
	public String users(Model model, @RequestParam(value = "page", defaultValue = "0", required = false) Integer page,
            @RequestParam(value = "size", defaultValue = "4", required = false) Integer size) {
    	    
    	    try {
    	    	model.addAttribute("users", "active");
    	    	Page<Users> findAllPagable = usersRepository.findAll(PageRequest.of(page, size, Sort.by("fname")));				
				model.addAttribute("list", findAllPagable);
				
			  } catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} 
		
		return "users";
		
	}
	
	@PostMapping("lookups")
	public String customesearch(@RequestParam String email, @RequestParam String name, Model model) {			
		 
		model.addAttribute("users", "active");
		Page<Users> users=usersRepository.customeseacher(name, email, PageRequest.of(0, 4, Sort.by("id")));
		if(users.isEmpty()) {
			model.addAttribute("msg", " No match found");
		}else {
		model.addAttribute("list", users);
		
		}
		return "users";
	}
	
	@ModelAttribute("states")
    public List<States> populateStates(){    	
        return Arrays.asList(States.values());
    }	
	
	@ModelAttribute("card")
	PaymentMethod pay() {
	return new PaymentMethod();		
	}
	
	@ModelAttribute("athlete")
	AthleteStats athleteStats() {
	return new AthleteStats();		
	}
	
	
	@ModelAttribute("address")
	Addressess address() {
	return new Addressess();		
	}
	
	@ModelAttribute("user")
	public Users user() {		
	return new Users();		
	}
	
	@ModelAttribute("product")
	Products prod() {
	return new Products();		
	}
	
	@ModelAttribute("sizes")
	public List<String> size() {
		List<String> size = new ArrayList<String>();
		size.add("S");
		size.add("M");		
		size.add("L");
		size.add("XL");
		size.add("2X");
		size.add("3X");		
		size.add("FREE SIZE");
		return size;
	}

	@ModelAttribute("cols")
	public List<String> colour() {
		List<String> col = new ArrayList<String>();
		col.add("Blue");
		col.add("Brown");
		col.add("Black");
		col.add("White");
		col.add("Green");
		col.add("Gray");
		col.add("Red");
		col.add("Yellow");
		col.add("Pink");
		col.add("Tan");
		col.add("Purple");
		col.add("Maroon");
		col.add("Gold");
		col.add("Silver");
		return col;
	}

}
