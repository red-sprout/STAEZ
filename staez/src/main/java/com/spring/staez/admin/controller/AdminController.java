package com.spring.staez.admin.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestPart;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.google.gson.reflect.TypeToken;
import com.spring.staez.admin.model.dto.AdminBoardDto;
import com.spring.staez.admin.model.dto.AdminBoardSelectDto;
import com.spring.staez.admin.model.dto.AdminSearchDto;
import com.spring.staez.admin.model.vo.Category;
import com.spring.staez.admin.model.vo.ConcertSchedule;
import com.spring.staez.admin.model.vo.ImpossibleSeat;
import com.spring.staez.admin.model.vo.Seat;
import com.spring.staez.admin.service.AdminService;
import com.spring.staez.common.model.vo.PageInfo;
import com.spring.staez.common.template.MyFileRenamePolicy;
import com.spring.staez.common.template.Pagination;
import com.spring.staez.community.model.vo.Board;
import com.spring.staez.concert.model.vo.Concert;
import com.spring.staez.concert.model.vo.Theater;
import com.spring.staez.user.model.vo.User;

@Controller
public class AdminController {
	
	@Autowired
	AdminService adminService;
	
	@GetMapping("concertList.ad")
	public String concertMain() {
		return "admin/concertMain";
	}

	@GetMapping("theaterList.ad")
	public String theaterMain() {
		return "admin/theaterMain";
	}
	
	@GetMapping("communityList.ad")
	public String communityMain() {
		return "admin/communityMain";
	}
	
	@GetMapping("categoryList.ad")
	public String categoryMain() {
		return "admin/categoryMain";
	}
	
	@GetMapping("faqList.ad")
	public String faqMain() {
		return "admin/faqMain";
	}
	
	@GetMapping("inquireList.ad")
	public String inquireMain() {
		return "admin/inquireMain";
	}
	
	@GetMapping("reportList.ad")
	public String reportMain() {
		return "admin/reportMain";
	}
	
	@GetMapping("faqInsertForm.ad")
	public String faqInsertForm() {
		return "admin/faqInsertForm";
	}
	
	@GetMapping("faqUpdateForm.ad")
	public String faqUpdateForm() {
		return "admin/faqUpdateForm";
	}
	
	@GetMapping("inquireInsertForm.ad")
	public String inquireInsertForm() {
		return "admin/inquireInsertForm";
	}
	
	@GetMapping("reportInsertForm.ad")
	public String reportInsertForm() {
		return "admin/reportInsertForm";
	}
	
	@GetMapping("concertInsertForm.ad")
	public String concertInsertForm() {
		return "admin/concertInsertForm";
	}
	
	@GetMapping("concertUpdateForm.ad")
	public String concertUpdateForm() {
		return "admin/concertUpdateForm";
	}
	
	@GetMapping("theaterInsertForm.ad")
	public String theaterInsertForm() {
		return "admin/theaterInsertForm";
	}
	
	@GetMapping("theaterUpdateForm.ad")
	public String theaterUpdateForm() {
		return "admin/theaterUpdateForm";
	}
	
	// 카테고리 정보 불러오기
	@ResponseBody
	@GetMapping(value = "category.ad", produces = "application/json; charset=UTF-8")
	public String ajaxCategory(String refCategoryNo) {
		ArrayList<Category> list = adminService.selectFaqCategory(Integer.parseInt(refCategoryNo));
		return new Gson().toJson(list);
	}
	
	// 커뮤니티 정보 불러오기
	@ResponseBody
	@GetMapping(value = "adminSelect.cm", produces = "application/json; charset=UTF-8")
	public String adminSelectCommunity(AdminSearchDto dto, String currentPage) {
		int listCount = adminService.selectBoardCnt(dto);
		int cPage = Integer.parseInt(currentPage);
		
		PageInfo pi = Pagination.getPageInfo(listCount, cPage, 10, 10);
		ArrayList<User> list = adminService.selectBoard(dto, pi);
		
		Map<String, Object> map = new HashMap<>();
		map.put("pagination", pi);
		map.put("communityList", list);
		
		return new Gson().toJson(map);
	}
	
	// 선택한 게시글 삭제
	@ResponseBody
	@PostMapping(value = "adminDelete.cm", produces = "text/plain; charset=utf-8")
	public String adminDeleteUser(AdminBoardSelectDto dto) {
		int result = adminService.deleteBoard(dto);
		if(result == 0) {
			return "게시글 삭제 실패";
		} else {
			return "성공적으로 삭제 처리하였습니다.";
		}
	}
	
