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
		int result1 = noticeDao.insertNotice(sqlSession, b);
		int result2 = noticeDao.insertNoticeCategory(sqlSession, b);
		return result1 * result2;
	}

	@Transactional(readOnly = true)
	@Override
	public Board noticeDetail(int boardNo) {
		return noticeDao.noticeDetail(sqlSession, boardNo);
	}
}
