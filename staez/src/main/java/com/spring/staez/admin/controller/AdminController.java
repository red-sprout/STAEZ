package com.spring.staez.admin.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class AdminController {
	
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
}