	// 선택한 카테고리 수정
	@ResponseBody
	@PostMapping(value = "adminUpdateCategory.cm", produces = "text/plain; charset=utf-8")
	public String adminUpdateCategory(AdminBoardSelectDto dto) {
		int result = adminService.updateBoardCategory(dto);
		if(result == 0) {
			return "카테고리 수정 실패";
		} else {
			return "성공적으로 수정하였습니다.";
		}
	}
	
	// 공연장 등록
	@PostMapping("theaterInsert.ad")
	public String theaterInsert(Theater t, HttpSession session) {
		int result = adminService.insertTheater(t);
		if(result == 0) {
			session.setAttribute("alertMsg", "공연장 등록 에 실패하였습니다.");
		} else {
			session.setAttribute("alertMsg", "등록 완료하였습니다.");
		}
		return "redirect:/theaterList.ad";
	}
	
	// 착석 불가능/가능 좌석 표기
	@ResponseBody
	@GetMapping("toggleSeat.ad")
	public String ajaxToggleSeat(ImpossibleSeat seat, String status) {
		int result = adminService.toggleSeat(seat, status);
		return result > 0 ? "SUCCESS" : "FAIL";
	}
	
	// summernote 이미지 표기
	@ResponseBody
	@PostMapping(value = "concertImgUpload.ad", produces = "application/json; charset-UTF-8")
	public String concertImgUpload(List<MultipartFile> fileList, HttpSession session) {
		List<String> changeNameList = new ArrayList<String>();
		for(MultipartFile f : fileList) {
			String path = "/resources/uploadfiles/concert/";
			String changeName = MyFileRenamePolicy.saveFile(f, session, path);
			changeNameList.add(path + changeName);
		}
		
		return new Gson().toJson(changeNameList);
	}
	
	// 공연장 정보 검색
	@ResponseBody
	@GetMapping(value = "searchTheaterList.ad", produces = "application/json; charset-UTF-8")
	public String ajaxSearchTheaterList(String keyword) {
		ArrayList<Theater> list = adminService.selectTheaterList(keyword);
		return new Gson().toJson(list);
	}
	
	// 공연 데이터 입력 
	@ResponseBody
	@PostMapping(value = "concertInsert.ad")
	public String concertInsert(String schedule, String seat, String concert, 
								@RequestPart MultipartFile upfile, HttpSession session) {
		// Unparseable date Exception 발생하지 않게 하기 위한 포매팅
		Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd").create();
		// Gson으로 JSON을 string으로 바꾼 것을 객체 형태로 변환
		List<ConcertSchedule> scheduleList = gson.fromJson(schedule, new TypeToken<List<ConcertSchedule>>(){}.getType());
		List<Seat> seatList = gson.fromJson(seat, new TypeToken<List<Seat>>(){}.getType());
		Concert c = gson.fromJson(concert, new TypeToken<Concert>(){}.getType());
		
		if(!upfile.getOriginalFilename().equals("")) {
			String path = "/resources/uploadfiles/concert/";
			String changeName = MyFileRenamePolicy.saveFile(upfile, session, path);
			
			c.setFilePath(path);
			c.setOriginName(upfile.getOriginalFilename());
			c.setChangeName(changeName);
		}
		
		int result = adminService.concertInsert(scheduleList, seatList, c);
		
		if(result == 0) {
			session.setAttribute("alertMsg", "공연 등록에 실패 하였습니다.");
		} else {
			session.setAttribute("alertMsg", "성공적으로 등록하였습니다.");
		}
		
		return "concertList.ad";
	}
	
	
	//공연 리스트 불러오기
	@ResponseBody
	@GetMapping(value = "ajaxConcertContentList.ad", produces = "application/json; charset-UTF-8")
	public String ajaxConcertContentList(String cPage) {
		
		int listSize = adminService.selectConcertContentListCount();
		int currentPage = Integer.parseInt(cPage);
		int listCount = listSize;
		
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 10, 5);
		
		ArrayList<Concert> clist = adminService.selectConcertContentList(pi);
		
		Map<String, Object> resMap = new HashMap<String, Object>();
		resMap.put("clist", clist);
		resMap.put("pi", pi);
		
