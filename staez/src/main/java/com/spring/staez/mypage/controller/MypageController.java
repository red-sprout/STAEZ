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
	
	@RequestMapping("main.my")
	public String loadToMain(Model model) {
		User m = mps.test();
		
		model.addAttribute("test", m);
		
		return "mypage/mypageMain";
	}
	
	@RequestMapping("payment.my")
	public String paymentsLog(Model model) {
		return "mypage/paymentsLog";
	}
	
	@RequestMapping("save.my")
	public String mySaveConcert(Model model) {
		return "mypage/mySaveConcert";
	}

	@RequestMapping("review.my")
	public String oneLineReview(Model model) {
		return "mypage/oneLineReview";
	}
	
	@RequestMapping("board.my")
	public String myBoardList(Model model) {
		return "mypage/myBoardList";
	}
	
	@RequestMapping("like.my")
	public String likeBoardList(Model model) {
		return "mypage/likeBoardList";
	}
	
	@RequestMapping("update.my")
	public String updateUserInfo(Model model) {
		return "mypage/updateUserInfo";
	}
	
	@RequestMapping("inquire.my")
	public String myInquireList(Model model) {
		return "mypage/myInquireList";
	}
	
}
