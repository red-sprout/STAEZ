package com.spring.staez.inquire.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.spring.staez.admin.model.vo.Category;
import com.spring.staez.common.model.vo.PageInfo;
import com.spring.staez.common.template.Pagination;
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
	public String ajaxSelectFaq(String cPage) {
		
		
		int currentPage = Integer.parseInt(cPage);
		int listCount = iService.ajaxSelectFaqCount();
		
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 10, 1);
		
		ArrayList<Board> faqs = iService.ajaxSelectFaq(pi);
		System.out.println(listCount);
		Map<String, Object> resMap = new HashMap<String, Object>();
		resMap.put("faqs", faqs);
		resMap.put("pi", pi);
		
		return  new Gson().toJson(resMap);
	}
	
	@ResponseBody
	@GetMapping(value = "ajaxSearchSelectFaq.iq" , produces="application/json; charset-UTF-8")
	public String ajaxSearchSelectFaq(String option, String content, String cPage) {
		
		int listSize = iService.ajaxSearchSelectFapCount(option, content);
		int currentPage = Integer.parseInt(cPage);
		int listCount = listSize;
		
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 10, 1);
		
		ArrayList<Board> faqs = iService.ajaxSearchSelectFap(option, content, pi);
		
		Map<String, Object> resMap = new HashMap<String, Object>();
		resMap.put("faqs", faqs);
		resMap.put("pi", pi);
		
		return  new Gson().toJson(resMap);
	}
	
	@ResponseBody
	@GetMapping(value = "ajaxCategoryFaq.iq" , produces="application/json; charset-UTF-8")
	public String ajaxSelectCategoryFaq(String categoryName, String cPage) {
		
		int currentPage = Integer.parseInt(cPage);
		int listCount = iService.ajaxSelectCategoryFaqCount(categoryName);
		
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 10, 1);
		
		
		ArrayList<Board> faqs = iService.ajaxSelectCategoryFaq(categoryName, pi);
		System.out.println(listCount);

		Map<String, Object> resMap = new HashMap<String, Object>();
		resMap.put("faqs", faqs);
		resMap.put("pi", pi);
		
		return  new Gson().toJson(resMap);
	}
	
	
		
	
}
