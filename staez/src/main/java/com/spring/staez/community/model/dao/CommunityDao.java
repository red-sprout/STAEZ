package com.spring.staez.community.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.spring.staez.admin.model.vo.Category;
import com.spring.staez.concert.model.vo.Concert;

@Repository
public class CommunityDao {

	public ArrayList<Category> selectCategory(SqlSessionTemplate sqlSession, Category c) {
		return (ArrayList)sqlSession.selectList("communityMapper.selectCategory", c);
	}

	public ArrayList<Concert> selectConcertList(SqlSessionTemplate sqlSession, String keyword) {
		return (ArrayList)sqlSession.selectList("communityMapper.selectConcertList", keyword);
	}

}
