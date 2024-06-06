package com.spring.staez.admin.service;

import java.util.ArrayList;
import java.util.List;

import com.spring.staez.admin.model.dto.AdminBoardSelectDto;
import com.spring.staez.admin.model.dto.AdminSearchDto;
import com.spring.staez.admin.model.vo.Category;
import com.spring.staez.admin.model.vo.ConcertSchedule;
import com.spring.staez.admin.model.vo.ImpossibleSeat;
import com.spring.staez.admin.model.vo.Seat;
import com.spring.staez.common.model.vo.PageInfo;
import com.spring.staez.community.model.vo.Board;
import com.spring.staez.concert.model.vo.Concert;
import com.spring.staez.concert.model.vo.Theater;
import com.spring.staez.user.model.vo.User;

public interface AdminService {

	int faqIncert(Board b, int categoryNo);

	ArrayList<Category> selectFaqCategory(int refCategoryNo);

	int incertTheater(Theater t);

	int toggleSeat(ImpossibleSeat seat, String status);

	ArrayList<Theater> selectTheaterList(String keyword);

	int concertInsert(List<ConcertSchedule> scheduleList, List<Seat> seatList, Concert c);
	
	ArrayList<Concert> selectConcertContentList(PageInfo pi);
	 
	ArrayList<Concert> selectConcertImgList(PageInfo pi);
	
	int selectConcertContentListCount();
	
	int selectTheaterListCount();
	
	ArrayList<Theater> selectTheaterList(PageInfo pi);

	int selectBoardCnt(AdminSearchDto dto);

	ArrayList<User> selectBoard(AdminSearchDto dto, PageInfo pi);

	int deleteBoard(AdminBoardSelectDto dto);

	int updateBoardCategory(AdminBoardSelectDto dto);

}
