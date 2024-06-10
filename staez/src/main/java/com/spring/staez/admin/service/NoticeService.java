package com.spring.staez.admin.service;

import java.util.ArrayList;

import com.spring.staez.admin.model.dto.AdminCategoryDto;
import com.spring.staez.admin.model.vo.Category;
import com.spring.staez.common.model.vo.PageInfo;
import com.spring.staez.community.model.vo.Board;

public interface NoticeService {

	int insertNotice(Board b);

	Board noticeDetail(int boardNo);

	int selectNoticeCnt(AdminCategoryDto categoryDto);
	
	int selectNoticeCntAll(String keyword);

	ArrayList<Board> selectNotice(AdminCategoryDto categoryDto, PageInfo pi);

	ArrayList<Board> selectNoticeAll(String keyword, PageInfo pi);

	ArrayList<Category> selectCategory(int boardNo);

}
