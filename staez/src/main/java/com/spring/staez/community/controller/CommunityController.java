package com.spring.staez.community.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class CommunityController {
	
	@GetMapping("main.co")
	public String communityMain() {
		return "community/communityMain";
	}
	
	@GetMapping("detail.co")
	public String communityDetail() {
		return "community/communityDetail";
	}
	
	@GetMapping("incertForm.co")
	public String communityIncertForm() {
		return "community/communityIncertForm";
	}
	
	@GetMapping("updateForm.co")
	public String communityUpdateForm() {
		return "community/communityUpdateForm";
	}
}
