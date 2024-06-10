package com.spring.staez.concert.service;

import java.util.ArrayList;
import java.util.Map;

import com.spring.staez.admin.model.vo.Category;
import com.spring.staez.admin.model.vo.Seat;
import com.spring.staez.common.model.vo.PageInfo;
import com.spring.staez.community.model.vo.Board;
import com.spring.staez.concert.model.vo.Concert;
import com.spring.staez.concert.model.vo.ConcertLike;
import com.spring.staez.concert.model.vo.ConcertReview;




public interface ConcertService {


	Category selectCate(int categoryNo);
//	// 콘서트가 총 몇개인가
//	int selectConCount();
//
//	//콘서트 내용 페이지네이션해서 가져와라
//	ArrayList<Concert> concertList();
	
	// category를 가져와라 콘서트 네비에 뿌려주기
	ArrayList<Category> selectCateCon();

	// 콘서트 왕창 가져와라
	ArrayList<Concert> selectconList(int categoryNo);

	// 콘서트 no로 콘서트 하나 가져와라: 세부페이지 열기
	Concert selectCon(int concertNo);
	
	
	// 공연세부페이지, 판매정보
	ArrayList<Concert> selectConDetail(int concertNo);
	// 한줄평
	int selectComCount(int concertNo);
	ArrayList<ConcertReview> selectComDetail(int concertNo);
	// 리뷰
	ArrayList<Board> selectRevDetail(int concertNo);


	// 좋아요 관련
	int selectConLikeCount(int concertNo);

	int selectUserConLike(Map map);

	int selectUserConLikeAll(Map map);

	int updateConLike(ConcertLike like);

	int insertConLike(ConcertLike like);
	

	// 콘서트 인기순, 최신순, 평점순, 지역순 목록
	ArrayList<Concert> popularList(int categoryNo);

	ArrayList<Concert> latestList(int categoryNo);

	ArrayList<Concert> highscoreList(int categoryNo);

	ArrayList<Concert> locationAllList(Map map);
	
	
	// 페이지네이션 한줄평
	ArrayList<ConcertReview> selectComList(PageInfo pi, int concertNo);
	// 페이지네이션 리뷰
	int selectRevCount(int concertNo);
	ArrayList<Board> selectRevList(PageInfo pi, int concertNo);

	ArrayList<Seat> selectSeatPrice(int concertNo);

	

	

//	// 좋아요 insert, 
//    int insertConLike(ConcertLike conL);
//    int updateLikeYtoN(ConcertLike conL);
//    int updateLikeNtoY(ConcertLike conL);










	
	





}
