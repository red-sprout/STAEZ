package com.spring.staez.inquire.model.dao;

import java.util.ArrayList;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.spring.staez.admin.model.vo.Category;
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
	
	public ArrayList<Board> ajaxSelectFaq(SqlSessionTemplate sqlSession){
		return (ArrayList)sqlSession.selectList("inquireMapper.selectFaq");
	}
}
