package com.spring.staez.concert.model.dao;

import java.util.ArrayList;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.spring.staez.admin.model.vo.Category;
import com.spring.staez.concert.model.vo.Concert;

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
	
	public ArrayList<Category> selectCateCon(SqlSessionTemplate sqlSession) {
		return (ArrayList)sqlSession.selectList("concertMapper.selectCateCon");
	}
	
	public ArrayList<Concert> selectconList(SqlSessionTemplate sqlSession) {
		return (ArrayList)sqlSession.selectList("concertMapper.selectconList");
	}
	
	public Concert selectCon(SqlSessionTemplate sqlSession, int concertNo) {
		return sqlSession.selectOne("concertMapper.selectCon", concertNo);
	}

	
	
	public int checkConLike(SqlSessionTemplate sqlSession, Map<String, Integer> conL) {
		return sqlSession.selectOne("concertMapper.checkLike", conL);
	}

	public ArrayList<Concert> selectConDetail(SqlSessionTemplate sqlSession, int concertNo) {
		return (ArrayList)sqlSession.selectList("concertMapper.selectConDetail", concertNo);
	}

//	public int insertConLike(SqlSessionTemplate sqlSession, ConcertLike conL) {
//		return sqlSession.insert("concertMapper.insertConLike", conL);
//	}
//
//	public int updateLikeYtoN(SqlSessionTemplate sqlSession, ConcertLike conL) {
//		return sqlSession.update("concertMapper.updateLikeYtoN", conL);
//	}
//
//	public int updateLikeNtoY(SqlSessionTemplate sqlSession, ConcertLike conL) {
//		return sqlSession.update("concertMapper.updateLikeNtoY", conL);
//	}


	


	// concertNo로 콘서트 가져오기
//	public Concert selectCon(SqlSessionTemplate sqlSession, int concertNo) {
//		return sqlSession.selectOne("concertMapper.selectCon", concertNo);
//	}
	



}
