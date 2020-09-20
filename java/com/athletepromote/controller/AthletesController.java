package com.athletepromote.controller;

import java.util.regex.Pattern;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.athletepromote.Utils.WebUtils;
import com.athletepromote.dao.AthleteStatsRespository;
import com.athletepromote.model.AthleteStats;


@Controller
public class AthletesController {
	
	@Autowired
	private AthleteStatsRespository athleteStatsRespository;
	
	@Autowired
	private WebUtils webUtils;
	
	@PostMapping("add_profile")
	String saveAtheleteprofile(@ModelAttribute AthleteStats athlete, RedirectAttributes red) {
				
		athleteStatsRespository.save(athlete);
		red.addFlashAttribute("success", "Race added");
		
		return "redirect:profile";

	}
	
	@PostMapping("athletesearch")
	String athletesearch( @RequestParam String keyword, Model model,@RequestParam(value = "page", defaultValue = "0", required = false) Integer page,
            @RequestParam(value = "size", defaultValue = "10", required = false) Integer size) {
				
		Page<AthleteStats> findAllPagable = athleteStatsRespository.seachbyRaces(keyword,PageRequest.of(page, size, Sort.by("id")));				
		model.addAttribute("list", findAllPagable);
		model.addAttribute("athletes", "Athletes");
		
		return "athletes";

	}
	
	
	@GetMapping("athletes")	
	String athlete(Model model, @RequestParam(value = "page", defaultValue = "0", required = false) Integer page,
	            @RequestParam(value = "size", defaultValue = "4", required = false) Integer size){	
			
			Page<AthleteStats> findAllPagable = athleteStatsRespository.findAll(PageRequest.of(page, size, Sort.by("id")));				
			model.addAttribute("list", findAllPagable);
			model.addAttribute("athletes", "Athletes");
			
			
     return "athletes";

	}
	
	@GetMapping("findbyrace")	
	String getrace( @RequestParam String race, Model model){	
			
		Page<AthleteStats> findAllPagable = athleteStatsRespository.seachRace(race,PageRequest.of(0, 25, Sort.by("id")));				
			model.addAttribute("list", findAllPagable);
			model.addAttribute("athletes", "Athletes");
			
			
     return "athletes";

	}
	
	
	@GetMapping("removerace")	
	String removerace(@RequestParam Long id,RedirectAttributes red){	
			
		athleteStatsRespository.deleteById(id);	
		red.addFlashAttribute("success", "Race Removed");
		
		return "redirect:profile";

	}

	
	@PostMapping("/addivideo")
	public String add(@RequestParam("file") MultipartFile file, 
			@RequestParam Long id, RedirectAttributes model) {
    	    
		Pattern ext = Pattern.compile("([^\\s]+(\\.(?i)(mp4|vid))$)");
		try {
			
			  if(file != null && file.isEmpty()){
				  model.addFlashAttribute("error", "Error No file Selected "); 
			      return "redirect:profile"; 
			      } 
			  
			//  Matcher mtch = ext.matcher(file.getOriginalFilename());
			  
			//  if (!mtch.matches()) {
				//  model.addFlashAttribute("error", "Invalid Image type "); 
			    //  return "redirect:profile";			  
			 // }
			
			   webUtils.addvideos(file, id, "users");
				
			model.addFlashAttribute("msg", "Upload success "+ file.getSize()+" KB");
			
		} catch (Exception e) {
			//e.printStackTrace);
		}

		return "redirect:profile";
	}

	
	

}
