package com.spring.staez.inquire.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.spring.staez.admin.model.vo.Category;
import com.spring.staez.community.model.vo.Board;
import com.spring.staez.inquire.model.dao.InquireDao;

@Service
public class InquireServiceImpl implements InquireService{
	
	@Autowired
	SqlSessionTemplate sqlSession;
	
	@Autowired
	InquireDao iDao;

	@Override
	public ArrayList<Category> selectCategory() {
		return iDao.selectCategory(sqlSession);
	}
	
	@Transactional
	@Override
	public int insertInquire(Board b, Category c, int categoryNo) {
		
		int result = iDao.insertBoard(sqlSession, b);
		
		return 0;
	}	

}
