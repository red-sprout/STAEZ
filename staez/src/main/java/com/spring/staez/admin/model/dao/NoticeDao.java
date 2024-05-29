package com.spring.staez.admin.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.spring.staez.community.model.vo.Board;

@Repository
public class NoticeDao {

	public ArrayList<Board> selectNotice(SqlSessionTemplate sqlSession) {
		return (ArrayList)sqlSession.selectList("adminMapper.selectNotice");
	}

	public ArrayList<Board> selectNotice(SqlSessionTemplate sqlSession, String categoryNo) {
		return (ArrayList)sqlSession.selectList("adminMapper.selectNoticeByCategory", categoryNo);
	}

	public int insertNotice(SqlSessionTemplate sqlSession, Board b) {
		return sqlSession.insert("adminMapper.insertNotice", b);
	}

	public int insertNoticeCategory(SqlSessionTemplate sqlSession, Board b) {
		return sqlSession.insert("adminMapper.insertNoticeCategory", b);
	}

	public Board noticeDetail(SqlSessionTemplate sqlSession, int boardNo) {
		return sqlSession.selectOne("adminMapper.noticeDetail", boardNo);
	}
}
