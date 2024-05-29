package com.spring.staez.user.service;

import java.time.LocalDateTime;

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

	// 네이버로그인 이메일 유무 확인
	@Override
	public User findUserByEmail(String email) {
        return userDao.findUserByEmail(sqlSession,email);
    }

	// 이메일 인증번호 저장을 위한 서비스
	@Override
	public int registerUser(String email, String authNo, LocalDateTime send_time) {
        return userDao.registerUser(email, authNo, send_time);
    }
	
	//암호키 인증체크
	@Override
	public int emailSecretCodeCheck(String uuidCheck, String email) {
		return userDao.emailSecretCodeCheck(sqlSession, uuidCheck, email);
	}

}
