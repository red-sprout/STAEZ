package com.spring.staez.others.service;

import java.util.ArrayList;

import com.spring.staez.admin.model.vo.Category;
import com.spring.staez.common.model.vo.PageInfo;
import com.spring.staez.concert.model.vo.Concert;

public interface OthersService {
	
	ArrayList<Category> selectCategory();
	
	ArrayList<Concert> selectCategoryConcert(int cNo);
	
	ArrayList<Concert> selectCategoryConcertImg(int cNo);
	
	ArrayList<Concert> selectLatestCategoryConcert(int cNo);
	
	ArrayList<Concert> selectLatestCategoryConcertImg(int cNo);
	
	ArrayList<Concert> selectDateCategoryConcert(String categoryNo, String concertDate);
	
	ArrayList<Concert> selectPageConcert(String categoryNo, String concertDate, PageInfo pi);
}
