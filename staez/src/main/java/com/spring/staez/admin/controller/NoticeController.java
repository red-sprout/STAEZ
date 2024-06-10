package com.spring.staez.admin.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.spring.staez.admin.model.dto.AdminCategoryDto;
import com.spring.staez.admin.model.vo.Category;
import com.spring.staez.admin.service.NoticeService;
import com.spring.staez.common.model.vo.PageInfo;
import com.spring.staez.common.template.Pagination;
import com.spring.staez.community.model.vo.Board;
import com.spring.staez.user.model.vo.User;

@Controller
public class NoticeController {

	@Autowired
	NoticeService noticeService;
	
	@GetMapping(value = "main.no")
	public String noticeMainList(String categoryNo, Model model) {
		return "admin/noticeMain";
	}
	
	@GetMapping("detail.no")
	public String noticeDetail(int boardNo, Model model) {
		Board notice = noticeService.noticeDetail(boardNo);
		model.addAttribute("n", notice);
		return "admin/noticeDetail";
	}
	
	@GetMapping("insertForm.no")
	public String noticeIncertForm(HttpSession session) {
		User loginUser = (User)session.getAttribute("loginUser");
		if(!loginUser.getGrade().equals("1")) {
			session.setAttribute("alertMsg", "접근 권한이 없습니다.");
			return "redirect: main.no";
		}
		return "admin/noticeInsertForm";
	}
	
	@GetMapping("updateForm.no")
	public String noticeUpdateForm(int boardNo, Model model, HttpSession session) {
		User loginUser = (User)session.getAttribute("loginUser");
		if(!loginUser.getGrade().equals("1")) {
			session.setAttribute("alertMsg", "접근 권한이 없습니다.");
			return "redirect: main.no";
		}
		
		Board notice = noticeService.noticeDetail(boardNo);
		String category = noticeService.selectCategory(boardNo).get(0).getCategoryName();
		model.addAttribute("n", notice);
		model.addAttribute("category", category);
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
	
	// 게시글 불러오기(페이지네이션)
	@ResponseBody
	@GetMapping(value = "list.no", produces = "application/json; charset-UTF-8")
	public String communityMainList(AdminCategoryDto categoryDto, String cPage) {
		int listSize, listCount;
		int currentPage = Integer.parseInt(cPage);
		
		ArrayList<Board> list = null;
		PageInfo pi = null;
		
		try {
			Integer.parseInt(categoryDto.getCategoryNo());
			// 에러 발생 -> categoryNo 가 null 이라는 뜻 -> 아무것도 받지 않는 로직으로 보내준다.
			listSize = noticeService.selectNoticeCnt(categoryDto);
			listCount = listSize;
			pi = Pagination.getPageInfo(listCount, currentPage, 10, 10);
			list = noticeService.selectNotice(categoryDto, pi);
		} catch (Exception e) {
			listSize = noticeService.selectNoticeCntAll(categoryDto.getKeyword());
			listCount = listSize;
			pi = Pagination.getPageInfo(listCount, currentPage, 10, 10);
			list = noticeService.selectNoticeAll(categoryDto.getKeyword(), pi);
		}

		Map<String, Object> map = new HashMap<>();
		map.put("pagination", pi);
		map.put("boardList", list);
		return new Gson().toJson(map);
	}
	
	// 게시글 카테고리 조회
	@ResponseBody
	@GetMapping(value = "notice.ct", produces = "application/json; charset-UTF-8")
	public String boardCategory(int boardNo) {
		ArrayList<Category> list = noticeService.selectCategory(boardNo);
		return new Gson().toJson(list);
	}
}
