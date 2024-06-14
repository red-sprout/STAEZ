package com.spring.staez.concert.model.dao;

import java.util.ArrayList;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.spring.staez.admin.model.vo.Category;
import com.spring.staez.admin.model.vo.Seat;
import com.spring.staez.common.model.vo.PageInfo;
import com.spring.staez.community.model.vo.Board;
import com.spring.staez.concert.model.dto.ConcertDto;
import com.spring.staez.concert.model.vo.Concert;
import com.spring.staez.concert.model.vo.ConcertLike;
import com.spring.staez.concert.model.vo.ConcertReview;

@Repository
public class ConcertDao {
	
	
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


	public ArrayList<Concert> selectConDetail(SqlSessionTemplate sqlSession, int concertNo) {
		return (ArrayList)sqlSession.selectList("concertMapper.selectConDetail", concertNo);
	}

	
	public int selectComCount(SqlSessionTemplate sqlSession, int concertNo) {
		return sqlSession.selectOne("concertMapper.selectComCount", concertNo);
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

	public ArrayList<Concert> popularList(SqlSessionTemplate sqlSession, int categoryNo) {
		return (ArrayList)sqlSession.selectList("concertMapper.popularList", categoryNo);	
	}

	public ArrayList<Concert> latestList(SqlSessionTemplate sqlSession, int categoryNo) {
		return (ArrayList)sqlSession.selectList("concertMapper.latestList", categoryNo);	
	}

	public ArrayList<Concert> highscoreList(SqlSessionTemplate sqlSession, int categoryNo) {
		return (ArrayList)sqlSession.selectList("concertMapper.highscoreList", categoryNo);	
	}



	public ArrayList<Concert> locationAllList(SqlSessionTemplate sqlSession, Map map) {
		return (ArrayList)sqlSession.selectList("concertMapper.locationAllList", map);	
	}

	public ArrayList<ConcertReview> selectComList(SqlSessionTemplate sqlSession, PageInfo pi, int concertNo) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();	
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		return (ArrayList)sqlSession.selectList("concertMapper.selectComList", concertNo, rowBounds);
	}

	public int selectRevCount(SqlSessionTemplate sqlSession, int concertNo) {
		return sqlSession.selectOne("concertMapper.selectRevCount", concertNo);
	}

	public ArrayList<Board> selectRevList(SqlSessionTemplate sqlSession, PageInfo pi, int concertNo) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();	
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		return (ArrayList)sqlSession.selectList("concertMapper.selectRevList", concertNo, rowBounds);
	}

	public ArrayList<Seat> selectSeatPrice(SqlSessionTemplate sqlSession, int concertNo) {
		return (ArrayList)sqlSession.selectList("concertMapper.selectSeatPrice", concertNo);	
	}
	
	
	// 콘서트 api insert용
	public int conapiCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("concertMapper.conapiCount");
	}

	public int conapiInsert(SqlSessionTemplate sqlSession, ConcertDto concertDto) {
		return sqlSession.insert("concertMapper.conapiInsert", concertDto);
	}
	
	public int concertTitleCount(SqlSessionTemplate sqlSession, String concertTitle) {
		return sqlSession.selectOne("concertMapper.concertTitleCount", concertTitle);
	}

	public int conapiDelete(SqlSessionTemplate sqlSession) {
		return sqlSession.delete("concertMapper.conapiDelete");
	}
	
	
	public Concert selectConApi(SqlSessionTemplate sqlSession, String concertId) {
		return sqlSession.selectOne("concertMapper.selectConApi", concertId);
	}
	
	// api 좋아요
	public int selectConLikeCountApi(SqlSessionTemplate sqlSession, int concertNo) {
		return sqlSession.selectOne("concertMapper.selectConLikeCountApi", concertNo);
	}

	public int selectUserConLikeApi(SqlSessionTemplate sqlSession, Map map) {
		return sqlSession.selectOne("concertMapper.selectUserConLikeApi", map);
	}

	public int selectUserConLikeAllApi(SqlSessionTemplate sqlSession, Map map) {
		return sqlSession.selectOne("concertMapper.selectUserConLikeAllApi", map);
	}

	public int updateConLikeApi(SqlSessionTemplate sqlSession,  Map map) {
		return sqlSession.update("concertMapper.updateConLikeApi", map);
	}

	public int insertConLikeApi(SqlSessionTemplate sqlSession, Map map) {
		return sqlSession.insert("concertMapper.insertConLikeApi", map);
	}
}
