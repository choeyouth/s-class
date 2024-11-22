package com.test.oauth2.controller;

import java.util.Collection;
import java.util.Iterator;

import org.springframework.security.core.Authentication;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.web.authentication.logout.SecurityContextLogoutHandler;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;


@Controller
public class MainController {

	@GetMapping("/")
	public String index() {
		
		return "index";
	}

	@GetMapping("/my")
	public String my(Model model) {
		
		String username = SecurityContextHolder.getContext().getAuthentication().getName();
		
		Collection<? extends GrantedAuthority> authorities = SecurityContextHolder.getContext().getAuthentication().getAuthorities();
		Iterator<? extends GrantedAuthority> iterator = authorities.iterator();
		GrantedAuthority auth = iterator.next();
		String role = auth.getAuthority();
		
		model.addAttribute("username", username);
		model.addAttribute("role", role);
		model.addAttribute("authentication", SecurityContextHolder.getContext().getAuthentication());
		
		return "my";
	}	
	
	@GetMapping("/login")
	public String login() {
		
		return "login";
	}		
	
	@GetMapping("/logout")
	public String logout(HttpServletRequest request, HttpServletResponse response) throws Exception {

		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
		
		if (authentication != null) {
			new SecurityContextLogoutHandler().logout(request, response, authentication); //로그아웃
		}
		
		return "redirect:/";
	}
}
