package com.spring.staez.concert.controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class ConcertController {
	
	@GetMapping("main.co")
	public String concertMain(String category, HttpSession session) {
		// category로 찾으러가서 값 가져와서 출력
		
		return "concert/concertMain";
	}
	
	@GetMapping("detail.co")
	public String concertDetail() {
		return "concert/test";
	}
	
//	// 공연세부페이지 ajax
//	// 보드넘버로 찾을 보드 가지러 가서
//	// 찾아서 가져와서 보드 상세 페이지로 보내주기
//	@GetMapping(value = "detail.co")
//	public String detailSellInfo(int con) {
//		return "concert/concertDetail";
//	}
	
	
	
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
