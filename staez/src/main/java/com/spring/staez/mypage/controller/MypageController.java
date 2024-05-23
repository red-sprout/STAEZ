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
	
	//마이페이지 메인 출력
	@RequestMapping("main.me")
	public String loadToMain(Model model) {
		User m = mps.test();
		
		model.addAttribute("test", m);
		
		return "mypage/mypageMain";
	}
	
	//결제내역 리스트 페이지 출력
	@RequestMapping("paymentList.me")
	public String paymentsLog(Model model) {
		return "mypage/paymentsLog";
	}
	
	//찜목록 리스트 페이지 출력
	@RequestMapping("scrapList.me")
	public String myScrapList(Model model) {
		return "mypage/myScrapList";
	}

	//한줄평 리스트 페이지 출력
	@RequestMapping("reviewList.me")
	public String oneLineReview(Model model) {
		return "mypage/oneLineReview";
	}
	
	//나의 작성 게시글 리스트 페이지 출력
	@RequestMapping("boardList.me")
	public String myBoardList(Model model) {
		return "mypage/myBoardList";
	}
	
	//나의 찜목록 게시글 리스트 페이지 출력
	@RequestMapping("likeList.me")
	public String likeBoardList(Model model) {
		return "mypage/likeBoardList";
	}
	
	//회원정보 변경 페이지 출력
	@RequestMapping("updateForm.me")
	public String updateUserForm(Model model) {
		return "mypage/updateUserForm";
	}
	
	//나의 문의내역 리스트 페이지 출력
	@RequestMapping("inquireList.me")
	public String myInquireList(Model model) {
		return "mypage/myInquireList";
	}
	
}
