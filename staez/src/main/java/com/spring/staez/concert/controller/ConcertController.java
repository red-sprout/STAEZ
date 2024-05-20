package com.spring.staez.concert.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class ConcertController {
	
	@GetMapping("concert.co")
	public String concertMain() {
		return "concert/concertMainView";
	}
	
	@GetMapping("concertDetail.co")
	public String concertDetail() {
		return "concert/concertDetailView";
	}

}
