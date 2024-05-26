package com.spring.staez.concert.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.spring.staez.concert.model.vo.Concert;
import com.spring.staez.concert.model.vo.ConcertAttachment;
import com.spring.staez.concert.service.ConcertService;

@Controller
public class ConcertController {
	
	@Autowired
	private ConcertService concertService;	
	
//	// 공연 네비: 뮤지컬, 클래식, 국악...
//	@RequestMapping(value = "main.co") // currentPage임
//	public String concertMain(@RequestParam(value="category", defaultValue="1")String currentPage, Model model) {
//		// category로 찾으러가서 값 가져와서 출력
//		
////		int conCount = concertService.selectConCount(); //콘서트 총 몇개냐
////		ArrayList<Concert> list = concertService.concertList(); //콘서트 가져와라
////		ArrayList<ConcertAttachment> atList = concertService.concertAtList(); //콘서트 사진 경로
//		
////		model.addAttribute("list", list);
////		model.addAttribute("atList", atList);
//		
//		return "concert/concertMain";
//	}
	
	
	@ResponseBody // 리턴할 응답 바디를 직접 입력할꺼야
	@RequestMapping(value = "mainSlider.co", produces="application/json; charset=UTF-8")
	public String mainSliderAjax() {
		return new Gson().toJson(concertService.selectconSliderList());
	}
		
	@ResponseBody // 리턴할 응답 바디를 직접 입력할꺼야
	@RequestMapping(value = "mainPic.co", produces="application/json; charset=UTF-8")
	public String mainPicAjax() {
		return new Gson().toJson(concertService.selectconPicList());
	}
	
	
	
	
	
//	// concertNo로 콘서트 가져오기
//	@RequestMapping(value = "detail.co")
//	public String selectCon(String concertNo, Model model) {
//		
//			Concert con = concertService.selectCon(Integer.parseInt(concertNo));
//			model.addAttribute("con", con);
//			
//			return "concert/concertDetail";
//	}
	
	
	
	
	// 공연 누르면 보여주는 공연 메인 페이지
	@GetMapping("main.co")
	public String concertMain() {
		return "concert/concertMain";
	}
//	
//	@GetMapping("detail.co")
//	public String concertDetail() {
//		return "concert/concertDetail";
//	}
	
	
	
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
