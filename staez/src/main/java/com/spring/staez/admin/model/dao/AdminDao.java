package com.spring.staez.admin.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.spring.staez.admin.model.vo.Category;
import com.spring.staez.admin.model.vo.ImpossibleSeat;
import com.spring.staez.common.template.ImpossibleSeatList;
import com.spring.staez.community.model.vo.Board;
import com.spring.staez.concert.model.vo.Theater;

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

	public int incertTheater(SqlSessionTemplate sqlSession, Theater t) {
		return sqlSession.insert("adminMapper.incertTheater", t);
	}

	public int incertImpossibleSeat(SqlSessionTemplate sqlSession) {
		int result = 1;
		for(ImpossibleSeat i : ImpossibleSeatList.getList()) {
			result *= sqlSession.insert("adminMapper.incertImpossibleSeat", i);
		}
		return result;
	}

}
