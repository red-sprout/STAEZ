package com.spring.staez.others.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.spring.staez.admin.model.vo.Category;
import com.spring.staez.concert.model.vo.Concert;

@Repository
public class OthersDao {
	
	public ArrayList<Category> selectCategory(SqlSessionTemplate sqlSession) {
		return (ArrayList)sqlSession.selectList("othersMapper.selectCategory");
	}
	
	public ArrayList<Concert> selectCategoryConcert(SqlSessionTemplate sqlSession, int cNo){
		return (ArrayList)sqlSession.selectList("othersMapper.selectCategoryConcert", cNo);
	}
}
