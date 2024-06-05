package com.spring.staez.concert.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.staez.admin.model.vo.ConcertSchedule;
import com.spring.staez.admin.model.vo.ImpossibleSeat;
import com.spring.staez.admin.model.vo.Seat;
import com.spring.staez.concert.model.dao.ConcertDao;
import com.spring.staez.concert.model.dao.ConcertReserveDao;
import com.spring.staez.concert.model.vo.Concert;
import com.spring.staez.concert.model.vo.Theater;
import com.spring.staez.user.model.vo.Reserve;

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

	@Override
	public ArrayList<Concert> selectConcertDayOff(int cNo) {
		return crDao.selectConcertDayOff(sqlSession, cNo);
	}

	@Override
	public ArrayList<ConcertSchedule> selectChoiceDateSchedule(int cNo, String choiceDate) {
		Map data = new HashMap();
		data.put("cNo", cNo);
		data.put("date", choiceDate);
		return crDao.selectChoiceDateSchedule(sqlSession, data);
	}

	@Override
	public ArrayList<Seat> selectRatingTotalSeat(int concertNo, String choiceDate, String schedule) {
		Map data = new HashMap();
		data.put("cNo", concertNo);
		data.put("date", choiceDate);
		data.put("time", schedule);
		return crDao.selectRatingTotalSeat(sqlSession, data);
	}

	@Override
	public ArrayList<Seat> selectReserveRatingSeat(int concertNo, String choiceDate, String schedule) {
		Map data = new HashMap();
		data.put("cNo", concertNo);
		data.put("date", choiceDate);
		data.put("time", schedule);
		return crDao.selectReserveRatingSeat(sqlSession, data);
	}

	@Override
	public Theater selectTheaterSeatInfo(String theaterName) {
		return crDao.selectTheaterSeatInfo(sqlSession, theaterName);
	}

	@Override
	public ArrayList<ImpossibleSeat> selectImpossibleSeatInfo(int theaterNo) {
		return crDao.selectImpossibleSeatInfo(sqlSession, theaterNo);
	}

	@Override
	public ArrayList<Reserve> selectReserveSeatInfo(int concertNo, String choiceDate, String schedule) {
		Map data = new HashMap();
		data.put("cNo", concertNo);
		data.put("date", choiceDate);
		data.put("time", schedule);
		return crDao.selectReserveSeatInfo(sqlSession, data);
	}

	@Override
	public ArrayList<Seat> selectGradeSeatInfo(int concertNo, String choiceDate) {
		Map data = new HashMap();
		data.put("cNo", concertNo);
		data.put("date", choiceDate);
		return crDao.selectRatingTotalSeat(sqlSession, data);
	}
}
