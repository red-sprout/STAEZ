package com.spring.staez.inquire.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.PlatformTransactionManager;
import org.springframework.transaction.TransactionDefinition;
import org.springframework.transaction.TransactionStatus;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.transaction.support.DefaultTransactionDefinition;

import com.spring.staez.admin.model.vo.Category;
import com.spring.staez.common.model.vo.PageInfo;
import com.spring.staez.community.model.vo.Board;
import com.spring.staez.inquire.model.dao.InquireDao;

@Service
public class InquireServiceImpl implements InquireService{
	
	@Autowired
	SqlSessionTemplate sqlSession;
	
	@Autowired
	InquireDao iDao;
	
	@Autowired
    private PlatformTransactionManager transactionManager;

	@Override
	public ArrayList<Category> selectCategory() {
		return iDao.selectCategory(sqlSession);
	}
	
	@Transactional
	@Override
	public int insertInquire(Board b,  int categoryNo) {
		int result1 = iDao.insertBoard(sqlSession, b);
		int result2 = iDao.insertBoardCategory(sqlSession, categoryNo);
		
		return result1 * result2;	
	}

	@Override
	public int ajaxSelectFaqCount() {
		return iDao.ajaxSelectFaqCount(sqlSession);
	}
	
	@Override
	public int ajaxSearchSelectFapCount(String option, String content) {
		
		if(option.equals("title")) { //옵션이 title일때
			return  iDao.titleSearchFaqCount(sqlSession ,content);
		} else { //옵션이 content일때
			return  iDao.contentSearchFaqCount(sqlSession ,content);
		}
	}

	@Override
	public ArrayList<Board> ajaxSearchSelectFap(String option, String content, PageInfo pi) {
		
		if(option.equals("title")) { //옵션이 title일때
			return  iDao.titleSearchFaq(sqlSession ,content, pi);
		} else { //옵션이 content일때
			return  iDao.contentSearchFaq(sqlSession ,content, pi);
		}
	}
	
	@Override
	public int ajaxSelectCategoryFaqCount(String categoryName) {
		
		if(categoryName.equals("전체")) {
			return iDao.ajaxSelectFaqCount(sqlSession);
		}else {
			return iDao.ajaxSelectCategoryFaqCount(sqlSession, categoryName);			
		}
		
	}	 

	@Override
	public ArrayList<Board> ajaxSelectCategoryFaq(String categoryName, PageInfo pi) {
		
		ArrayList<Board> faqs;
		if(categoryName.equals("전체")) {
			faqs = iDao.ajaxSelectFaq(sqlSession, pi);
		} else {
			faqs = iDao.ajaxSelectCategoryFaq(sqlSession, categoryName, pi);
		}
		return faqs;
	}

	@Override
	public ArrayList<Board> ajaxSelectFaq(PageInfo pi) {
		return iDao.ajaxSelectFaq(sqlSession, pi);
	}



}
