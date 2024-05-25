package com.spring.staez.admin.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.spring.staez.admin.model.dao.AdminDao;
import com.spring.staez.admin.model.vo.Category;
import com.spring.staez.admin.model.vo.ImpossibleSeat;
import com.spring.staez.common.template.ImpossibleSeatList;
import com.spring.staez.community.model.vo.Board;
import com.spring.staez.concert.model.vo.Theater;

@Service
public class AdminServiceImpl implements AdminService {

	@Autowired
	SqlSessionTemplate sqlSession;
	
	@Autowired
	AdminDao adminDao;

	@Transactional(readOnly = true)
	@Override
	public ArrayList<Category> selectFaqCategory(int refCategoryNo) {
		return adminDao.selectFaqCategory(sqlSession, refCategoryNo);
	}

	@Transactional(rollbackFor = {Exception.class})
	@Override
	public int faqIncert(Board b, int categoryNo) {
		int result1 = adminDao.faqIncert(sqlSession, b);
		int result2 = adminDao.faqCategoryIncert(sqlSession, categoryNo);
		return result1 * result2;
	}

	@Transactional(rollbackFor = {Exception.class})
	@Override
	public int incertTheater(Theater t) {
		int result1 = adminDao.incertTheater(sqlSession, t);
		int result2 = adminDao.incertImpossibleSeat(sqlSession);
		ImpossibleSeatList.clear();
		return result1 * result2;
	}

	@Override
	public int toggleSeat(ImpossibleSeat seat, String status) {			
		return status.equals("Y") 
				? ImpossibleSeatList.add(seat) 
				: ImpossibleSeatList.remove(seat);
	}

	@Transactional(readOnly = true)
	@Override
	public ArrayList<Theater> selectTheaterList(String keyword) {
		return adminDao.selectTheacterList(sqlSession, keyword);
	}
}
