package com.spring.staez.mypage.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.staez.community.model.vo.Board;
import com.spring.staez.community.model.vo.BoardLike;
import com.spring.staez.mypage.model.dao.MypageDao;
import com.spring.staez.user.model.vo.ProfileImg;
import com.spring.staez.user.model.vo.User;

@Service
public class MypageServiceImpl implements MypageService{

	@Autowired
	public SqlSessionTemplate sqlSession;
	
	@Autowired
	public MypageDao mpd;
	
	@Override
	public User test() {
		return mpd.test(sqlSession);
	}

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
	public ArrayList<Board> selectMyBoardList(int userNo) {
		return mpd.selectMyBoardList(sqlSession, userNo);
	}

	@Override
	public int selectLikeBoardListCount(int userNo) {
		return mpd.selectLikeBoardListCount(sqlSession, userNo);
	}

	@Override
	public ArrayList<Board> selectLikeBoardList(int userNo) {
		return mpd.selectLikeBoardList(sqlSession, userNo);
	}

	
}
