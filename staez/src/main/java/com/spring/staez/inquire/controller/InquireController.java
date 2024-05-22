package com.spring.staez.inquire.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.spring.staez.admin.model.vo.Category;
import com.spring.staez.community.model.vo.Board;
import com.spring.staez.inquire.service.InquireService;

@Controller
public class InquireController {
	
	@Autowired
	private InquireService iService;
	
	@GetMapping("main.iq")
	public String inquireFAQ(){
		return "inquire/inquireFAQ";
	}
	
	@GetMapping("insertForm.iq")
	public String inquireInsertForm(){
		return "inquire/inquireInsertForm";
	}
	
	@ResponseBody
	@GetMapping(value = "ajaxSelectCategory.iq" , produces="application/json; charset-UTF-8")
	public String ajaxSelectCategory() {
		ArrayList<Category> categorys = iService.selectCategory();
		
		System.out.println(categorys);
		return  new Gson().toJson(categorys);
	}
	
	@PostMapping
	public String insertInquire(HttpSession session, Board b, Category c, int categoryNo) {
		int result = iService.insertInquire(b, c, categoryNo);
		
		return null;
	}
	
		
	
}
