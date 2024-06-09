package com.spring.staez.user.service;


import java.util.Map;

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
	 int registerUser(String email, String authNo);

	 // 이메일 암호키 인증체크
	int emailSecretCodeCheck(String authNo, String email);
	
	// 이메일 존재 여부 확인
	Map<String, Object> findEmail(String email);
	
	//이메일로 아이디찾기
	String findEmailCheck(String checkFindEmail, String userName);

	// 유효성 검사 및 사용자 정보 확인
	String findUserByIdEmailPhone(String user_id, String phone, String email, String user_name);

	// 새로운 비밀번호 저장
	int updatePassword(String user_id, String phone, String email, String user_name, String encPwd);

	// 이메일 인증 완료하면 정보 업데이트(테이블에 이메일 데이터 있을때)
	int updateEmailAuth(String email, String authNo);

}
