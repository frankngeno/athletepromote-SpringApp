package com.athletepromote;

import java.util.HashSet;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.CommandLineRunner;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

import com.athletepromote.dao.RoleRepository;
import com.athletepromote.dao.UsersRepository;
import com.athletepromote.model.Role;
import com.athletepromote.model.Users;


@SpringBootApplication
public class AthleteApplication implements CommandLineRunner{

	@Autowired 
	private UsersRepository userRepository; 
	
	@Autowired 
	private RoleRepository roleRepository; 
	
	public static void main(String[] args) {
		SpringApplication.run(AthleteApplication.class, args);
		
	}

	@Override
	public void run(String... args) throws Exception {
		
		 Optional<Users> usr= userRepository.findUserByEmail("admin@email.com");
		
		if(!usr.isPresent()) {
			Users user=new Users();
			user.setFname("Admin");
			user.setLname("Manager");
			user.setEmail("admin@email.com");
			user.setPassword("123");
			user.setRole("ADMIN");
			user.setRoles(new HashSet<Role>(roleRepository.findAll()));
	        userRepository.save(user);
	       
		}
		
	}
	
	

}
