package com.spring.staez.others.model.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.spring.staez.admin.model.vo.Category;
import com.spring.staez.concert.model.vo.Concert;

@Repository
public class OthersDao {
	
	public ArrayList<Category> selectCategory(SqlSessionTemplate sqlSession) {
		return (ArrayList)sqlSession.selectList("othersMapper.selectCategory");
	}
	
	public ArrayList<Concert> selectCategoryLikeConcert(SqlSessionTemplate sqlSession, int cNo){
		return (ArrayList)sqlSession.selectList("othersMapper.selectCategoryLikeConcert", cNo);
	}
	
	public ArrayList<Concert> selectCategoryConcertImg(SqlSessionTemplate sqlSession, int cNo){
		return (ArrayList)sqlSession.selectList("othersMapper.selectCategoryConcertImg", cNo);
	}
	
	public ArrayList<Concert> selectLatestCategoryConcert(SqlSessionTemplate sqlSession, int cNo){
		return (ArrayList)sqlSession.selectList("othersMapper.selectLatestCategoryConcert", cNo);
	}
	
	public ArrayList<Concert> selectLatestCategoryConcertImg(SqlSessionTemplate sqlSession, int cNo){
		return (ArrayList)sqlSession.selectList("othersMapper.selectLatestCategoryConcertImg", cNo);
	}
	
	public ArrayList<Concert> selectDateCategoryConcert(SqlSessionTemplate sqlSession, Map data){
		return (ArrayList)sqlSession.selectList("othersMapper.selectDateCategoryConcert", data); 
	}
}
