package com.spring.staez.admin.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.spring.staez.admin.service.NoticeService;
import com.spring.staez.community.model.vo.Board;

@Controller
public class NoticeController {

	@Autowired
	NoticeService noticeService;
	
	@GetMapping(value = "main.no")
	public String noticeMainList(String categoryNo, Model model) {
		ArrayList<Board> list = null;
		if(categoryNo == null) {
			list = noticeService.selectNotice();
		} else {
			list = noticeService.selectNotice(categoryNo);
		}

		model.addAttribute("list", list);
		return "admin/noticeMain";
	}
	
	@GetMapping("detail.no")
	public String noticeDetail(int boardNo, Model model) {
		Board notice = noticeService.noticeDetail(boardNo);
		model.addAttribute("n", notice);
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
	
	@ResponseBody
	@PostMapping(value = "insert.no")
	public String insertNotice(Board b, HttpSession session) {
		int result = noticeService.insertNotice(b);
		if(result == 0) {
			session.setAttribute("alertMsg", "게시글 등록 실패");
		} else {
			session.setAttribute("alertMsg", "성공적으로 등록하였습니다.");
		}
		
		return "main.no";
	}
}
