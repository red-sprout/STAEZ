package com.spring.staez.concert.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.spring.staez.concert.model.vo.Concert;

@Repository
public class ConcertDao {

	public ArrayList<Concert> concertList(SqlSessionTemplate sqlSession, int categoryNo) {
		return (ArrayList)sqlSession.selectList("concertMapper.concertList", categoryNo);

	}

}
