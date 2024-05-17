package com.spring.staez.admin.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class AdminController {
	
	@GetMapping("notice.ad") 
	public String noticeMain() {
		return "admin/noticeMain";
	}
	
	@GetMapping("user.ad")
	public String userMain() {
		return "admin/userMain";
	}
	
	@GetMapping("concert.ad")
	public String concertMain() {
		return "admin/concertMain";
	}

	@GetMapping("theater.ad")
	public String theaterMain() {
		return "admin/theaterMain";
	}
	
	@GetMapping("community.ad")
	public String communityMain() {
		return "admin/communityMain";
	}
	
	@GetMapping("category.ad")
	public String categoryMain() {
		return "admin/categoryMain";
	}
	
	@GetMapping("faq.ad")
	public String faqMain() {
		return "admin/faqMain";
	}
	
	@GetMapping("inquire.ad")
	public String inquireMain() {
		return "admin/inquireMain";
	}
	
	@GetMapping("report.ad")
	public String reportMain() {
		return "admin/reportMain";
	}
}
