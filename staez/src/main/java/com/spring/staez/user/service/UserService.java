package com.spring.staez.user.service;

import com.spring.staez.user.model.vo.User;

public interface UserService {
	
	public User loginUser(User u);
	
	//id check를 위한 서비스
	int idCheck(String checkId);
	
	//nick check를 위한 서비스
	int nickCheck(String checkNick);
	
	//회원가입
	int insertUser(User u);
	
	// 이메일 체크를 위한 서비스
	int emailCheck(String checkEmail);
	
	// 네이버로그인 이메일 유무 확인
	User findUserByEmail(String email);
}
