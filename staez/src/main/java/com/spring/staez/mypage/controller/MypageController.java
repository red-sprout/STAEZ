package com.spring.staez.mypage.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.spring.staez.mypage.service.MypageService;
import com.spring.staez.user.model.vo.User;

@Controller
public class MypageController {

	@Autowired
	private MypageService mps;
	
	@RequestMapping("main.me")
	public String loadToMain(Model model) {
		User m = mps.test();
		
		model.addAttribute("test", m);
		
		return "mypage/mypageMain";
	}
	
	@RequestMapping("paymentList.me")
	public String paymentsLog(Model model) {
		return "mypage/paymentsLog";
	}
	
	@RequestMapping("scrapList.me")
	public String myScrapList(Model model) {
		return "mypage/myScrapList";
	}

	@RequestMapping("reviewList.me")
	public String oneLineReview(Model model) {
		return "mypage/oneLineReview";
	}
	
	@RequestMapping("boardList.me")
	public String myBoardList(Model model) {
		return "mypage/myBoardList";
	}
	
	@RequestMapping("likeList.me")
	public String likeBoardList(Model model) {
		return "mypage/likeBoardList";
	}
	
	@RequestMapping("updateForm.me")
	public String updateInfoForm(Model model) {
		return "mypage/updateInfoForm";
	}
	
	@RequestMapping("inquireList.me")
	public String myInquireList(Model model) {
		return "mypage/myInquireList";
	}
	
}
