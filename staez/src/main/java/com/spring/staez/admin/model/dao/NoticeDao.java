package com.spring.staez.admin.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.spring.staez.admin.model.dto.AdminCategoryDto;
import com.spring.staez.admin.model.vo.Category;
import com.spring.staez.common.model.vo.PageInfo;
import com.spring.staez.community.model.vo.Board;

@Repository
public class NoticeDao {

	public int insertNotice(SqlSessionTemplate sqlSession, Board b) {
		return sqlSession.insert("adminMapper.insertNotice", b);
	}

	public int insertNoticeCategory(SqlSessionTemplate sqlSession, Board b) {
		return sqlSession.insert("adminMapper.insertNoticeCategory", b);
	}

	public Board noticeDetail(SqlSessionTemplate sqlSession, int boardNo) {
		return sqlSession.selectOne("adminMapper.noticeDetail", boardNo);
	}

	public int selectNoticeCnt(SqlSessionTemplate sqlSession, AdminCategoryDto categoryDto) {
		return sqlSession.selectOne("adminMapper.selectNoticeCnt", categoryDto);
	}

	public int selectNoticeCntAll(SqlSessionTemplate sqlSession, String keyword) {
		return sqlSession.selectOne("adminMapper.selectNoticeCntAll", keyword);
	}

	public ArrayList<Board> selectNotice(SqlSessionTemplate sqlSession, AdminCategoryDto categoryDto, PageInfo pi) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		int limit = pi.getBoardLimit();
		
		RowBounds rowBounds = new RowBounds(offset, limit);
		return (ArrayList)sqlSession.selectList("adminMapper.selectNotice", categoryDto, rowBounds);
	}

	public ArrayList<Board> selectNoticeAll(SqlSessionTemplate sqlSession, String keyword, PageInfo pi) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		int limit = pi.getBoardLimit();
		
		RowBounds rowBounds = new RowBounds(offset, limit);
		return (ArrayList)sqlSession.selectList("adminMapper.selectNoticeAll", keyword, rowBounds);
	}

	public ArrayList<Category> selectCategory(SqlSessionTemplate sqlSession, int boardNo) {
		return (ArrayList)sqlSession.selectList("adminMapper.selectNoticeCategory", boardNo);
	}
}
