package com.spring.staez.admin.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.spring.staez.admin.model.dao.NoticeDao;
import com.spring.staez.community.model.vo.Board;

@Service
public class NoticeServiceImpl implements NoticeService {

	@Autowired
	SqlSessionTemplate sqlSession;
	
	@Autowired
	NoticeDao noticeDao;

	@Transactional(readOnly = true)
	@Override
	public ArrayList<Board> selectNotice() {
		return noticeDao.selectNotice(sqlSession);
	}
	
	@Transactional(readOnly = true)
	@Override
	public ArrayList<Board> selectNotice(String categoryNo) {
		return noticeDao.selectNotice(sqlSession, categoryNo);
	}

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
}
