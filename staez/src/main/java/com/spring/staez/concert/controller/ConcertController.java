package com.spring.staez.concert.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.spring.staez.concert.service.ConcertService;

@Controller
public class ConcertController {
	

	private ConcertService concertService;
	
//	private int	categoryNo; //카테고리번호
//	private int refCategoryNo; //상위카테고리번호
//	private String categoryName; //카테고리이름
//	private int categoryLevel; //카테고리레벨
	
	@RequestMapping("main.co")
	public String concertMain(@RequestParam(value="categoryName", defaultValue="뮤지컬") String category, HttpSession session) {
		
		
		// category로 찾으러가서 값 가져와서 출력
		return "concert/concertMain";
	}
	
	@GetMapping("detail.co")
	public String concertDetail() {
		return "concert/concertDetail";
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
