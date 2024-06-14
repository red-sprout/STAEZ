package com.spring.staez.concert.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.PlatformTransactionManager;
import org.springframework.transaction.annotation.Transactional;

import com.spring.staez.admin.model.vo.ConcertSchedule;
import com.spring.staez.admin.model.vo.ImpossibleSeat;
import com.spring.staez.admin.model.vo.Seat;
import com.spring.staez.concert.model.dao.ConcertDao;
import com.spring.staez.concert.model.dao.ConcertReserveDao;
import com.spring.staez.concert.model.dto.ReserveInsertDTO;
import com.spring.staez.concert.model.vo.Concert;
import com.spring.staez.concert.model.vo.Theater;
import com.spring.staez.user.model.vo.Reserve;
import com.spring.staez.user.model.vo.User;

@Service
public class ConcertReserveServiceImpl implements ConcertReserveService{

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	private ConcertReserveDao crDao;
	
	@Autowired
    private PlatformTransactionManager transactionManager;

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
	public ArrayList<Seat> selectImpossibleRatingSeat(int theaterNo, String choiceDate) {
		Map data = new HashMap();
		data.put("tNo", theaterNo);
		data.put("date", choiceDate);
		return crDao.selectImpossibleRatingSeat(sqlSession, data);
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

	@Override
	public User userInfo(int uNo) {
		return crDao.userInfo(sqlSession, uNo);
	}

	@Transactional
	@Override
	public int insertReserve(ReserveInsertDTO rid) {
		System.out.println(rid);
		int result = 0;		
		
		for(String seat : rid.getSeatList()) {
			
			 String[] seats = seat.split("-");

		        // 좌석 정보를 분리
		        String rowStr = seats[0];
		        String colStr = seats[1];

		        // 좌석 정보에서 숫자만 추출하여 row와 col로 설정
		        int row = Integer.parseInt(rowStr);
		        int col = Integer.parseInt(colStr);

		        // DTO에 좌석 정보 설정
		        rid.setRow(row);
		        rid.setCol(col);
		        
		        if(rid.getPayMethod().equals("무통장입금")) {		        	
		        	result = crDao.insertReserve(sqlSession, rid);
		        }else if(rid.getPayMethod().equals("카카오페이")) {
		        	result = crDao.insertReserveKakao(sqlSession, rid);
		        }
            
            if(result < 1 ) {
            	return result; 
            }
               
		}
		System.out.println(result);
		return result;
	}

}
