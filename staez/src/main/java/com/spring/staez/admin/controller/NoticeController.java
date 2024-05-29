package com.spring.staez.admin.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.spring.staez.admin.service.NoticeService;
import com.spring.staez.community.model.dto.CategoryDto;
import com.spring.staez.community.model.vo.Board;

@Controller
public class NoticeController {

	@Autowired
	NoticeService noticeService;
	
	@ResponseBody
	@GetMapping(value = "main.no", produces = "application/json; charset-UTF-8")
	public String communityMainList(CategoryDto categoryDto, Model model) {
		ArrayList<Board> list = noticeService.selectBoard(categoryDto);
		model.addAttribute("url", list);
		return "community/communityMain";
	}
}
