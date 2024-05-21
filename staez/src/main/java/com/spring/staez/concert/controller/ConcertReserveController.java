package com.spring.staez.concert.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class ConcertReserveController {
	
	@GetMapping("selectDate.co")
	public String concertReserveStepOne() {
		return "concert/concertReserveStepOne";
	}
	
	@GetMapping("selectSeat.co")
	public String concertReserveStepTwo() {
		return "concert/concertReserveStepTwo";
	}
	
	@GetMapping("selectMember.co")
	public String concertReserveStepThree() {
		return "concert/concertReserveStepThree";
	}
	
	@GetMapping("selectPayment.co")
	public String concertReserveLastStep() {
		return "concert/concertReserveLastStep";
	}
}
