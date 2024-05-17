package com.spring.staez.others.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class OthersController {
	
	@GetMapping("main.ot")
	public String reserveMain() {
		return "others/reserveMain";
	}

}
