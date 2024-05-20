package com.spring.staez.concert.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class ConcertController {
	
	@GetMapping("main.co")
	public String concertMain() {
		return "concert/concertMainView";
	}
	
	@GetMapping("detail.co")
	public String concertDetail() {
		return "concert/concertDetailView";
	}

}
