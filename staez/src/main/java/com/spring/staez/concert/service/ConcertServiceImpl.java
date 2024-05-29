package com.spring.staez.concert.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.staez.admin.model.vo.Category;
import com.spring.staez.concert.model.dao.ConcertDao;
import com.spring.staez.concert.model.vo.Concert;
import com.spring.staez.concert.model.vo.ConcertAttachment;
import com.spring.staez.concert.model.vo.ConcertLike;

@Service
public class ConcertServiceImpl implements ConcertService {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	private ConcertDao concertDao;

	
	@Override
	public ArrayList<Category> selectCateCon() {
		return concertDao.selectCateCon(sqlSession);
	}

	@Override
	public ArrayList<Concert> selectconList() {
		return concertDao.selectconList(sqlSession);
	}

	@Override
	public Concert selectCon(int concertNo) {
		return concertDao.selectCon(sqlSession, concertNo);
	}

	@Override // 사용자가 찜한 적 없는 콘서트이면 찜: insert
	public ConcertLike checkConLike(ConcertLike conL) {
		return concertDao.checkConLike(sqlSession, conL);
	}

	@Override
	public int insertConLike(ConcertLike conL) {  
		
		ConcertLike cl = new ConcertServiceImpl().checkConLike(conL);
		// 사용자가 찜한 적 없는 콘서트이면 찜: insert 가져와서
		
		if(cl == null) { 
			int result = concertDao.insertConLike(sqlSession, conL);
						
		} else { // 사용자가 찜한 적 있는 콘서트이고 status Y -> status N : update
				 // 사용자가 찜한 적 있는 콘서트이고 status N -> status Y
			if(true) {
				int updateLikeYtoN = concertDao.updateLikeYtoN(sqlSession, conL);
			}else {
				int updateLikeNtoY = concertDao.updateLikeNtoY(sqlSession, conL);
			}
		}
		
		return concertDao.insertConLike(sqlSession, conL);
	}

	@Override
	public int updateConLike(ConcertLike conL) {
		return concertDao.updateConLike(sqlSession, conL);
	}




	

	



}
