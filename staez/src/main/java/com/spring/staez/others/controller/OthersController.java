package com.spring.staez.others.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class OthersController {
	
	@GetMapping("main.ot")
	public String reserveMain() {
		return "others/reserveMain";
	}
	
	@GetMapping("searchResult.ot")
	public String searchResultPage() {
		return "others/searchResultPage";
	}
	
	@GetMapping("moreConcert.ot")
	public String searchResultMoreConcert() {
		return "others/searchResultMoreConcert";
	}
	
	@GetMapping("concertCalendar.ot")
	public String concertCalendar() {
		return "others/concertCalendar";
	}

}
