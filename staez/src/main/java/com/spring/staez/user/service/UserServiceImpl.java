package com.spring.staez.user.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.staez.user.model.dao.UserDao;
import com.spring.staez.user.model.vo.User;

@Service
public class UserServiceImpl implements UserService{
	
	@Autowired
	SqlSessionTemplate sqlSession;
	
	@Autowired
	UserDao userDao;

	@Override
	public User loginUser(User u) {
		return userDao.loginUser(sqlSession, u);
	}
	
	@Override //회원가입 아이디 중복체크
	public int idCheck(String checkId) {
		return userDao.idCheck(sqlSession, checkId);
	}
	
	@Override //회원가입 닉네임 중복체크
	public int nickCheck(String checkNick) {
		return userDao.nickCheck(sqlSession, checkNick);
	}

//	회원가입
	@Override
	public int insertUser(User u) {
		return userDao.insertUser(sqlSession, u);
	}

}
