package com.spring.staez.admin.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.staez.admin.model.dao.AdminDao;
import com.spring.staez.community.model.vo.Board;

@Service
public class AdminServiceImpl implements AdminService {

	@Autowired
	SqlSessionTemplate sqlSession;
	
	@Autowired
	AdminDao adminDao;
	
	@Override
	public int faqIncert(Board b) {
		return adminDao.faqIncert(sqlSession, b);
	}

}
