package com.spring.staez.inquire.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class InquireController {
	
	@GetMapping("main.iq")
	public String inquireFAQ(){
		return "inquire/inquireFAQ";
	}
	
	@GetMapping("insertForm.iq")
	public String inquireInsertForm(){
		return "inquire/inquireInsertForm";
	}
}
