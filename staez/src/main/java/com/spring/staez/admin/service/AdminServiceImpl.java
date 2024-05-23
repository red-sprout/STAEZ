package com.spring.staez.admin.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.spring.staez.admin.model.dao.AdminDao;
import com.spring.staez.admin.model.vo.Category;
import com.spring.staez.community.model.vo.Board;

@Service
public class AdminServiceImpl implements AdminService {

	@Autowired
	SqlSessionTemplate sqlSession;
	
	@Autowired
	AdminDao adminDao;

	@Transactional(readOnly = true)
	@Override
	public ArrayList<Category> selectFaqCategory(int refCategoryNo) {
		return adminDao.selectFaqCategory(sqlSession, refCategoryNo);
	}

	@Transactional
	@Override
	public int faqIncert(Board b, int categoryNo) {
		int t1 = adminDao.faqIncert(sqlSession, b);
		int t2 = adminDao.faqCategoryIncert(sqlSession, categoryNo);
		return t1 * t2;
	}
}
