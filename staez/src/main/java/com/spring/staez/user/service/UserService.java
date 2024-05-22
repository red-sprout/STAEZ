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
}
