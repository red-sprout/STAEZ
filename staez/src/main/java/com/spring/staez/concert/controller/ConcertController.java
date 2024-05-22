package com.spring.staez.concert.controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class ConcertController {
	
	@GetMapping("main.co")
	public String concertMain(String category, HttpSession session) {
		// category로 찾으러가서 값 가져와서 출력
		
		return "concert/concertMain";
	}
	
	@GetMapping("detail.co")
	public String concertDetail() {
		return "concert/concertDetail";
	}
	
	// 공연세부페이지 ajax
	// 보드넘버로 찾을 보드 가지러 가서
	// 찾아서 가져와서 보드 상세 페이지로 보내주기

//	@ResponseBody
//	@RequestMapping(value = "sellInfo.co", method = RequestMethod.POST, produces = "application/json; charset=UTF-8")
	@GetMapping("sellInfo.co")
	public String sellInfo(int no) {
	    // concertNo를 기반으로 데이터를 가져와서 JSON 형태로 반환하는 로직을 작성
	    // 예를 들어, JSON 형식의 문자열을 반환하는 대신에 DB에서 데이터를 조회하여 JSON으로 변환하여 반환하는 코드를 작성해야 함
//	    return "{ \"concertNo\": " + concertNo + ", \"description\": \"This is sell info for concert " + concertNo + "\" }";
		return 1;
	}

	@GetMapping("comment.co")
	public String comment(int concertNo) {
		return "concert/concertDetailCommentAjax";
	}
	
	@GetMapping("detailReview.co")
	public String detailReview(int concertNo) {
		return "concert/concertDetailReviewAjax";
	}
	

}
