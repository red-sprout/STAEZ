package com.spring.staez.mypage.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.spring.staez.common.model.vo.PageInfo;
import com.spring.staez.community.model.dto.BoardListDto;
import com.spring.staez.community.model.vo.Board;
import com.spring.staez.concert.model.vo.Concert;
import com.spring.staez.concert.model.vo.ConcertReview;
import com.spring.staez.mypage.model.dao.MypageDao;
import com.spring.staez.user.model.dto.PaymentsInfoDto;
import com.spring.staez.user.model.vo.ProfileImg;
import com.spring.staez.user.model.vo.User;

@Service
public class MypageServiceImpl implements MypageService{

	@Autowired
	public SqlSessionTemplate sqlSession;
	
	@Autowired
	public MypageDao mpd;
	
	@Override
	public int duplicateCheck(String nickname) {
		return mpd.duplicateCheck(sqlSession, nickname);
	}

	@Override
	public int passwordCheck(String inputPwd) {
		return mpd.passwordCheck(sqlSession, inputPwd);

	}

	@Override
	public int updatePassword(User user) {
		return mpd.updatePassword(sqlSession, user);
	}

	@Override
	public int updateUserInfo(User user) {
		return mpd.updateUserInfo(sqlSession, user);
	}

	
	@Override
	public ProfileImg loadProfileImg(int userNo) {
		return mpd.loadProfileImg(sqlSession, userNo);
	}
	
	@Override
	public int updateProfileImg(ProfileImg profileImg) {
		return mpd.updateProfileImg(sqlSession, profileImg);
	}
	
	@Override
	public int insertProfileImg(ProfileImg profileImg) {
		return mpd.insertProfileImg(sqlSession, profileImg);
	}

	
	@Override
	public int withdrawalUser(User user) {
		return mpd.withdrawalUser(sqlSession, user);
	}

	@Override
	public int selectMyBoardListCount(int userNo) {
		return mpd.selectMyBoardListCount(sqlSession, userNo);
	}

	@Override
	public ArrayList<BoardListDto> selectMyBoardList(int userNo, PageInfo pi) {
		return mpd.selectMyBoardList(sqlSession, userNo, pi);
	}

	@Override
	public int selectLikeBoardListCount(int userNo) {
		return mpd.selectLikeBoardListCount(sqlSession, userNo);
	}
	
	@Override
	public int selectMyBoardSearchListCount(Map<String, Object> map) {
		return mpd.selectMyBoardSearchListCount(sqlSession, map);
	}
	
	

	@Override
	public ArrayList<BoardListDto> selectMyBoardSearchList(Map<String, Object> map, PageInfo pi) {
		return mpd.selectMyBoardSearchList(sqlSession, map, pi);
	}

	@Override
	public ArrayList<BoardListDto> selectLikeBoardList(int userNo, PageInfo pi) {
		return mpd.selectLikeBoardList(sqlSession, userNo, pi);
	}

	@Override
	public int selectLikeBoardSearchListCount(Map<String, Object> map) {
		return mpd.selectLikeBoardSearchListCount(sqlSession, map);
	}

	@Override
	public ArrayList<BoardListDto> selectLikeBoardSearchList(Map<String, Object> map, PageInfo pi) {
		return mpd.selectLikeBoardSearchList(sqlSession, map, pi);
	}
	
	
	
	@Override
	public int selectPaymentsCount(int userNo) {
		return mpd.selectPaymentsCount(sqlSession, userNo);
	}

	@Override
	public ArrayList<PaymentsInfoDto> selectPaymentsList(int userNo, PageInfo pi) {
		return mpd.selectPaymentsList(sqlSession, userNo, pi);
	}

	@Override
	public int selectScrapCount(int userNo) {
		return mpd.selectScrapCount(sqlSession, userNo);
	}

	@Override
	public ArrayList<Concert> selectScrapList(int userNo, PageInfo pi) {
		return mpd.selectScrapList(sqlSession, userNo, pi);
	}

	@Override
	public int selectReviewCount(int userNo) {
		return mpd.selectReviewCount(sqlSession, userNo);
	}

	@Override
	public ArrayList<Concert> selectReviewList(int userNo, PageInfo pi) {
		return mpd.selectReviewList(sqlSession, userNo, pi);
	}
	
	@Override
	public int selectMyInquireCount(int userNo) {
		return mpd.selectMyInquireCount(sqlSession, userNo);
	}

	@Override
	public ArrayList<Board> selectMyInquireList(int userNo, PageInfo pi) {
		return mpd.selectMyInquireList(sqlSession, userNo, pi);
	}
	
	@Override
	public Board selectMyInquireDetail(int boardNo) {
		return mpd.selectMyInquireDetail(sqlSession, boardNo);
	}
	
	@Override
	public Board loadAnswerAjax(int boardNo) {
		return mpd.loadAnswerAjax(sqlSession, boardNo);
	}

	@Override
	@Transactional
	public int deleteInquireAjax(int boardNo) {
		int result = mpd.deleteInquire(sqlSession, boardNo);
		
		if(mpd.loadAnswerAjax(sqlSession, boardNo) != null) {
			result *= mpd.deleteAnswer(sqlSession, boardNo);			
		}
		
		return result;
	}

	@Override
	public int deleteMyScrapAjax(Map<String, Integer> params) {
		return mpd.deleteMyScrapAjax(sqlSession, params);
	}

	@Override
	public ConcertReview loadOneLineReviewAjax(Map<String, Integer> params) {
		return mpd.loadOneLineReviewAjax(sqlSession, params);
	}

	@Override
	public int insertOneLineReview(ConcertReview concertReview) {
		return mpd.insertOneLineReview(sqlSession, concertReview);
	}

	@Override
	public int updateOneLineReview(ConcertReview concertReview) {
		return mpd.updateOneLineReview(sqlSession, concertReview);
	}
	
	@Override
	public int deleteOneLineReviewAjax(int reviewNo) {
		return mpd.deleteOneLineReviewAjax(sqlSession, reviewNo);

	}

	@Override
	public ArrayList<PaymentsInfoDto> loadMyPaymentsAjax(int userNo) {
		return mpd.loadMyPaymentsAjax(sqlSession, userNo);
	}

	@Override
	public ArrayList<Concert> loadMyScrapAjax(int userNo) {
		return mpd.loadMyScrapAjax(sqlSession, userNo);
	}

	@Override
	public ArrayList<ConcertReview> loadMyReviewAjax(int userNo) {
		return mpd.loadMyReviewAjax(sqlSession, userNo);
	}

	@Override
	public ArrayList<Board> loadMyBoardAjax(int userNo) {
		return mpd.loadMyBoardAjax(sqlSession, userNo);
	}

	@Override
	public ArrayList<Board> loadMyInquireAjax(int userNo) {
		return mpd.loadMyInquireAjax(sqlSession, userNo);
	}


	@Override
	public int checkExistAjax(int userNo, String info, int type) { //type - 1 : phone, 2 : email
		
		Map<String, Object> map = new HashMap<>();
		map.put("userNo", userNo);
		
		int result = 0; 
		
		switch(type) {
		case 1:
			map.put("phone", info);
			result = mpd.phoneCheck(sqlSession, map);
			break;
		case 2:
			map.put("email", info);
			result = mpd.emailCheck(sqlSession, map);
			break;
		}
		
		return result;
	}
	
}
