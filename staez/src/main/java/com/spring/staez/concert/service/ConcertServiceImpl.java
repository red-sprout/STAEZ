package com.spring.staez.concert.service;

import java.util.ArrayList;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.spring.staez.admin.model.vo.Category;
import com.spring.staez.community.model.vo.Board;
import com.spring.staez.concert.model.dao.ConcertDao;
import com.spring.staez.concert.model.vo.Concert;
import com.spring.staez.concert.model.vo.ConcertLike;
import com.spring.staez.concert.model.vo.ConcertReview;

@Service
public class ConcertServiceImpl implements ConcertService {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	private ConcertDao concertDao;

	
	@Override
	public Category selectCate(int categoryNo) {
		return concertDao.selectCate(sqlSession, categoryNo);
	}
	
	@Override
	public ArrayList<Category> selectCateCon() {
		return concertDao.selectCateCon(sqlSession);
	}

	@Override
	public ArrayList<Concert> selectconList(int categoryNo) {
		return concertDao.selectconList(sqlSession, categoryNo);
	}

	@Override
	public Concert selectCon(int concertNo) {
		return concertDao.selectCon(sqlSession, concertNo);
	}

	@Override
	public ArrayList<Concert> selectConDetail(int concertNo) {
		return concertDao.selectConDetail(sqlSession, concertNo);
	}

	@Override
	public ArrayList<ConcertReview> selectComDetail(int concertNo) {
		return concertDao.selectComDetail(sqlSession, concertNo);
	}

	@Override
	public ArrayList<Board> selectRevDetail(int concertNo) {
		return concertDao.selectRevDetail(sqlSession, concertNo);
	}

	@Override
	public int selectConLikeCount(int concertNo) {
		return concertDao.selectConLikeCount(sqlSession, concertNo);
	}

	@Override
	public int selectUserConLike(Map map) {
		return concertDao.selectUserConLike(sqlSession, map);
	}

	@Override
	public int selectUserConLikeAll(Map map) {
		return concertDao.selectUserConLikeAll(sqlSession, map);
	}
	
	@Transactional(rollbackFor = {Exception.class})
	@Override
	public int updateConLike(ConcertLike like) {
		return concertDao.updateConLike(sqlSession, like);
	}

	@Transactional(rollbackFor = {Exception.class})
	@Override
	public int insertConLike(ConcertLike like) {
		return concertDao.insertConLike(sqlSession, like);
	}

	@Override
	public ArrayList<Concert> popularList(int categoryNo) {
		return concertDao.popularList(sqlSession, categoryNo);
	}

	@Override
	public ArrayList<Concert> latestList(int categoryNo) {
		return concertDao.latestList(sqlSession, categoryNo);
	}

	@Override
	public ArrayList<Concert> highscoreList(int categoryNo) {
		return concertDao.highscoreList(sqlSession, categoryNo);
	}

	@Override
	public ArrayList<Concert> locationAllList(Map map) {
		return concertDao.locationAllList(sqlSession, map);
		}

	



}
