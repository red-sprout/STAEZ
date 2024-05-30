package com.spring.staez.admin.service;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.spring.staez.admin.model.dao.AdminDao;
import com.spring.staez.admin.model.vo.Category;
import com.spring.staez.admin.model.vo.ConcertSchedule;
import com.spring.staez.admin.model.vo.ImpossibleSeat;
import com.spring.staez.admin.model.vo.Seat;
import com.spring.staez.common.model.vo.PageInfo;
import com.spring.staez.common.template.ImpossibleSeatList;
import com.spring.staez.community.model.vo.Board;
import com.spring.staez.concert.model.vo.Concert;
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
		return adminDao.selectTheaterList(sqlSession, keyword);
	}

	@Transactional(rollbackFor = {Exception.class})
	@Override
	public int concertInsert(List<ConcertSchedule> scheduleList, List<Seat> seatList, Concert c) {
		return adminDao.insertConcert(sqlSession, c)
				* adminDao.insertConcertCategory(sqlSession, c)
				* adminDao.insertConcertAttachment(sqlSession, c)
				* adminDao.insertScheduleList(sqlSession, scheduleList)
				* adminDao.insertSeatList(sqlSession, seatList);
	}

	@Override
	public ArrayList<Concert> selectConcertContentList(PageInfo pi) {
		return adminDao.selectConcertContentList(sqlSession, pi);
	}

	@Override
	public ArrayList<Concert> selectConcertImgList(PageInfo pi) {
		return adminDao.selectConcertImgList(sqlSession, pi);
	}

	@Override
	public int selectConcertContentListCount() {
		return adminDao.selectConcertContentListCount(sqlSession);
	}

	@Override
	public int selectTheaterListCount() {
		return adminDao.selectTheaterListCount(sqlSession);
	}

	@Override
	public ArrayList<Theater> selectTheaterList(PageInfo pi) {
		return adminDao.selectTheaterList(sqlSession, pi);
	}
}
