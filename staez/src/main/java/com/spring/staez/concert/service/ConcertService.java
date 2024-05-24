package com.spring.staez.concert.service;

import java.util.ArrayList;

import com.google.gson.JsonElement;
import com.spring.staez.common.model.vo.PageInfo;
import com.spring.staez.concert.model.vo.Concert;

public interface ConcertService {


	// 콘서트가 총 몇개인가
	int selectConCount();

	//콘서트 내용 페이지네이션해서 가져와라
	ArrayList<Concert> concertList();

	ArrayList<Concert> selectconSliderList();
	
//	// concertNo로 콘서트 가져오기
//	Concert selectCon(int concertNo);
//	





}
