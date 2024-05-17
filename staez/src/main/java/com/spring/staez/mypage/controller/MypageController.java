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
	public String test(Model model) {
		User m = mps.test();
		
		model.addAttribute("test", m);
		
		return "mypage/mypageMain";
	}
	
}
