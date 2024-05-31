package com.spring.staez.inquire.model.dao;

import java.util.ArrayList;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.spring.staez.admin.model.vo.Category;
import com.spring.staez.common.model.vo.PageInfo;
import com.spring.staez.community.model.vo.Board;

@Repository
public class InquireDao {
	
	public ArrayList<Category> selectCategory(SqlSessionTemplate sqlSession) {
		return (ArrayList)sqlSession.selectList("inquireMapper.selectCategory");
	}
	
	public int insertBoard(SqlSessionTemplate sqlSession, Board b) {
		return sqlSession.insert("inquireMapper.insertBoard", b);
	}
	
	public int insertBoardCategory(SqlSessionTemplate sqlSession, int cNO) {
		return sqlSession.insert("inquireMapper.insertBoardCategory", cNO);
	}
	
	public int ajaxSelectFaqCount(SqlSessionTemplate sqlSession){
		return sqlSession.selectOne("inquireMapper.selectFaqCount");
	}
	
	public ArrayList<Board> ajaxSelectFaq(SqlSessionTemplate sqlSession, PageInfo pi){
		int offset = (pi.getCurrentPage()-1)* pi.getBoardLimit();
		int limit = pi.getBoardLimit();
		
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return (ArrayList)sqlSession.selectList("inquireMapper.selectFaq", null, rowBounds);
	}
	
	public int titleSearchFaqCount(SqlSessionTemplate sqlSession ,String content) {
		return sqlSession.selectOne("inquireMapper.titleSearchFaqCount", content);
	}
	
	public int contentSearchFaqCount(SqlSessionTemplate sqlSession ,String content) {
		return sqlSession.selectOne("inquireMapper.contentSearchFaqCount", content);
	}
	
	public ArrayList<Board> titleSearchFaq(SqlSessionTemplate sqlSession, String content, PageInfo pi){
		int offset = (pi.getCurrentPage()-1)* pi.getBoardLimit();
		int limit = pi.getBoardLimit();
		
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		
		return (ArrayList)sqlSession.selectList("inquireMapper.titleSearchFaq", content, rowBounds);
	}
	
	
	public ArrayList<Board> contentSearchFaq(SqlSessionTemplate sqlSession, String content, PageInfo pi){
		int offset = (pi.getCurrentPage()-1)* pi.getBoardLimit();
		int limit = pi.getBoardLimit();
		
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return (ArrayList)sqlSession.selectList("inquireMapper.contentSearchFaq", content, rowBounds);
	}
	
	public int ajaxSelectCategoryFaqCount(SqlSessionTemplate sqlSession, String categoryName) {
		return sqlSession.selectOne("inquireMapper.selectCategoryFaqCount", categoryName);
	}
	
	public ArrayList<Board> ajaxSelectCategoryFaq(SqlSessionTemplate sqlSession, String categoryName, PageInfo pi){
		int offset = (pi.getCurrentPage()-1)* pi.getBoardLimit();
		int limit = pi.getBoardLimit();
		
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return (ArrayList)sqlSession.selectList("inquireMapper.selectCategoryFaq",categoryName, rowBounds);
	}
	
}
