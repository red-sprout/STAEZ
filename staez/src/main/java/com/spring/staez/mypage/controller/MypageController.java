package com.spring.staez.mypage.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.spring.staez.mypage.service.MypageService;
import com.spring.staez.user.model.vo.User;

@Controller
public class MypageController {

	@Autowired
	private MypageService mps;
	
	@Autowired
	private BCryptPasswordEncoder bcryptPasswordEncoder;
	
	//마이페이지 메인 출력
	@RequestMapping("main.me")
	public String loadToMain(Model model) {
		User m = mps.test();
		
		model.addAttribute("test", m);
		
		return "mypage/mypageMain";
	}
	
	//결제내역 리스트 페이지 출력
	@RequestMapping("paymentList.me")
	public String paymentsLog() {
		return "mypage/paymentsLog";
	}
	
	//찜목록 리스트 페이지 출력
	@RequestMapping("scrapList.me")
	public String myScrapList() {
		return "mypage/myScrapList";
	}

	//한줄평 리스트 페이지 출력
	@RequestMapping("reviewList.me")
	public String oneLineReview() {
		return "mypage/oneLineReview";
	}
	
	//나의 작성 게시글 리스트 페이지 출력
	@RequestMapping("boardList.me")
	public String myBoardList() {
		return "mypage/myBoardList";
	}
	
	//나의 찜목록 게시글 리스트 페이지 출력
	@RequestMapping("likeList.me")
	public String likeBoardList() {
		return "mypage/likeBoardList";
	}
	
	//회원정보 변경 페이지 출력
	@RequestMapping("updateForm.me")
	public String updateUserForm(Model model) {
		return "mypage/updateUserForm";
	}
	
	//나의 문의내역 리스트 페이지 출력
	@RequestMapping("inquireList.me")
	public String myInquireList() {
		return "mypage/myInquireList";
	}
	
	//중복 체크
	@RequestMapping("dupliCheck.me")
	@ResponseBody
	public String duplicateCheck(String nickname) {
		int result = mps.duplicateCheck(nickname);
		return result > 0 ? "NNNNN" : "NNNNY"; 
	}
	
	//비밀번호 변경
	@RequestMapping("updatePwd.me")
	public String updatePassword(@RequestParam String newPwd, User user, HttpSession session) {
		System.out.println(newPwd);
		System.out.println(user);

		
		user.setUserPwd(bcryptPasswordEncoder.encode(newPwd));
		System.out.println(user);

		int result = mps.updatePassword(user);
		
		if(result > 0) { //변경 성공
			session.setAttribute("alert", "비밀번호 변경에 성공하였습니다");
			return "redirect:/main.me";
		}
		
		//변경 실패시
		session.setAttribute("alert", "비밀번호 변경에 실패하였습니다");
		return "mypage/updateUserForm"; 
	}
}
