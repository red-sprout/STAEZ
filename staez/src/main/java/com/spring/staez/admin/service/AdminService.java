package com.spring.staez.admin.service;

import java.util.ArrayList;
import java.util.List;

import com.google.gson.JsonElement;
import com.spring.staez.admin.model.dto.AdminBoardDto;
import com.spring.staez.admin.model.dto.AdminBoardSelectDto;
import com.spring.staez.admin.model.dto.AdminConcertSelectDto;
import com.spring.staez.admin.model.dto.AdminSearchDto;
import com.spring.staez.admin.model.dto.AdminTheaterSelectDto;
import com.spring.staez.admin.model.dto.AdminUpdateDto;
import com.spring.staez.admin.model.vo.Category;
import com.spring.staez.admin.model.vo.ConcertSchedule;
import com.spring.staez.admin.model.vo.ImpossibleSeat;
import com.spring.staez.admin.model.vo.Seat;
import com.spring.staez.common.model.vo.PageInfo;
import com.spring.staez.community.model.vo.Board;
import com.spring.staez.concert.model.vo.Concert;
import com.spring.staez.concert.model.vo.ConcertAttachment;
import com.spring.staez.concert.model.vo.Theater;
import com.spring.staez.user.model.vo.Reserve;
import com.spring.staez.user.model.vo.User;

public interface AdminService {

	int faqInsert(Board b, int categoryNo);

	ArrayList<Category> selectFaqCategory(int refCategoryNo);

	int insertTheater(Theater t);

	int toggleSeat(ImpossibleSeat seat, String status);

	ArrayList<Theater> selectTheaterList(String keyword);

	int concertInsert(List<ConcertSchedule> scheduleList, List<Seat> seatList, Concert c);
	
	ArrayList<Concert> selectConcertContentList(PageInfo pi, String keyword);
	 
	ArrayList<Concert> selectConcertImgList(PageInfo pi, String keyword);
	
	int selectConcertContentListCount(String keyword);
	
	int selectTheaterListCount(String keyword);
	
	ArrayList<Theater> selectTheaterList(PageInfo pi, String keyword);

	int selectBoardCnt(AdminSearchDto dto);

	ArrayList<User> selectBoard(AdminSearchDto dto, PageInfo pi);

	int deleteBoard(AdminBoardSelectDto dto);

	int updateBoardCategory(AdminBoardSelectDto dto);

	int selectFaqCnt(AdminSearchDto dto);

	ArrayList<Board> selectFaq(AdminSearchDto dto, PageInfo pi);

	Board selectOneBoard(int boardNo);

	int updateOneBoard(AdminBoardDto dto);

	int insertOneBoard(Board board);

	int selectInquireCnt(AdminSearchDto dto);

	ArrayList<Board> selectInquire(AdminSearchDto dto, PageInfo pi);

	int selectReportCnt(AdminSearchDto dto);

	ArrayList<Board> selectReport(AdminSearchDto dto, PageInfo pi);

	int selectReserveCnt(AdminSearchDto dto);

	ArrayList<Reserve> selectReserve(AdminSearchDto dto, PageInfo pi);

	int updateReserve(AdminUpdateDto dto);

	Theater selectTheater(int theaterNo);

	ArrayList<ImpossibleSeat> selectImpossibleSeat(int theaterNo);

	int updateTheater(Theater t);

	int deleteTheater(AdminTheaterSelectDto dto);

	int deleteConcert(AdminConcertSelectDto dto);

	Concert selectConcert(int concertNo);

	Theater selectConcertTheater(int concertNo);

	ArrayList<ConcertSchedule> selectConcertSchedule(int concertNo);

	ArrayList<Seat> selectSeat(int concertNo);

	int concertUpdate(List<ConcertSchedule> scheduleList, List<Seat> seatList, Concert c);

	int concertAttachmentUpdate(ConcertAttachment attachment);

}