		return new Gson().toJson(resMap);
	}
	
	@ResponseBody
	@GetMapping(value = "ajaxConcertImgList.ad", produces = "application/json; charset-UTF-8")
	public String ajaxConcertImgList(String cPage) {
		
		int listSize = adminService.selectConcertContentListCount();
		int currentPage = Integer.parseInt(cPage);
		int listCount = listSize;
		
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 10, 5);
		
		ArrayList<Concert> ilist = adminService.selectConcertImgList(pi);
		
		Map<String, Object> resMap = new HashMap<String, Object>();
		resMap.put("ilist", ilist);
		resMap.put("pi", pi);
		
		return new Gson().toJson(resMap);
	}
	
	//공연장리스트 불러오기
	@ResponseBody
	@GetMapping(value = "ajaxTheaterList.ad", produces = "application/json; charset-UTF-8")
	public String ajaxTheaterList(String cPage) {
		
		int listSize = adminService.selectTheaterListCount();
		int currentPage = Integer.parseInt(cPage);
		int listCount = listSize;
		
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 10, 10);
		
		ArrayList<Theater> tlist = adminService.selectTheaterList(pi);
		
		Map<String, Object> resMap = new HashMap<String, Object>();
		resMap.put("tlist", tlist);
		resMap.put("pi", pi);
		
		return new Gson().toJson(resMap);
	}
	
	//Faq 리스트 불러오기
	@ResponseBody
	@GetMapping(value = "adminSelect.fq", produces = "application/json; charset-UTF-8")
	public String adminSelectFaq(AdminSearchDto dto, String currentPage) {
		int listCount = adminService.selectFaqCnt(dto);
		int cPage = Integer.parseInt(currentPage);
		
		PageInfo pi = Pagination.getPageInfo(listCount, cPage, 10, 10);
		ArrayList<Board> list = adminService.selectFaq(dto, pi);
		
		Map<String, Object> map = new HashMap<>();
		map.put("pagination", pi);
		map.put("faqList", list);
		
		return new Gson().toJson(map);
	}
	
	// FAQ 등록
	@PostMapping("faqInsert.ad")
	public String faqInsert(Board b, int categoryNo, HttpSession session) {
		int result = adminService.faqInsert(b, categoryNo);
		if(result == 0) {
			session.setAttribute("alertMsg", "FAQ 작성에 실패하였습니다.");
		} else {
			session.setAttribute("alertMsg", "작성 완료하였습니다.");
		}
		return "redirect:/faqList.ad";
	}
	
	// 게시글 번호로만 게시글 조회시 사용되는 컨트롤러
	@ResponseBody
	@GetMapping(value = "select.bo", produces = "application/json; charset-UTF-8")
	public String selectOneBoard(int boardNo) {
		return new Gson().toJson(adminService.selectOneBoard(boardNo));
	}
	
	// 카테고리가 하나인 게시글 수정시 사용되는 컨트롤러
	@PostMapping("update.bo")
	public String updateOneBoard(AdminBoardDto dto, String url, HttpSession session) {
		session.setAttribute("alertMsg"
				, adminService.updateOneBoard(dto) == 1
				? "성공적으로 수정 완료하였습니다."
				: "수정 실패하였습니다.");
		return "redirect:/" + url;
	}
	
	// 카테고리가 하나인 게시글 삽입시 사용되는 컨트롤러
	@PostMapping("insert.bo")
	public String insertOneBoard(Board board, String url, HttpSession session) {
		session.setAttribute("alertMsg"
				, adminService.insertOneBoard(board) == 1
				? "성공적으로 등록 완료하였습니다."
				: "등록 실패하였습니다.");
		return "redirect:/" + url;
	}
	
	@ResponseBody
	@GetMapping(value = "adminSelect.iq", produces = "application/json; charset-UTF-8")
	public String adminSelectInquire(AdminSearchDto dto, String currentPage) {
		int listCount = adminService.selectInquireCnt(dto);
		int cPage = Integer.parseInt(currentPage);
		
		PageInfo pi = Pagination.getPageInfo(listCount, cPage, 10, 10);
		ArrayList<Board> list = adminService.selectInquire(dto, pi);
		
		Map<String, Object> map = new HashMap<>();
		map.put("pagination", pi);
		map.put("inquireList", list);
		
		return new Gson().toJson(map);
	}
	
	@ResponseBody
	@GetMapping(value = "adminSelect.rp", produces = "application/json; charset-UTF-8")
	public String adminSelectReport(AdminSearchDto dto, String currentPage) {
		int listCount = adminService.selectReportCnt(dto);
		int cPage = Integer.parseInt(currentPage);
		
		PageInfo pi = Pagination.getPageInfo(listCount, cPage, 10, 10);
		ArrayList<Board> list = adminService.selectReport(dto, pi);
		
		Map<String, Object> map = new HashMap<>();
		map.put("pagination", pi);
		map.put("reportList", list);
		
		return new Gson().toJson(map);
	}
}
