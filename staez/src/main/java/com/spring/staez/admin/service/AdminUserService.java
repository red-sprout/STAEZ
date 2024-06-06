package com.spring.staez.admin.service;

import java.util.ArrayList;

import com.spring.staez.admin.model.dto.AdminSearchDto;
import com.spring.staez.admin.model.dto.AdminUserSelectDto;
import com.spring.staez.common.model.vo.PageInfo;
import com.spring.staez.user.model.vo.User;

public interface AdminUserService {
	// 유저 검색 결과 총 유저 수
	int selectUserCnt(AdminSearchDto dto);
	// 페이지네이션 포함 유저 검색 결과 조회
	ArrayList<User> selectUser(AdminSearchDto dto, PageInfo pi);
	// 유저 강제 탈퇴
	int deleteUser(AdminUserSelectDto dto);
	// 유저 권한 업데이트
	int updateGradeUser(AdminUserSelectDto dto);
}
