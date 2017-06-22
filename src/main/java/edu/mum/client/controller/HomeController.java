package edu.mum.client.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;

import edu.mum.coffee.domain.Order;
import edu.mum.restclient.PersonRestClient;

@Controller
@SessionAttributes(value={"order", "person"})
public class HomeController {

	@Autowired
	private PersonRestClient personRestClient;
	
	@RequestMapping(value="/home", method=RequestMethod.GET)
	public String getHome(Model model){
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
	    String name = auth.getName();
	    if(name.equals("yeerick")){
	    	model.addAttribute("person", personRestClient.getPerson(1));
	    } else if(name.equals("orlando")){
	    	model.addAttribute("person", personRestClient.getPerson(2));
	    }
		if(!model.containsAttribute("order")){
			model.addAttribute("order", new Order());
		}
		
		return "home";
	}
	
	@RequestMapping({"/","/index"})
	public String getIndex(Model model){
		return "index";
	}
}
