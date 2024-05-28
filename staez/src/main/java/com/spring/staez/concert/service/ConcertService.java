package com.spring.staez.concert.service;

import java.util.ArrayList;

import com.spring.staez.admin.model.vo.Category;
import com.spring.staez.concert.model.vo.Concert;

public interface ConcertService {


//	// 콘서트가 총 몇개인가
//	int selectConCount();
//
//	//콘서트 내용 페이지네이션해서 가져와라
//	ArrayList<Concert> concertList();
	
	// category를 가져와라 콘서트 네비에 뿌려주기
	ArrayList<Category> selectCateCon();

	ArrayList<Concert> selectconList();

	Concert selectCon(int concertNo);


	
	





}
