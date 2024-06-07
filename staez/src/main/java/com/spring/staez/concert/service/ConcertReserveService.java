package com.spring.staez.concert.service;

import java.util.ArrayList;

import com.spring.staez.admin.model.vo.ConcertSchedule;
import com.spring.staez.admin.model.vo.ImpossibleSeat;
import com.spring.staez.admin.model.vo.Seat;
import com.spring.staez.concert.model.vo.Concert;
import com.spring.staez.concert.model.vo.Theater;
import com.spring.staez.user.model.vo.Reserve;
import com.spring.staez.user.model.vo.User;

public interface ConcertReserveService {
	
	Concert reserveConcertInfo(int cNo);
	
	Concert selectConcertPeriod(int concertNo);
	
	ArrayList<Concert> selectConcertDayOff(int cNo);
	
	ArrayList<ConcertSchedule> selectChoiceDateSchedule(int cNo, String choiceDate);
	
	ArrayList<Seat> selectRatingTotalSeat(int concertNo, String choiceDate, String schedule);
	
	ArrayList<Seat> selectReserveRatingSeat(int concertNo, String choiceDate, String schedule);

	Theater selectTheaterSeatInfo(String theaterName);
	
	ArrayList<ImpossibleSeat> selectImpossibleSeatInfo(int theaterNo);
	
	ArrayList<Reserve> selectReserveSeatInfo(int concertNo, String choiceDate, String schedule);
	
	ArrayList<Seat> selectGradeSeatInfo(int concertNo, String choiceDate);
	
	User userInfo(int uNo);
}
