package com.spring.staez.concert.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.spring.staez.common.model.vo.PageInfo;
import com.spring.staez.concert.model.vo.Concert;

@Repository
public class ConcertDao {
	
	// 콘서트가 총 몇개인가
	public int selectConCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("concertMapper.selectConCount");
	}
	
	 //콘서트 내용 페이지네이션해서 가져와라
	public ArrayList<Concert> concertList(SqlSessionTemplate sqlSession) {

		return (ArrayList)sqlSession.selectList("concertMapper.concertList");
	}

	public ArrayList<Concert> selectconSliderList(SqlSessionTemplate sqlSession) {
		return (ArrayList)sqlSession.selectList("concertMapper.selectconSliderList");
	}
	
	// concertNo로 콘서트 가져오기
//	public Concert selectCon(SqlSessionTemplate sqlSession, int concertNo) {
//		return sqlSession.selectOne("concertMapper.selectCon", concertNo);
//	}
	



}
