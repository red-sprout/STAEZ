package com.spring.staez.inquire.service;

import java.util.ArrayList;

import com.spring.staez.admin.model.vo.Category;
import com.spring.staez.community.model.vo.Board;

public interface InquireService {
	
	//1대1문의 onload될때 가져와야하는 데이터
	ArrayList<Category> selectCategory();
	
	//문의 작성하기
	int insertInquire(Board b, int categoryNo);
	
	ArrayList<Board> ajaxSelectFaq();
	
	ArrayList<Board> ajaxSearchSelectFap(String option, String content);
	
	ArrayList<Board> ajaxSelectCategoryFaq(String categoryName);
}
