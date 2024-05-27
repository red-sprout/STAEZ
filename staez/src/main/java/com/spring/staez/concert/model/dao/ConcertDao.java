package com.spring.staez.concert.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.spring.staez.admin.model.vo.Category;
import com.spring.staez.concert.model.vo.Concert;
import com.spring.staez.concert.model.vo.ConcertAttachment;

@Repository
public class ConcertDao {
	
//	// 콘서트가 총 몇개인가
//	public int selectConCount(SqlSessionTemplate sqlSession) {
//		return sqlSession.selectOne("concertMapper.selectConCount");
//	}
//	
//	 //콘서트 골라서 가져와라
//	public ArrayList<Concert> concertList(SqlSessionTemplate sqlSession) {
//		return (ArrayList)sqlSession.selectList("concertMapper.concertList");
//	}

	public ArrayList<Concert> selectconList(SqlSessionTemplate sqlSession) {
		return (ArrayList)sqlSession.selectList("concertMapper.selectconList");
	}
	public Concert selectCon(SqlSessionTemplate sqlSession, int concertNo) {
		return sqlSession.selectOne("concertMapper.selectCon", concertNo);
	}
	public ArrayList<Category> selectCateCon(SqlSessionTemplate sqlSession) {
		return (ArrayList)sqlSession.selectList("concertMapper.selectCateCon");
	}
	
	// concertNo로 콘서트 가져오기
//	public Concert selectCon(SqlSessionTemplate sqlSession, int concertNo) {
//		return sqlSession.selectOne("concertMapper.selectCon", concertNo);
//	}
	



}
