package com.spring.staez.others.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

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
		return oDao.selectCategoryLikeConcert(sqlSession, cNo);
	}

	@Override
	public ArrayList<Concert> selectCategoryConcertImg(int cNo) {
		return oDao.selectCategoryConcertImg(sqlSession, cNo);
	}

	@Override
	public ArrayList<Concert> selectLatestCategoryConcert(int cNo) {
		return oDao.selectLatestCategoryConcert(sqlSession, cNo);
	}

	@Override
	public ArrayList<Concert> selectLatestCategoryConcertImg(int cNo) {
		return oDao.selectLatestCategoryConcertImg(sqlSession, cNo);
	}

	@Override
	public ArrayList<Concert> selectDateCategoryConcert(String categoryNo, String concertDate) {
		int cNo = Integer.parseInt(categoryNo);
		Map data = new HashMap();
		data.put("cNo", cNo);
		data.put("date", concertDate);

		ArrayList<Concert> dcList = oDao.selectDateCategoryConcert(sqlSession, data);
		
		return dcList;
	}
	
	
}
