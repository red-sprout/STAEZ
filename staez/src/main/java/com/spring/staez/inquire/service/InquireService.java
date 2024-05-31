package com.spring.staez.inquire.service;

import java.util.ArrayList;

import com.spring.staez.admin.model.vo.Category;
import com.spring.staez.common.model.vo.PageInfo;
import com.spring.staez.community.model.vo.Board;

public interface InquireService {
	
	//1대1문의 onload될때 가져와야하는 데이터
	ArrayList<Category> selectCategory();
	
	//문의 작성하기
	int insertInquire(Board b, int categoryNo);
	
	int ajaxSelectFaqCount();
	
	ArrayList<Board> ajaxSelectFaq(PageInfo pi);
	
	int ajaxSearchSelectFapCount(String option, String content);
	
	ArrayList<Board> ajaxSearchSelectFap(String option, String content, PageInfo pi);
	
	int ajaxSelectCategoryFaqCount(String categoryName);
	
	ArrayList<Board> ajaxSelectCategoryFaq(String categoryName, PageInfo pi);
}
