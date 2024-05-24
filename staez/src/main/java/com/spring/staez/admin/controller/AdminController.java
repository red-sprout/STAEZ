package com.spring.staez.admin.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.spring.staez.admin.model.vo.Category;
import com.spring.staez.admin.model.vo.ImpossibleSeat;
import com.spring.staez.admin.service.AdminService;
import com.spring.staez.common.template.ImpossibleSeatList;
import com.spring.staez.community.model.vo.Board;
import com.spring.staez.concert.model.vo.Theater;

@Controller
public class AdminController {
	
	@Autowired
	AdminService adminService;
	
	@GetMapping("main.no") 
	public String noticeMain() {
		return "admin/noticeMain";
	}
	
	@GetMapping("detail.no")
	public String noticeDetail() {
		return "admin/noticeDetail";
	}
	
	@GetMapping("incertForm.no")
	public String noticeIncertForm() {
		return "admin/noticeIncertForm";
	}
	
	@GetMapping("updateForm.no")
	public String noticeUpdateForm() {
		return "admin/noticeUpdateForm";
	}
	
	@GetMapping("userList.ad")
	public String userMain() {
		return "admin/userMain";
	}
	
	@GetMapping("concertList.ad")
	public String concertMain() {
		return "admin/concertMain";
	}

	@GetMapping("theaterList.ad")
	public String theaterMain() {
		return "admin/theaterMain";
	}
	
	@GetMapping("communityList.ad")
	public String communityMain() {
		return "admin/communityMain";
	}
	
	@GetMapping("categoryList.ad")
	public String categoryMain() {
		return "admin/categoryMain";
	}
	
	@GetMapping("faqList.ad")
	public String faqMain() {
		return "admin/faqMain";
	}
	
	@GetMapping("inquireList.ad")
	public String inquireMain() {
		return "admin/inquireMain";
	}
	
	@GetMapping("reportList.ad")
	public String reportMain() {
		return "admin/reportMain";
	}
	
	@GetMapping("faqIncertForm.ad")
	public String faqIncertForm() {
		return "admin/faqIncertForm";
	}
	
	@GetMapping("faqUpdateForm.ad")
	public String faqUpdateForm() {
		return "admin/faqUpdateForm";
	}
	
	@GetMapping("inquireIncertForm.ad")
	public String inquireIncertForm() {
		return "admin/inquireIncertForm";
	}
	
	@GetMapping("reportIncertForm.ad")
	public String reportIncertForm() {
		return "admin/reportIncertForm";
	}
	
	@GetMapping("concertIncertForm.ad")
	public String concertIncertForm() {
		return "admin/concertIncertForm";
	}
	
	@GetMapping("concertUpdateForm.ad")
	public String concertUpdateForm() {
		return "admin/concertUpdateForm";
	}
	
	@GetMapping("theaterIncertForm.ad")
	public String theaterIncertForm() {
		return "admin/theaterIncertForm";
	}
	
	@GetMapping("theaterUpdateForm.ad")
	public String theaterUpdateForm() {
		return "admin/theaterUpdateForm";
	}
	
	@ResponseBody
	@GetMapping(value = "category.ad", produces="application/json; charset-UTF-8")
	public String ajaxCategory(String refCategoryNo) {
		ArrayList<Category> list = adminService.selectFaqCategory(Integer.parseInt(refCategoryNo));
		return new Gson().toJson(list);
	}
	
	@PostMapping("faqIncert.ad")
	public String faqIncert(Board b, String categoryNo, HttpSession session) {
		int result = adminService.faqIncert(b, Integer.parseInt(categoryNo));
		if(result == 0) {
			session.setAttribute("alertMsg", "FAQ 작성에 실패하였습니다.");
		} else {
			session.setAttribute("alertMsg", "작성 완료하였습니다.");
		}
		return "redirect:/faqList.ad";
	}
	
	@PostMapping("theaterIncert.ad")
	public String theaterIncert(Theater t, HttpSession session) {
		int result = adminService.incertTheater(t);
		if(result == 0) {
			session.setAttribute("alertMsg", "공연장 등록 에 실패하였습니다.");
		} else {
			session.setAttribute("alertMsg", "등록 완료하였습니다.");
		}
		return "redirect:/theaterList.ad";
	}
	
	@ResponseBody
	@GetMapping("toggleSeat.ad")
	public String ajaxToggleSeat(ImpossibleSeat seat, String status) {
		int result = adminService.toggleSeat(seat, status);
		return result > 0 ? "SUCCESS" : "FAIL";
	}
}
