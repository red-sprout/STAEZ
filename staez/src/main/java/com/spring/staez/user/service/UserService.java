package com.spring.staez.user.service;

import java.time.LocalDateTime;

import com.spring.staez.user.model.vo.User;

public interface UserService {
	
	public User loginUser(User u);
	
	//id check를 위한 서비스
	int idCheck(String checkId);
	
	//nick check를 위한 서비스
	int nickCheck(String checkNick);
	
	//회원가입
	int insertUser(User u);
	
	// 네이버로그인 이메일 유무 확인
	User findUserByEmail(String email);
	
	// 이메일 인증번호 저장을 위한 서비스
	 int registerUser(String email, String authNo, LocalDateTime send_time);

	 // 이메일 암호키 인증체크
	int emailSecretCodeCheck(String authNo, String email);
	
	//이메일로 아이디찾기
	String findEmailCheck(String checkFindEmail);

	//새로운 비밀번호 저장
	int insertNewPwd(User u);
}
