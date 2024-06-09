package com.spring.staez.admin.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.spring.staez.admin.model.dao.AdminDao;
import com.spring.staez.admin.model.dto.AdminBoardDto;
import com.spring.staez.admin.model.dto.AdminBoardSelectDto;
import com.spring.staez.admin.model.dto.AdminSearchDto;
import com.spring.staez.admin.model.dto.AdminUpdateDto;
import com.spring.staez.admin.model.vo.Category;
import com.spring.staez.admin.model.vo.ConcertSchedule;
import com.spring.staez.admin.model.vo.ImpossibleSeat;
import com.spring.staez.admin.model.vo.Seat;
import com.spring.staez.common.model.vo.PageInfo;
import com.spring.staez.common.template.ImpossibleSeatList;
import com.spring.staez.community.model.vo.Board;
import com.spring.staez.concert.model.vo.Concert;
import com.spring.staez.concert.model.vo.Theater;
import com.spring.staez.user.model.vo.Reserve;
import com.spring.staez.user.model.vo.User;

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
	public int faqInsert(Board b, int categoryNo) {
		int result1 = adminDao.faqInsert(sqlSession, b);
		int result2 = adminDao.faqCategoryInsert(sqlSession, categoryNo);
		return result1 * result2;
	}

	@Transactional(rollbackFor = {Exception.class})
	@Override
	public int insertTheater(Theater t) {
		int result1 = adminDao.insertTheater(sqlSession, t);
		int result2 = adminDao.insertImpossibleSeat(sqlSession);
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

	@Transactional(readOnly = true)
	@Override
	public ArrayList<Concert> selectConcertContentList(PageInfo pi) {
		return adminDao.selectConcertContentList(sqlSession, pi);
	}

	@Transactional(readOnly = true)
	@Override
	public ArrayList<Concert> selectConcertImgList(PageInfo pi) {
		return adminDao.selectConcertImgList(sqlSession, pi);
	}

	@Transactional(readOnly = true)
	@Override
	public int selectConcertContentListCount() {
		return adminDao.selectConcertContentListCount(sqlSession);
	}

	@Transactional(readOnly = true)
	@Override
	public int selectTheaterListCount() {
		return adminDao.selectTheaterListCount(sqlSession);
	}

	@Transactional(readOnly = true)
	@Override
	public ArrayList<Theater> selectTheaterList(PageInfo pi) {
		return adminDao.selectTheaterList(sqlSession, pi);
	}

	@Transactional(readOnly = true)
	@Override
	public int selectBoardCnt(AdminSearchDto dto) {
		return adminDao.selectBoardCnt(sqlSession, dto);
	}

	@Transactional(readOnly = true)
	@Override
	public ArrayList<User> selectBoard(AdminSearchDto dto, PageInfo pi) {
		return adminDao.selectBoard(sqlSession, dto, pi);
	}

	@Transactional(rollbackFor = {Exception.class})
	@Override
	public int deleteBoard(AdminBoardSelectDto dto) {
		return adminDao.deleteBoard(sqlSession, dto);
	}

	@Transactional(rollbackFor = {Exception.class})
	@Override
	public int updateBoardCategory(AdminBoardSelectDto dto) {
		int deleteResult = 1;
		Map<String, Integer> boardInfoOrigin = new HashMap<>();
		for(int boardNo : dto.getBoardList()) {	
			boardInfoOrigin.put("boardNo", boardNo);
			boardInfoOrigin.put("categoryNo", selectBoardCategory(boardNo, dto.getCategoryNo(), dto.getCategoryLevel()));
			
			deleteResult *= adminDao.deleteBoardCategory(sqlSession, boardInfoOrigin);
		}
		
		if(deleteResult == 0)
			throw new RuntimeException("관리자 - 카테고리 삭제 실패");

		int insertResult = adminDao.insertBoardCategory(sqlSession, dto);
		
		if(insertResult == 0)
			throw new RuntimeException("관리자 - 카테고리 삽입 실패");
		
		return deleteResult * insertResult;
	}
	
	// 여러 카테고리 중 알맞은 카테고리를 선택하는 항목
	public int selectBoardCategory(int boardNo, int categoryNo, int categoryLevel) {
		Map<String, Integer> boardCategoryLevel = new HashMap<>();
		boardCategoryLevel.put("boardNo", boardNo);
		boardCategoryLevel.put("categoryLevel", categoryLevel);
		int categoryNoOrigin = adminDao.selectBoardCategory(sqlSession, boardCategoryLevel);
		
		return categoryNoOrigin;
	}

	@Transactional(readOnly = true)
	@Override
	public int selectFaqCnt(AdminSearchDto dto) {
		return adminDao.selectFaqCnt(sqlSession, dto);
	}

	@Transactional(readOnly = true)
	@Override
	public ArrayList<Board> selectFaq(AdminSearchDto dto, PageInfo pi) {
		return adminDao.selectFaq(sqlSession, dto, pi);
	}

	@Transactional(readOnly = true)
	@Override
	public Board selectOneBoard(int boardNo) {
		return adminDao.selectOneBoard(sqlSession, boardNo);
	}

	@Transactional(rollbackFor = {Exception.class})
	@Override
	public int updateOneBoard(AdminBoardDto dto) {
		int updateBoardResult = adminDao.updateOneBoard(sqlSession, dto);
		int updateCategoryResult = adminDao.updateOneCategory(sqlSession, dto);
		
		if(updateBoardResult == 0) 
			throw new RuntimeException("보드 정보 수정 실패");
		
		if(updateCategoryResult == 0) 
			throw new RuntimeException("보드 카테고리 수정 실패");
		
		return updateBoardResult * updateCategoryResult;
	}

	@Transactional(rollbackFor = {Exception.class})
	@Override
	public int insertOneBoard(Board board) {
		return adminDao.insertOneBoard(sqlSession, board);
	}

	@Transactional(readOnly = true)
	@Override
	public int selectInquireCnt(AdminSearchDto dto) {
		return adminDao.selectInquireCnt(sqlSession, dto);
	}

	@Transactional(readOnly = true)
	@Override
	public ArrayList<Board> selectInquire(AdminSearchDto dto, PageInfo pi) {
		return adminDao.selectInquire(sqlSession, dto, pi);
	}

	@Transactional(readOnly = true)
	@Override
	public int selectReportCnt(AdminSearchDto dto) {
		return adminDao.selectReportCnt(sqlSession, dto);
	}

	@Transactional(readOnly = true)
	@Override
	public ArrayList<Board> selectReport(AdminSearchDto dto, PageInfo pi) {
		return adminDao.selectReport(sqlSession, dto, pi);
	}

	@Transactional(readOnly = true)
	@Override
	public int selectReserveCnt(AdminSearchDto dto) {
		return adminDao.selectReserveCnt(sqlSession, dto);
	}

	@Transactional(readOnly = true)
	@Override
	public ArrayList<Reserve> selectReserve(AdminSearchDto dto, PageInfo pi) {
		return adminDao.selectReserve(sqlSession, dto, pi);
	}

	@Transactional(rollbackFor = {Exception.class})
	@Override
	public int updateReserve(AdminUpdateDto dto) {
		int result = 1;
		Map<String, Object> map = new HashMap<>();
		map.put("reserveStatus", dto.getReserveStatus());
		for(int reserveNo : dto.getReserveList()) {
			map.put("reserveNo", reserveNo);
			result *= adminDao.updateReserve(sqlSession, map);
			if (result == 0) 
				throw new RuntimeException("Reserve update 실패");
		}
		return result;
	}
}
