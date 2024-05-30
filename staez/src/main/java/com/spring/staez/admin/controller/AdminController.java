package com.spring.staez.admin.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestPart;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.google.gson.reflect.TypeToken;
import com.spring.staez.admin.model.vo.Category;
import com.spring.staez.admin.model.vo.ConcertSchedule;
import com.spring.staez.admin.model.vo.ImpossibleSeat;
import com.spring.staez.admin.model.vo.Seat;
import com.spring.staez.admin.service.AdminService;
import com.spring.staez.common.model.vo.PageInfo;
import com.spring.staez.common.template.MyFileRenamePolicy;
import com.spring.staez.common.template.Pagination;
import com.spring.staez.community.model.dto.CategoryDto;
import com.spring.staez.community.model.vo.Board;
import com.spring.staez.concert.model.vo.Concert;
import com.spring.staez.concert.model.vo.Theater;

@Controller
public class AdminController {
	
	@Autowired
	AdminService adminService;
	
	@GetMapping("userList.ad")
	public String userMain() {
		return "admin/userMain";
	}
	
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
	
	@GetMapping("faqIncertForm.ad")
	public String faqIncertForm() {
		return "admin/faqIncertForm";
	}
	
	@GetMapping("faqUpdateForm.ad")
	public String faqUpdateForm() {
		return "admin/faqUpdateForm";
	}
	
	@GetMapping("inquireIncertForm.ad")
	public String inquireIncertForm() {
		return "admin/inquireIncertForm";
	}
	
	@GetMapping("reportIncertForm.ad")
	public String reportIncertForm() {
		return "admin/reportIncertForm";
	}
	
	@GetMapping("concertIncertForm.ad")
	public String concertIncertForm() {
		return "admin/concertIncertForm";
	}
	
	@GetMapping("concertUpdateForm.ad")
	public String concertUpdateForm() {
		return "admin/concertUpdateForm";
	}
	
	@GetMapping("theaterIncertForm.ad")
	public String theaterIncertForm() {
		return "admin/theaterIncertForm";
	}
	
	@GetMapping("theaterUpdateForm.ad")
	public String theaterUpdateForm() {
		return "admin/theaterUpdateForm";
	}
	
	// 카테고리 정보 불러오기
	@ResponseBody
	@GetMapping(value = "category.ad", produces = "application/json; charset-UTF-8")
	public String ajaxCategory(String refCategoryNo) {
		ArrayList<Category> list = adminService.selectFaqCategory(Integer.parseInt(refCategoryNo));
		return new Gson().toJson(list);
	}
	
	// FAQ 등록
	@PostMapping("faqIncert.ad")
	public String faqIncert(Board b, int categoryNo, HttpSession session) {
		int result = adminService.faqIncert(b, categoryNo);
		if(result == 0) {
			session.setAttribute("alertMsg", "FAQ 작성에 실패하였습니다.");
		} else {
			session.setAttribute("alertMsg", "작성 완료하였습니다.");
		}
		return "redirect:/faqList.ad";
	}
	
	// 공연장 등록
	@PostMapping("theaterIncert.ad")
	public String theaterIncert(Theater t, HttpSession session) {
		int result = adminService.incertTheater(t);
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
}
