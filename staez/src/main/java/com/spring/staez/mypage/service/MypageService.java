package com.spring.staez.mypage.service;

import java.util.ArrayList;

import com.spring.staez.community.model.vo.Board;
import com.spring.staez.community.model.vo.BoardLike;
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
	
	public int withdrawalUser(User user); // 회원탈퇴
	
	public int selectMyBoardListCount(int userNo); //나의 작성 게시글 개수
	public ArrayList<Board> selectMyBoardList(int userNo); //나의 작성 게시글 리스트

	public int selectLikeBoardListCount(int userNo); //나의 좋아요 누른 게시글 개수
	public ArrayList<Board> selectLikeBoardList(int userNo); //나의 좋아요 누른 게시글 리스트
}
