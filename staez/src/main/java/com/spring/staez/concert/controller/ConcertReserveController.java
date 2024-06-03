package com.spring.staez.concert.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.spring.staez.concert.model.vo.Concert;
import com.spring.staez.concert.service.ConcertReserveService;
import com.spring.staez.concert.service.ConcertService;
import com.spring.staez.user.model.vo.Reserve;

@Controller
public class ConcertReserveController {
	
	@Autowired
	private ConcertReserveService crService;
	
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
	
	@GetMapping("insertReserve.co")
	public String insertReserve(HttpSession session) {
		
		
		session.setAttribute("alertMsg", "예매에 성공하셨습니다.");
		return "redirect:/";
	}
	
	@ResponseBody
	@GetMapping(value = "reserveConcertInfo.co" , produces="application/json; charset-UTF-8")
	public String reserveConcertInfo(String cNo) {
		int concertNo = Integer.parseInt(cNo);
		
		Concert concert = crService.reserveConcertInfo(concertNo);
		
		
		return  new Gson().toJson(concert);
	}
}
