package com.spring.staez.concert.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class ConcertController {
	
	@GetMapping("main.co")
	public String concertMain() {
		return "concert/concertMain";
	}
	
	@GetMapping("detail.co")
	public String concertDetail() {
		return "concert/concertDetail";
	}
	
	//공연세부페이지 ajax
	@GetMapping("detailSellInfo.co")
	public String detailSellInfo() {
		return "concert/concertDetail";
	}
	
//	@GetMapping("detail.co")
//	public String concertDetail() {
//		return "concert/concertDetail";
//	}
//	
//	@GetMapping("detail.co")
//	public String concertDetail() {
//		return "concert/concertDetail";
//	}
	

}
