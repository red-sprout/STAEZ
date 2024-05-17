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
	public MypageDao md;
	
	@Override
	public User test() {
		return md.test(sqlSession);
	}
	
}
