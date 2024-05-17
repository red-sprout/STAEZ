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
	
}
