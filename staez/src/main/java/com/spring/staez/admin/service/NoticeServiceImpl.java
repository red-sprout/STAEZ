package com.spring.staez.admin.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.spring.staez.admin.model.dao.NoticeDao;
import com.spring.staez.admin.model.dto.AdminCategoryDto;
import com.spring.staez.admin.model.vo.Category;
import com.spring.staez.common.model.vo.PageInfo;
import com.spring.staez.community.model.vo.Board;

@Service
public class NoticeServiceImpl implements NoticeService {

	@Autowired
	SqlSessionTemplate sqlSession;
	
	@Autowired
	NoticeDao noticeDao;

	@Transactional(rollbackFor = {Exception.class})
	@Override
	public int insertNotice(Board b) {
		int result1, result2;	
		if((result1 = noticeDao.insertNotice(sqlSession, b)) == 0)
			throw new RuntimeException("공지사항 삽입 실패");
		if((result2 = noticeDao.insertNoticeCategory(sqlSession, b)) == 0)
			throw new RuntimeException("공지사항 카테고리 삽입 실패");
		return result1 * result2;
	}

	@Transactional(readOnly = true)
	@Override
	public Board noticeDetail(int boardNo) {
		return noticeDao.noticeDetail(sqlSession, boardNo);
	}

	@Transactional(readOnly = true)
	@Override
	public int selectNoticeCnt(AdminCategoryDto categoryDto) {
		return noticeDao.selectNoticeCnt(sqlSession, categoryDto);
	}

	@Transactional(readOnly = true)
	@Override
	public int selectNoticeCntAll(String keyword) {
		return noticeDao.selectNoticeCntAll(sqlSession, keyword);
	}

	@Transactional(readOnly = true)
	@Override
	public ArrayList<Board> selectNotice(AdminCategoryDto categoryDto, PageInfo pi) {
		return noticeDao.selectNotice(sqlSession, categoryDto, pi);
	}

	@Transactional(readOnly = true)
	@Override
	public ArrayList<Board> selectNoticeAll(String keyword, PageInfo pi) {
		return noticeDao.selectNoticeAll(sqlSession, keyword, pi);
	}

	@Override
	public ArrayList<Category> selectCategory(int boardNo) {
		return noticeDao.selectCategory(sqlSession, boardNo);
	}
}
