package com.spring.staez.user.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.spring.staez.user.model.vo.User;
import com.spring.staez.user.service.UserService;

@Controller
public class LoginController {
	
	@Autowired
	private UserService userService;
	
	@Autowired
	private BCryptPasswordEncoder bcryptPasswordEncoder;
	
	@PostMapping("login.me")
	public String loginUser(User u, HttpSession session) {
		User loginUser = userService.loginUser(u);
		if(loginUser == null || !bcryptPasswordEncoder.matches(u.getUserPwd(), loginUser.getUserPwd())) {
			session.setAttribute("alertMsg", "아이디 또는 패스워드가 일치하지 않습니다.");
		} else {
			session.setAttribute("loginUser", loginUser);			
		}
		return "redirect:/";
	}
	
	@GetMapping("logout.me")
	public String logoutUser(HttpSession session) {
		session.removeAttribute("loginUser");
		return "redirect:/";
	}
}
