package com.spring.staez.mypage.service;

import java.util.ArrayList;

import com.spring.staez.common.model.vo.PageInfo;
import com.spring.staez.community.model.dto.BoardListDto;
import com.spring.staez.concert.model.vo.Concert;
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
	public ArrayList<BoardListDto> selectMyBoardList(int userNo, PageInfo pi); //나의 작성 게시글 리스트

	public int selectLikeBoardListCount(int userNo); //나의 좋아요 누른 게시글 개수
	public ArrayList<BoardListDto> selectLikeBoardList(int userNo, PageInfo pi); //나의 좋아요 누른 게시글 리스트
	
	public int selectPaymentsCount(int userNo); //결제내역 개수
	public ArrayList<Concert> selectPaymentsList(int userNo, PageInfo pi); //결제내역 리스트

	public int selectScrapCount(int userNo); //찜목록 개수
	public ArrayList<Concert> selectScrapList(int userNo, PageInfo pi); //찜목록 리스트

	public int selectReviewCount(int userNo); //한줄평 개수
	public ArrayList<Concert> selectReviewList(int userNo, PageInfo pi); //한줄평 리스트
	
}
