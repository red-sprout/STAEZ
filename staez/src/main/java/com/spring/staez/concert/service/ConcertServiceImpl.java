package com.spring.staez.concert.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.staez.common.model.vo.PageInfo;
import com.spring.staez.concert.model.dao.ConcertDao;
import com.spring.staez.concert.model.vo.Concert;

@Service
public class ConcertServiceImpl implements ConcertService {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	private ConcertDao concertDao;
	
	// 콘서트가 총 몇개인가
	@Override
	public int selectConCount() {
		int count = concertDao.selectConCount(sqlSession);
		return count;
	}

	//콘서트 내용 가져와라
	@Override
	public ArrayList<Concert> concertList() {
		return concertDao.concertList(sqlSession);
	}

	@Override
	public ArrayList<Concert> selectconSliderList() {
		// TODO Auto-generated method stub
		return concertDao.selectconSliderList(sqlSession);
	}
	
	
	// concertNo로 콘서트 가져오기
//	@Override
//	public Concert selectCon(int concertNo) {
//		return concertDao.selectCon(sqlSession, concertNo);
//	}

	



}
