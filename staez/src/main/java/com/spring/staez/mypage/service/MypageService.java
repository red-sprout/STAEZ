package com.spring.staez.mypage.service;

import com.spring.staez.user.model.vo.ProfileImg;
import com.spring.staez.user.model.vo.User;

public interface MypageService {
	public User test();
	
	public int duplicateCheck(String nickname); //닉네임 체크

	public int passwordCheck(String inputPwd); //비밀번호 체크
	public int updatePassword(User user); //비밀번호 변경
	
	public int updateUserInfo(User user);//회원정보 변경
	
	public int updateProfileImg(ProfileImg profileImg);//프로필이미지 변경
	public int insertProfileImg(ProfileImg profileImg);//프로필이미지 추가
}
