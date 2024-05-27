package com.spring.staez.concert.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.spring.staez.admin.model.vo.Category;
import com.spring.staez.concert.model.vo.Concert;
import com.spring.staez.concert.service.ConcertService;

@Controller
public class ConcertController {
	
	@Autowired
	private ConcertService concertService;
	
	// 공연 누르면 보여주는 공연 메인 페이지
	@GetMapping("main.co")
	public String concertMain() {
		return "concert/concertMain";
	}
	
	// 공연리스트 다가져와(ajax로)
	@ResponseBody // 리턴할 응답 바디를 직접 입력할꺼야
	@RequestMapping(value = "maincon.co", produces="application/json; charset=UTF-8")
	public String mainDrawAjax() {
		return new Gson().toJson(concertService.selectconList());
	}
		
	// 공연 concertNo로 가져와
	@RequestMapping(value = "detail.co", produces="application/json; charset=UTF-8")
	public String selectCon(String concertNo, Model model) {
		
		Concert con = concertService.selectCon(Integer.parseInt(concertNo));
		model.addAttribute("con", con);
		
		return "concert/concertDetail";
	}
	
	// 공연을 categoryNo로 가져와
	@ResponseBody
	@RequestMapping(value = "connavi.co", produces="application/json; charset=UTF-8")
	public String selectCateCon() {
		ArrayList<Category> conList =  concertService.selectCateCon();
		return new Gson().toJson(conList);
	}
	

	
	
	// 보드넘버로 찾을 보드 가지러 가서
	// 찾아서 가져와서 보드 상세 페이지로 보내주기
	@GetMapping("sellInfo.co")
	public String sellInfo() {
		return "concert/concertDetailSellInfo";
	}

	@GetMapping("comment.co")
	public String comment() {
		return "concert/concertDetailComment";
	}
	
	@GetMapping("detailReview.co")
	public String detailReview() {
		return "concert/concertDetailReview";
	}
	

}
