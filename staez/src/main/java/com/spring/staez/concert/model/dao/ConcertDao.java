package com.spring.staez.concert.model.dao;

import java.util.ArrayList;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.spring.staez.admin.model.vo.Category;
import com.spring.staez.community.model.vo.Board;
import com.spring.staez.concert.model.vo.Concert;
import com.spring.staez.concert.model.vo.ConcertLike;
import com.spring.staez.concert.model.vo.ConcertReview;

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
	
	public Category selectCate(SqlSessionTemplate sqlSession, int categoryNo) {
		return sqlSession.selectOne("concertMapper.selectCate", categoryNo);
	}
	
	public ArrayList<Category> selectCateCon(SqlSessionTemplate sqlSession) {
		return (ArrayList)sqlSession.selectList("concertMapper.selectCateCon");
	}
	
	public ArrayList<Concert> selectconList(SqlSessionTemplate sqlSession, int categoryNo) {
		return (ArrayList)sqlSession.selectList("concertMapper.selectconList", categoryNo);
	}
	
	public Concert selectCon(SqlSessionTemplate sqlSession, int concertNo) {
		return sqlSession.selectOne("concertMapper.selectCon", concertNo);
	}

	
//	// 좋아요 버튼 클릭한 적 있냐?
//	public ArrayList<ConcertLike> checkConLike(SqlSessionTemplate sqlSession, String userNo, String concertNo) {
//		return (ArrayList)sqlSession.selectList("concertMapper.checkConLike", concertNo);
//	}

	public ArrayList<Concert> selectConDetail(SqlSessionTemplate sqlSession, int concertNo) {
		return (ArrayList)sqlSession.selectList("concertMapper.selectConDetail", concertNo);
	}

	public ArrayList<ConcertReview> selectComDetail(SqlSessionTemplate sqlSession, int concertNo) {
		return (ArrayList)sqlSession.selectList("concertMapper.selectComDetail", concertNo);
	}

	public ArrayList<Board> selectRevDetail(SqlSessionTemplate sqlSession, int concertNo) {
		return (ArrayList)sqlSession.selectList("concertMapper.selectRevDetail", concertNo);
	}

	public ArrayList<ConcertLike> checkLikeExist(SqlSessionTemplate sqlSession, int concertNo) {
		return (ArrayList)sqlSession.selectList("concertMapper.checkLikeExist", concertNo);
	}

	public int selectConLikeCount(SqlSessionTemplate sqlSession, int concertNo) {
		return sqlSession.selectOne("concertMapper.selectConLikeCount", concertNo);
	}

	public int selectUserConLike(SqlSessionTemplate sqlSession, Map map) {
		return sqlSession.selectOne("concertMapper.selectUserConLike", map);
	}

	public int selectUserConLikeAll(SqlSessionTemplate sqlSession,  Map map) {
		return sqlSession.selectOne("concertMapper.selectUserConLikeAll", map);
	}

	public int updateConLike(SqlSessionTemplate sqlSession, ConcertLike like) {
		return sqlSession.update("concertMapper.updateConLike", like);
	}

	public int insertConLike(SqlSessionTemplate sqlSession, ConcertLike like) {
		return sqlSession.insert("concertMapper.insertConLike", like);
	}
	
	
	
	
//	// 1반환되면 있는거
//	public int checkDidLike(SqlSessionTemplate sqlSession, Map insertLikeMap) {
//		return sqlSession.selectOne("concertMapper.checkDidLike", insertLikeMap);
//	}
//
//	public int insertLike(SqlSessionTemplate sqlSession, Map insertLikeMap) {
//		return sqlSession.insert("concertMapper.insertLike", insertLikeMap);
//	}
//
//	public ArrayList<ConcertLike> selectLikeCount(SqlSessionTemplate sqlSession, Map insertLikeMap) {
//		return (ArrayList)sqlSession.selectList("concertMapper.selectLikeCount", insertLikeMap);
//	}
//
//	public int updateYtoN(SqlSessionTemplate sqlSession, Map insertLikeMap) {
//		return sqlSession.update("concertMapper.updateYtoN", insertLikeMap);
//	}


	
	





//	public int insertConLike(SqlSessionTemplate sqlSession, ConcertLike conL) {
//		return sqlSession.insert("concertMapper.insertConLike", conL);
//	}
//ㄴ
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
