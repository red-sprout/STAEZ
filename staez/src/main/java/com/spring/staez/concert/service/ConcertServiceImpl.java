package com.spring.staez.concert.service;

import java.util.ArrayList;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.spring.staez.admin.model.vo.Category;
import com.spring.staez.admin.model.vo.Seat;
import com.spring.staez.common.model.vo.PageInfo;
import com.spring.staez.community.model.vo.Board;
import com.spring.staez.concert.model.dao.ConcertDao;
import com.spring.staez.concert.model.vo.Concert;
import com.spring.staez.concert.model.vo.ConcertLike;
import com.spring.staez.concert.model.vo.ConcertReview;

import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Service
public class ConcertServiceImpl implements ConcertService {
	
	
	private final SqlSessionTemplate sqlSession;

	private final ConcertDao concertDao;
	
	
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
	public int selectComCount(int concertNo) {
		return concertDao.selectComCount(sqlSession, concertNo);
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

	@Override
	public ArrayList<ConcertReview> selectComList(PageInfo pi, int concertNo) {
		return concertDao.selectComList(sqlSession, pi, concertNo);
	}

	@Override
	public int selectRevCount(int concertNo) {
		return concertDao.selectRevCount(sqlSession, concertNo);
	}

	@Override
	public ArrayList<Board> selectRevList(PageInfo pi, int concertNo) {
		return concertDao.selectRevList(sqlSession, pi, concertNo);
	}

	@Override
	public ArrayList<Seat> selectSeatPrice(int concertNo) {
		return concertDao.selectSeatPrice(sqlSession, concertNo);
	}
	
	@Override
	public Concert selectConApi(String concertId) {
		return concertDao.selectConApi(sqlSession, concertId);
	}
	
	@Override
	public int selectConLikeCountApi(int concertNo) {
		return concertDao.selectConLikeCountApi(sqlSession, concertNo);
	}

	@Override
	public int selectUserConLikeApi(Map map) {
		return concertDao.selectUserConLikeApi(sqlSession, map);
	}

	@Override
	public int selectUserConLikeAllApi(Map map) {
		return concertDao.selectUserConLikeAllApi(sqlSession, map);
	}
	
	@Transactional(rollbackFor = {Exception.class})
	@Override
	public int updateConLikeApi(Map map) {
		return concertDao.updateConLikeApi(sqlSession, map);
	}

	@Transactional(rollbackFor = {Exception.class})
	@Override
	public int insertConLikeApi(Map map) {
		return concertDao.insertConLikeApi(sqlSession, map);
	}

	@Override
	public ArrayList<Concert> selectConDetailApi(int concertNo) {
		return concertDao.selectConDetailApi(sqlSession, concertNo);
	}

	@Override
	public ArrayList<Concert> popularListApi() {
		return concertDao.popularListApi(sqlSession);
	}

	

}