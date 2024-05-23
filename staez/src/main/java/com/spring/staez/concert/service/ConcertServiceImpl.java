package com.spring.staez.concert.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.staez.concert.model.dao.ConcertDao;
import com.spring.staez.concert.model.vo.Concert;

@Service
public class ConcertServiceImpl implements ConcertService {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	private ConcertDao concertDao;
	

	@Override
	public ArrayList<Concert> concertList(int categoryNo) {
		return concertDao.concertList(sqlSession, categoryNo);
	}


}
