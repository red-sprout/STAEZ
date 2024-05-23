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
	
	@PostMapping("insert.iq")
	public String insertInquire(HttpSession session, Board b, String categoryNo) {
		int cNo = Integer.parseInt(categoryNo);
		
		int result = iService.insertInquire(b, cNo);
		
		if(result < 1) {
			session.setAttribute("alertMsg", "문의등록실패");
		} else {
			session.setAttribute("alertMsg", "문의등록완료");
		}
		
		return "redirect:/insertForm.iq";
	}
	
	@ResponseBody
	@GetMapping(value = "ajaxSelectFaq.iq" , produces="application/json; charset-UTF-8")
	public String ajaxSelectFaq() {
		ArrayList<Board> faqs = iService.ajaxSelectFaq();
		
		System.out.println(faqs);
		return  new Gson().toJson(faqs);
	}
	
	@ResponseBody
	@GetMapping(value = "ajaxSearchSelectFaq.iq" , produces="application/json; charset-UTF-8")
	public String ajaxSearchSelectFaq(String option, String content) {
		ArrayList<Board> faqs = iService.ajaxSearchSelectFap(option, content);
		
		System.out.println(faqs);
		return  new Gson().toJson(faqs);
	}
	
	@ResponseBody
	@GetMapping(value = "ajaxCategoryFaq.iq" , produces="application/json; charset-UTF-8")
	public String ajaxSelectCategoryFaq(String categoryName) {
		ArrayList<Board> faqs = iService.ajaxSelectCategoryFaq(categoryName);
		
		System.out.println(faqs);
		return  new Gson().toJson(faqs);
	}
	
	
		
	
}
