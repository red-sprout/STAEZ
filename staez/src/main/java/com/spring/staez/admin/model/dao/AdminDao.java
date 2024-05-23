package com.spring.staez.admin.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.spring.staez.admin.model.vo.Category;
import com.spring.staez.community.model.vo.Board;

@Repository
public class AdminDao {

	public ArrayList<Category> selectFaqCategory(SqlSessionTemplate sqlSession, int refCategoryNo) {
		return (ArrayList)sqlSession.selectList("adminMapper.selectFaqCategory", refCategoryNo);
	}
	
	public int faqIncert(SqlSessionTemplate sqlSession, Board b) {
		return sqlSession.insert("adminMapper.faqIncert", b);
	}

	public int faqCategoryIncert(SqlSessionTemplate sqlSession, int categoryNo) {
		return sqlSession.insert("adminMapper.faqCategoryIncert", categoryNo);
	}

}
