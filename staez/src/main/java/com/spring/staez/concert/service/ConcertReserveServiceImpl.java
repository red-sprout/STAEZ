package com.spring.staez.concert.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.staez.concert.model.dao.ConcertDao;
import com.spring.staez.concert.model.dao.ConcertReserveDao;
import com.spring.staez.concert.model.vo.Concert;

@Service
public class ConcertReserveServiceImpl implements ConcertReserveService{

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	private ConcertReserveDao crDao;

	@Override
	public Concert reserveConcertInfo(int cNo) {
		return crDao.reserveConcertInfo(sqlSession, cNo);
	}

	@Override
	public Concert selectConcertPeriod(int concertNo) {
		return crDao.selectConcertPeriod(sqlSession, concertNo);
	}
}
