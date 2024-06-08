package com.spring.staez.mypage.model.dao;

import java.util.ArrayList;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.spring.staez.common.model.vo.PageInfo;
import com.spring.staez.community.model.dto.BoardListDto;
import com.spring.staez.community.model.vo.Board;
import com.spring.staez.concert.model.vo.Concert;
import com.spring.staez.concert.model.vo.ConcertReview;
import com.spring.staez.user.model.dto.PaymentsInfoDto;
import com.spring.staez.user.model.vo.ProfileImg;
import com.spring.staez.user.model.vo.User;

@Repository
public class MypageDao {

	public int duplicateCheck(SqlSessionTemplate sqlSession, String nickname) {
		int result = sqlSession.selectOne("mypageMapper.duplicateCheck", nickname);
		return result;
	}
	
	public int passwordCheck(SqlSessionTemplate sqlSession, String inputPwd) {
		int result = sqlSession.selectOne("mypageMapper.passwordCheck", inputPwd);
		return result;
	}
	
	
	public int updatePassword(SqlSessionTemplate sqlSession, User user) {
		int result = sqlSession.update("mypageMapper.updatePassword", user);
		return result;
		
	}

	public int updateUserInfo(SqlSessionTemplate sqlSession, User user) {
		int result = sqlSession.update("mypageMapper.updateUserInfo", user);
		return result;
	}

	public ProfileImg loadProfileImg(SqlSessionTemplate sqlSession, int userNo) {
		return sqlSession.selectOne("mypageMapper.loadProfileImg", userNo);
	}
	
	public int insertProfileImg(SqlSessionTemplate sqlSession, ProfileImg profileImg) {
		int result = sqlSession.insert("mypageMapper.insertProfileImg", profileImg);
		return result;
	}

	public int updateProfileImg(SqlSessionTemplate sqlSession, ProfileImg profileImg) {
		System.out.println("repo: "+ profileImg);
		int result = sqlSession.update("mypageMapper.updateProfileImg", profileImg);
		return result;
	}
	
	public int withdrawalUser(SqlSessionTemplate sqlSession, User user) {
		int result = sqlSession.update("mypageMapper.withdrawalUser", user);
		return result;
	}
	
	public int selectMyBoardListCount(SqlSessionTemplate sqlSession, int userNo) {
		int count = sqlSession.selectOne("mypageMapper.selectMyBoardListCount", userNo);
		return count;
	}

	public ArrayList<BoardListDto> selectMyBoardList(SqlSessionTemplate sqlSession, int userNo, PageInfo pi) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		ArrayList<BoardListDto> list = (ArrayList)sqlSession.selectList("mypageMapper.selectMyBoardList", userNo, rowBounds);
		return list;
		
	}

	public int selectLikeBoardListCount(SqlSessionTemplate sqlSession, int userNo) {
		int count = sqlSession.selectOne("mypageMapper.selectLikeBoardListCount", userNo);
		return count;
	}
	
	public ArrayList<BoardListDto> selectLikeBoardList(SqlSessionTemplate sqlSession, int userNo, PageInfo pi) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		ArrayList<BoardListDto> list = (ArrayList)sqlSession.selectList("mypageMapper.selectLikeBoardList", userNo, rowBounds);
		return list;
	}
	
	
	public int selectPaymentsCount(SqlSessionTemplate sqlSession, int userNo) {
		int count = sqlSession.selectOne("mypageMapper.selectPaymentsCount", userNo);
		return count;
	}
	
	public ArrayList<PaymentsInfoDto> selectPaymentsList(SqlSessionTemplate sqlSession, int userNo, PageInfo pi) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		ArrayList<PaymentsInfoDto> list = (ArrayList)sqlSession.selectList("mypageMapper.selectPaymentsList", userNo, rowBounds);
		return list;
	}
	
	public int selectScrapCount(SqlSessionTemplate sqlSession, int userNo) {
		int count = sqlSession.selectOne("mypageMapper.selectScrapCount", userNo);
		return count;
	}
	
	public ArrayList<Concert> selectScrapList(SqlSessionTemplate sqlSession, int userNo, PageInfo pi) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		ArrayList<Concert> list = (ArrayList)sqlSession.selectList("mypageMapper.selectScrapList", userNo, rowBounds);
		return list;
	}

	public int selectReviewCount(SqlSessionTemplate sqlSession, int userNo) {
		int count = sqlSession.selectOne("mypageMapper.selectReviewCount", userNo);
		return count;
	}
	
	public ArrayList<Concert> selectReviewList(SqlSessionTemplate sqlSession, int userNo, PageInfo pi) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		ArrayList<Concert> list = (ArrayList)sqlSession.selectList("mypageMapper.selectReviewList", userNo, rowBounds);
		return list;
	}
	
	public int selectMyInquireCount(SqlSessionTemplate sqlSession, int userNo) {
		int count = sqlSession.selectOne("mypageMapper.selectMyInquireCount", userNo);
		return count;	
	}

	public ArrayList<Board> selectMyInquireList(SqlSessionTemplate sqlSession, int userNo, PageInfo pi) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		ArrayList<Board> list = (ArrayList)sqlSession.selectList("mypageMapper.selectMyInquireList", userNo, rowBounds);
		return list;
	}
	
	public Board loadAnswerAjax(SqlSessionTemplate sqlSession, int boardNo) {
		return (Board)sqlSession.selectOne("mypageMapper.loadAnswerAjax", boardNo);
	}
	
	public int deleteMyScrapAjax(SqlSessionTemplate sqlSession, Map<String, Integer> params){
		return sqlSession.update("mypageMapper.deleteMyScrapAjax", params);
	}
	
	public ConcertReview loadOneLineReviewAjax(SqlSessionTemplate sqlSession, Map<String, Integer> params) {
		return sqlSession.selectOne("mypageMapper.loadOneLineReviewAjax", params);
	}
	
	public int insertOneLineReview(SqlSessionTemplate sqlSession, ConcertReview concertReview) {
		return sqlSession.insert("mypageMapper.insertOneLineReview", concertReview);
	}

	public int updateOneLineReview(SqlSessionTemplate sqlSession, ConcertReview concertReview) {
		return sqlSession.update("mypageMapper.updateOneLineReview", concertReview);
	}
	
	
	public ArrayList<PaymentsInfoDto> loadMyPaymentsAjax(SqlSessionTemplate sqlSession, int userNo) {
		return (ArrayList)sqlSession.selectList("mypageMapper.loadMyPaymentsAjax", userNo);
	}
	public ArrayList<Concert> loadMyScrapAjax(SqlSessionTemplate sqlSession, int userNo) {
		return (ArrayList)sqlSession.selectList("mypageMapper.loadMyScrapAjax", userNo);
	}
	public ArrayList<ConcertReview> loadMyReviewAjax(SqlSessionTemplate sqlSession, int userNo) {
		return (ArrayList)sqlSession.selectList("mypageMapper.loadMyReviewAjax", userNo);
	}
	public ArrayList<Board> loadMyBoardAjax(SqlSessionTemplate sqlSession, int userNo) {
		return (ArrayList)sqlSession.selectList("mypageMapper.loadMyBoardAjax", userNo);
	}
	public ArrayList<Board> loadMyInquireAjax(SqlSessionTemplate sqlSession, int userNo) {
		return (ArrayList)sqlSession.selectList("mypageMapper.loadMyInquireAjax", userNo);
	}
	
}
