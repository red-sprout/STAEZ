package com.spring.staez.concert.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class ConcertReserveController {
	
	@GetMapping("stepOne.cc")
	public String concertReserveStepOne() {
		return "concert/concertReserveStepOne";
	}
}
