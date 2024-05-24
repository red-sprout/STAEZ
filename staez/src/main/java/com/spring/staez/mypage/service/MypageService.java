package com.spring.staez.mypage.service;

import com.spring.staez.user.model.vo.User;

public interface MypageService {
	public User test();
	
	public int duplicateCheck(String nickname); //닉네임 체크

	public int passwordCheck(String inputPwd); //비밀번호 체크
	public int updatePassword(User user); //비밀번호 변경
}
