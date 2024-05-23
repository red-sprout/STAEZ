package com.spring.staez.others.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.staez.admin.model.vo.Category;
import com.spring.staez.concert.model.vo.Concert;
import com.spring.staez.others.model.dao.OthersDao;

@Service
public class OthersServiceImpl implements OthersService{
	@Autowired
	SqlSessionTemplate sqlSession;
	
	@Autowired
	OthersDao oDao;

	@Override
	public ArrayList<Category> selectCategory() {
		return oDao.selectCategory(sqlSession);		
	}

	@Override
	public ArrayList<Concert> selectCategoryConcert(int cNo) {
		return oDao.selectCategoryConcert(sqlSession, cNo);
	}
	
	
}
