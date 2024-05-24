package com.spring.staez.mypage.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.staez.mypage.model.dao.MypageDao;
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

	
}
