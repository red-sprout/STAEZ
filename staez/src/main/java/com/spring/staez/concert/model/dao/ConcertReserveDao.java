package com.spring.staez.concert.model.dao;

import java.util.ArrayList;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.spring.staez.admin.model.vo.ConcertSchedule;
import com.spring.staez.admin.model.vo.ImpossibleSeat;
import com.spring.staez.admin.model.vo.Seat;
import com.spring.staez.concert.model.dto.ReserveInsertDTO;
import com.spring.staez.concert.model.vo.Concert;
import com.spring.staez.concert.model.vo.Theater;
import com.spring.staez.user.model.vo.Reserve;
import com.spring.staez.user.model.vo.User;

@Repository
public class ConcertReserveDao {

	public Concert reserveConcertInfo(SqlSessionTemplate sqlSession, int cNo) {
		return sqlSession.selectOne("concertReserveMapper.reserveConcertInfo", cNo);
	}
	
	public Concert selectConcertPeriod(SqlSessionTemplate sqlSession, int cNo) {
		return sqlSession.selectOne("concertReserveMapper.selectConcertPeriod", cNo);
	}
	
	public ArrayList<Concert> selectConcertDayOff(SqlSessionTemplate sqlSession, int cNo){
		return (ArrayList)sqlSession.selectList("concertReserveMapper.selectConcertDayOff", cNo);
	}
	
	public ArrayList<ConcertSchedule> selectChoiceDateSchedule(SqlSessionTemplate sqlSession, Map data){
		return (ArrayList)sqlSession.selectList("concertReserveMapper.selectChoiceDateSchedule", data);
	}
	
	public ArrayList<Seat> selectRatingTotalSeat(SqlSessionTemplate sqlSession, Map data){
		return (ArrayList)sqlSession.selectList("concertReserveMapper.selectRatingTotalSeat", data);
	}
	
	public ArrayList<Seat> selectReserveRatingSeat(SqlSessionTemplate sqlSession, Map data){
		return (ArrayList)sqlSession.selectList("concertReserveMapper.selectReserveRatingSeat", data);
	}
	
	public ArrayList<Seat> selectImpossibleRatingSeat(SqlSessionTemplate sqlSession, Map data){
		return (ArrayList)sqlSession.selectList("concertReserveMapper.selectImpossibleSeatCount", data);
	}
	
	public Theater selectTheaterSeatInfo(SqlSessionTemplate sqlSession, String theaterName) {
		return sqlSession.selectOne("concertReserveMapper.selectTheaterSeatInfo", theaterName);
	}
	
	public ArrayList<ImpossibleSeat> selectImpossibleSeatInfo(SqlSessionTemplate sqlSession, int theaterNo){
		return (ArrayList)sqlSession.selectList("concertReserveMapper.selectImpossibleSeatInfo", theaterNo);
	}
	
	public ArrayList<Reserve> selectReserveSeatInfo(SqlSessionTemplate sqlSession, Map data){
		return (ArrayList)sqlSession.selectList("concertReserveMapper.selectReserveSeatInfo", data);
	}
	
	public User userInfo(SqlSessionTemplate sqlSession, int uNo) {
		return sqlSession.selectOne("concertReserveMapper.userInfo", uNo);
	}
	
	public int insertReserve(SqlSessionTemplate sqlSession, ReserveInsertDTO rid) {
		return sqlSession.insert("concertReserveMapper.insertReserve", rid);
	}
	
	public int insertReserveKakao(SqlSessionTemplate sqlSession, ReserveInsertDTO rid) {
		return sqlSession.insert("concertReserveMapper.insertReserveKakao", rid);
	}
}
