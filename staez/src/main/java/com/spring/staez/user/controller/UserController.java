package com.spring.staez.user.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import com.spring.staez.user.service.UserService;

@Controller
public class UserController {
	
	@Autowired
	private UserService userService;
	
	//	로그인
		@GetMapping("loginForm.me")
		public String loginForm() {
		    return "user/loginForm";
		}
	
	//	회원가입
		@GetMapping("signinForm.me")
		public String signinForm() {
			return "user/signinForm";
	}
		
//		아이디찾기
		@GetMapping("findIdForm.me")
		public String findIdForm() {
			return "user/findIdForm";
	}
//		아이디찾기결과
		@GetMapping("idListForm.me")
		public String idListForm() {
			return "user/idListForm";
	}
//		비밀번호 찾기
		@GetMapping("findPwdForm.me")
		public String findPwdForm() {
			return "user/findPwdForm";
		}
//		새 비밀번호 입력
		@GetMapping("newPwdForm.me")
		public String newPwdForm() {
			return "user/newPwdForm";
		}
		
		
}
