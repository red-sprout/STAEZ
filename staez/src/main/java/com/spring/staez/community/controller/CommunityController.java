package com.spring.staez.community.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class CommunityController {
	
	@GetMapping("main.cm")
	public String communityMain() {
		return "community/communityMain";
	}
	
	@GetMapping("detail.cm")
	public String communityDetail() {
		return "community/communityDetail";
	}
	
	@GetMapping("incertForm.cm")
	public String communityIncertForm() {
		return "community/communityIncertForm";
	}
	
	@GetMapping("updateForm.cm")
	public String communityUpdateForm() {
		return "community/communityUpdateForm";
	}
}
