package com.spring.staez.concert.controller;

import java.lang.reflect.Type;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.google.gson.reflect.TypeToken;
import com.spring.staez.admin.model.vo.ConcertSchedule;
import com.spring.staez.admin.model.vo.ImpossibleSeat;
import com.spring.staez.admin.model.vo.Seat;
import com.spring.staez.concert.model.vo.Concert;
import com.spring.staez.concert.model.vo.Theater;
import com.spring.staez.concert.service.ConcertReserveService;
import com.spring.staez.user.model.vo.Reserve;
import com.spring.staez.user.model.vo.User;

@Controller
public class ConcertReserveController {
	
	@Autowired
	private ConcertReserveService crService;
	
	@GetMapping("selectDate.co")
	public String concertReserveStepOne(Model model, String concertNo, String userNo) {
		int cNo = Integer.parseInt(concertNo);
		int uNo = Integer.parseInt(userNo);
		Concert concert = crService.reserveConcertInfo(cNo);
		model.addAttribute("concert", concert);
		model.addAttribute("userNo", uNo);
		return "concert/concertReserveStepOne";
	}
	
	@PostMapping("selectSeat.co")
	public String concertReserveStepTwo(Model model, String concertNo, String reserveDate, String userNo) {
		int cNo = Integer.parseInt(concertNo);
		int uNo = Integer.parseInt(userNo);
		Concert concert = crService.reserveConcertInfo(cNo);
		
		model.addAttribute("concert", concert);
		model.addAttribute("userNo", uNo);
		model.addAttribute("reserveDate", reserveDate);
		return "concert/concertReserveStepTwo";
	}
	
	@PostMapping("selectMember.co")
	public String concertReserveStepThree(Model model, String cNo, String reserveDate,
			String userNo, String totalAmount, String seatList) {
		int concertNo = Integer.parseInt(cNo);
		int uNo = Integer.parseInt(userNo);
		Concert concert = crService.reserveConcertInfo(concertNo);
		User user = crService.userInfo(uNo);
		Gson gson = new Gson();
	    Type type = new TypeToken<List>(){}.getType();
	    List sList = gson.fromJson(seatList, type);

		
		model.addAttribute("seatList", sList);
		model.addAttribute("concert", concert);
		model.addAttribute("user", user);
		model.addAttribute("totalAmount", totalAmount);
		model.addAttribute("reserveDate", reserveDate);
		
		return "concert/concertReserveStepThree";
	}
	
	@GetMapping("selectPayment.co")
	public String concertReserveLastStep(Model model, String concertNo, String recipientName, String recipientPhone, String recipientBirth,
			String seatList, String totalAmount, String reserveDate, String userNo) {
		int cNo = Integer.parseInt(concertNo);
		int uNo = Integer.parseInt(userNo);
		Concert concert = crService.reserveConcertInfo(cNo);
		Gson gson = new Gson();
	    Type type = new TypeToken<List>(){}.getType();
	    List sList = gson.fromJson(seatList, type);
	    
	    
	    model.addAttribute("recipientName", recipientName);
	    model.addAttribute("recipientPhone", recipientPhone);
	    model.addAttribute("recipientBirth", recipientBirth);
	    model.addAttribute("seatList", sList);
	    model.addAttribute("concert", concert);
	    model.addAttribute("userNo", uNo);
	    model.addAttribute("totalAmount", totalAmount);
		model.addAttribute("reserveDate", reserveDate);
	    
		return "concert/concertReserveLastStep";
	}
	
	@GetMapping("insertReserve.co")
	public String insertReserve(HttpSession session, String concertNo, String recipientName, String recipientPhone, String recipientBirth,
			String seatList, String concertDate, String schedule, String userNo) {
		
		
		session.setAttribute("alertMsg", "예매에 성공하셨습니다.");
		return "redirect:/";
	}
	
	@ResponseBody
	@GetMapping(value = "ajaxConcertPeriod.co" , produces="application/json; charset-UTF-8")
	public String ajaxConcertPeriod(String concertNo) {
		int cNo = Integer.parseInt(concertNo);
		
		Concert concert = crService.selectConcertPeriod(cNo);
		
		return  new Gson().toJson(concert);
	}
	
	@ResponseBody
	@GetMapping(value = "ajaxConcertDayOff.co" , produces="application/json; charset-UTF-8")
	public String ajaxConcertDayOff(String concertNo) {
		int cNo = Integer.parseInt(concertNo);
		
		ArrayList<Concert> dayOff = crService.selectConcertDayOff(cNo);
		
		return  new Gson().toJson(dayOff);
	}
	
	@ResponseBody
	@GetMapping(value = "ajaxChoiceDateSchedule.co" , produces="application/json; charset-UTF-8")
	public String ajaxChoiceDateSchedule(String concertNo, String choiceDate) {
		int cNo = Integer.parseInt(concertNo);
		
		ArrayList<ConcertSchedule> schedules = crService.selectChoiceDateSchedule(cNo, choiceDate);
		
		return  new Gson().toJson(schedules);
	}
	
	@ResponseBody
	@GetMapping(value = "ajaxChoiceScheduleSeat.co" , produces="application/json; charset-UTF-8")
	public String ajaxChoiceScheduleSeat(String cNo, String choiceDate, String schedule) {
		int concertNo = Integer.parseInt(cNo);
		
		ArrayList<Seat> ratingTotalSeat = crService.selectRatingTotalSeat(concertNo, choiceDate, schedule);
		ArrayList<Seat> reserveRatingSeat = crService.selectReserveRatingSeat(concertNo, choiceDate, schedule);
		
		Map resMap = new HashMap();
		resMap.put("totalSeat", ratingTotalSeat);
		resMap.put("reserveSeat", reserveRatingSeat);
		
		return  new Gson().toJson(resMap);
	}
	
	@ResponseBody
	@GetMapping(value = "ajaxTheaterSeatInfo.co" , produces="application/json; charset-UTF-8")
	public String ajaxTheaterSeatInfo(String theaterName) {
		Theater theater = crService.selectTheaterSeatInfo(theaterName);
		
		return  new Gson().toJson(theater);
	}
	
	@ResponseBody
	@GetMapping(value = "ajaxImpossibleSeatInfo.co" , produces="application/json; charset-UTF-8")
	public String ajaxImpossibleSeatInfo(String tNo) {
		int theaterNo = Integer.parseInt(tNo);
		ArrayList<ImpossibleSeat> seatInfos= crService.selectImpossibleSeatInfo(theaterNo);
		
		return  new Gson().toJson(seatInfos);
	}
	
	@ResponseBody
	@GetMapping(value = "ajaxReserveSeatInfo.co" , produces="application/json; charset-UTF-8")
	public String ajaxReserveSeatInfo(String cNo, String choiceDate, String schedule) {
		int concertNo = Integer.parseInt(cNo);
		
		ArrayList<Reserve> reSeatInfos = crService.selectReserveSeatInfo(concertNo, choiceDate, schedule);
		
		return  new Gson().toJson(reSeatInfos);
	}
	
	@ResponseBody
	@GetMapping(value = "ajaxGradeSeatInfo.co" , produces="application/json; charset-UTF-8")
	public String ajaxGradeSeatInfo(String cNo, String choiceDate) {
		int concertNo = Integer.parseInt(cNo);
		
		ArrayList<Seat> grSeatInfos = crService.selectGradeSeatInfo(concertNo, choiceDate);
		
		return  new Gson().toJson(grSeatInfos);
	}
	
}
