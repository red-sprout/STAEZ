package com.spring.staez.concert.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.spring.staez.concert.model.vo.Concert;

@Repository
public class ConcertReserveDao {

	public Concert reserveConcertInfo(SqlSessionTemplate sqlSession, int concertNo) {
		return sqlSession.selectOne("concertReserveMapper.reserveConcertInfo", concertNo);
	}
}
