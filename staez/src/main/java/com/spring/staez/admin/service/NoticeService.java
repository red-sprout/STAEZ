package com.spring.staez.admin.service;

import java.util.ArrayList;

import com.spring.staez.community.model.vo.Board;

public interface NoticeService {

	ArrayList<Board> selectNotice();
	
	ArrayList<Board> selectNotice(String categoryNo);

	int insertNotice(Board b);

	Board noticeDetail(int boardNo);

}
