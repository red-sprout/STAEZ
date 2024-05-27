package com.spring.staez.community.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.spring.staez.admin.model.vo.Category;
import com.spring.staez.community.model.dao.CommunityDao;
import com.spring.staez.concert.model.vo.Concert;

@Service
public class CommunityServiceImpl implements CommunityService {

	@Autowired
	SqlSessionTemplate sqlSession;
	
	@Autowired
	CommunityDao communityDao;
	
	@Transactional(readOnly = true)
	@Override
	public ArrayList<Category> selectCategory(Category c) {
		return communityDao.selectCategory(sqlSession, c);
	}

	@Transactional(readOnly = true)
	@Override
	public ArrayList<Concert> selectConcertList(String keyword) {
		return communityDao.selectConcertList(sqlSession, keyword);
	}

}
