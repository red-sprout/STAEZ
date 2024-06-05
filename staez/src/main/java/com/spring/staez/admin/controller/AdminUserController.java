package com.spring.staez.admin.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.spring.staez.admin.model.dto.AdminUserSearchDto;
import com.spring.staez.admin.model.dto.AdminUserSelectDto;
import com.spring.staez.admin.service.AdminUserService;
import com.spring.staez.common.model.vo.PageInfo;
import com.spring.staez.common.template.Pagination;
import com.spring.staez.user.model.vo.User;
/*
 * 관리자 페이지 이용자 부분에서 할 수 있는 작업들
 */
@Controller
public class AdminUserController {
	
	@Autowired
	AdminUserService adminUserService;
	
	@GetMapping("userList.ad")
	public String userMain() {
		return "admin/userMain";
	}
	
	@ResponseBody
	@GetMapping(value = "adminSelect.me", produces = "application/json; charset-UTF-8")
	public String adminSelectUser(AdminUserSearchDto dto, String currentPage) {
		int listCount = adminUserService.selectUserCnt(dto);
		int cPage = Integer.parseInt(currentPage);
		
		PageInfo pi = Pagination.getPageInfo(listCount, cPage, 10, 10);
		ArrayList<User> list = adminUserService.selectUser(dto, pi);
		
		Map<String, Object> map = new HashMap<>();
		map.put("pagination", pi);
		map.put("userList", list);
		
		return new Gson().toJson(map);
	}
	
	@ResponseBody
	@PostMapping(value = "adminDelete.me", produces = "text/plain; charset=utf-8")
	public String adminDeleteUser(AdminUserSelectDto dto) {
		int result = adminUserService.deleteUser(dto);
		if(result == 0) {
			return "이용자 강제 퇴장 실패";
		} else {
			return "성공적으로 강퇴 퇴장 처리하였습니다.";
		}
	}
	
	@ResponseBody
	@PostMapping(value = "adminUpdateGrade.me", produces = "text/plain; charset=utf-8")
	public String adminUpdateGrade(AdminUserSelectDto dto) {
		int result = adminUserService.updateGradeUser(dto);
		if(result == 0) {
			return "이용자 권한 수정 실패";
		} else {
			return "성공적으로 권한을 수정하였습니다.";
		}
	}
}
