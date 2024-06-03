package com.spring.staez.concert.service;

import java.util.ArrayList;
import java.util.HashMap;

import com.spring.staez.admin.model.vo.Category;
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
	
	
	// 좋아요 버튼 SET
	// 콘서트 좋아요 버튼 클릭한 적 있냐?

	
//	 // 콘서트 좋아요 버튼 클릭한 적 있냐?
//	ArrayList<ConcertLike> checkConLike(int userNo, int concertNo);
//	
//
	ArrayList<Concert> selectConDetail(int concertNo);

	ArrayList<ConcertReview> selectComDetail(int concertNo);

	ArrayList<ConcertReview> selectRevDetail(int concertNo);

	
	// 좋아요 갯수 가져와라
	ArrayList<ConcertLike> checkLikeExist(int concertNo);

	



//	// 좋아요 insert, 
//    int insertConLike(ConcertLike conL);
//    int updateLikeYtoN(ConcertLike conL);
//    int updateLikeNtoY(ConcertLike conL);










	
	





}
