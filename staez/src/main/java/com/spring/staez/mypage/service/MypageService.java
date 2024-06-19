package com.spring.staez.mypage.service;

import java.util.ArrayList;
import java.util.Map;

import com.spring.staez.common.model.vo.PageInfo;
import com.spring.staez.community.model.dto.BoardListDto;
import com.spring.staez.community.model.vo.Board;
import com.spring.staez.concert.model.vo.Concert;
import com.spring.staez.concert.model.vo.ConcertReview;
import com.spring.staez.user.model.dto.PaymentsInfoDto;
import com.spring.staez.user.model.vo.ProfileImg;
import com.spring.staez.user.model.vo.User;

public interface MypageService {
	public int duplicateCheck(String nickname); //닉네임 체크

	public int passwordCheck(String inputPwd); //비밀번호 체크
	public int updatePassword(User user); //비밀번호 변경
	
	public int updateUserInfo(User user);//회원정보 변경
	
	public ProfileImg loadProfileImg(int userNo); //프로필이미지 불러오기
	public int updateProfileImg(ProfileImg profileImg);//프로필이미지 변경
	public int insertProfileImg(ProfileImg profileImg);//프로필이미지 추가
	
	public int withdrawalUser(User user); // 회원탈퇴
	
	public int selectMyBoardListCount(int userNo); //나의 작성 게시글 개수
	public ArrayList<BoardListDto> selectMyBoardList(int userNo, PageInfo pi); //나의 작성 게시글 리스트
	public int selectMyBoardSearchListCount(Map<String, Object> map); //검색한 나의 작성 게시글 개수
	public ArrayList<BoardListDto> selectMyBoardSearchList(Map<String, Object> map, PageInfo pi); //검색한 나의 작성 게시글 리스트

	public int selectLikeBoardListCount(int userNo); //나의 좋아요 누른 게시글 개수
	public ArrayList<BoardListDto> selectLikeBoardList(int userNo, PageInfo pi); //나의 좋아요 누른 게시글 리스트
	public int selectLikeBoardSearchListCount(Map<String, Object> map); //검색한 나의 좋아요 누른 게시글 개수
	public ArrayList<BoardListDto> selectLikeBoardSearchList(Map<String, Object> map, PageInfo pi); //검색한 나의 좋아요 누른 게시글 리스트
	
	public int selectPaymentsCount(int userNo); //결제내역 개수
	public ArrayList<PaymentsInfoDto> selectPaymentsList(int userNo, PageInfo pi); //결제내역 리스트

	public int selectScrapCount(int userNo); //찜목록 개수
	public ArrayList<Concert> selectScrapList(int userNo, PageInfo pi); //찜목록 리스트

	public int selectReviewCount(int userNo); //한줄평 개수
	public ArrayList<Concert> selectReviewList(int userNo, PageInfo pi); //한줄평 리스트
	
	public int selectMyInquireCount(int userNo); //문의내역 개수
	public ArrayList<Board> selectMyInquireList(int userNo, PageInfo pi); //문의내역 리스트
	public Board selectMyInquireDetail(int boardNo); //문의 상세페이지
	public Board loadAnswerAjax(int boardNo); //문의 답변 불러오기 ajax	
	public int deleteInquireAjax(int boardNo); //문의글 삭제 ajax
	
	public int deleteMyScrapAjax(Map<String, Integer> params); //찜목록 삭제
	
	public ConcertReview loadOneLineReviewAjax(Map<String, Integer> params); //한줄평 작성을 위한 공연 정보 가져오기
	
	public int insertOneLineReview(ConcertReview concertReview); //한줄평 저장
	public int updateOneLineReview(ConcertReview concertReview); //한줄평 수정
		
	public ArrayList<PaymentsInfoDto> loadMyPaymentsAjax(int userNo); //결제내역 ajax
	public ArrayList<Concert> loadMyScrapAjax(int userNo); //찜목록 ajax
	public ArrayList<ConcertReview> loadMyReviewAjax(int userNo); //한줄평 ajax
	public ArrayList<Board> loadMyBoardAjax(int userNo); //나의작성글 ajax
	public ArrayList<Board> loadMyInquireAjax(int userNo); //문의내역 ajax
	
//	public int checkExistAjax(String info, int type); //이미 존재하는 데이터인지 확인
	
}
