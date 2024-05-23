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
	public ArrayList<Board> ajaxSelectFaq() {
		return iDao.ajaxSelectFaq(sqlSession);
	}

	@Override
	public ArrayList<Board> ajaxSearchSelectFap(String option, String content) {
		ArrayList<Board> faqs;

		if(option.equals("title")) { //옵션이 title일때
			faqs = iDao.titleSearchFaq(sqlSession ,content);
		} else { //옵션이 content일때
			faqs = iDao.contentSearchFaq(sqlSession ,content);
		}
		
		return faqs;
	}

	@Override
	public ArrayList<Board> ajaxSelectCategoryFaq(String categoryName) {
		ArrayList<Board> faqs;
		if(categoryName.equals("전체")) {
			faqs = iDao.ajaxSelectFaq(sqlSession);
		} else {
			faqs = iDao.ajaxSelectCategoryFaq(sqlSession, categoryName);
		}
		return faqs;
	}	 

}
