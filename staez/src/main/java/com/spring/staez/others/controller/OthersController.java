package com.spring.staez.others.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.spring.staez.admin.model.vo.Category;
import com.spring.staez.common.model.vo.PageInfo;
import com.spring.staez.common.template.Pagination;
import com.spring.staez.concert.model.vo.Concert;
import com.spring.staez.others.service.OthersService;

@Controller
public class OthersController {
	
	@Autowired
	private OthersService oService;
	
	@GetMapping("/") // 메인페이지, "/"로 대체
	public String reserveMain() {
		return "others/reserveMain";
	}
	
	@GetMapping("searchResult.me") // 전체 검색 결과
	public String searchResultPage() {
		return "others/searchResultPage";
	}
	
	@GetMapping("searchResult.co") // 공연 더보기 검색 결과
	public String searchResultMoreConcert() {
		return "others/searchResultMoreConcert";
	}
	
	@GetMapping("calendar.co") // 공연 캘린더
	public String concertCalendar() {
		return "others/concertCalendar";
	}
	
	@GetMapping("calendar.me") // 나의 예매 캘린더
	public String reservationCalendar() {
		return "others/reservationCalendar";
	}
	
	@ResponseBody
	@GetMapping(value = "ajaxSelectCategory.ot" , produces="application/json; charset-UTF-8")
	public String ajaxSelectCategory() {
		ArrayList<Category> categorys = oService.selectCategory();
		
		return  new Gson().toJson(categorys);
	}
	
	@ResponseBody
	@GetMapping(value = "ajaxSelectCategoryConcert.ot" , produces="application/json; charset-UTF-8")
	public String ajaxSelectCategoryConcert(String categoryNo1) {
		int cNo = Integer.parseInt(categoryNo1);
		
		ArrayList<Concert> ccList = oService.selectCategoryConcert(cNo);
		return  new Gson().toJson(ccList);
	}
	
	@ResponseBody
	@GetMapping(value = "ajaxSelectCategoryConcertImg.ot" , produces="application/json; charset-UTF-8")
	public String ajaxSelectCategoryConcertImg(String categoryNo1) {
		int cNo = Integer.parseInt(categoryNo1);
		
		ArrayList<Concert> cciList = oService.selectCategoryConcertImg(cNo);
		return  new Gson().toJson(cciList);
	}

	@ResponseBody
	@GetMapping(value = "ajaxSelectLatestCategoryConcert.ot" , produces="application/json; charset-UTF-8")
	public String ajaxSelectLatestCategoryConcert(String categoryNo2) {
		int cNo = Integer.parseInt(categoryNo2);
		
		ArrayList<Concert> clList = oService.selectLatestCategoryConcert(cNo);
		return  new Gson().toJson(clList);
	}
	
	@ResponseBody
	@GetMapping(value = "ajaxSelectLatestCategoryConcertImg.ot" , produces="application/json; charset-UTF-8")
	public String ajaxSelectLatestCategoryConcertImg(String categoryNo2) {
		int cNo = Integer.parseInt(categoryNo2);
		
		ArrayList<Concert> cliList = oService.selectLatestCategoryConcertImg(cNo);
		return  new Gson().toJson(cliList);
	}
	
	@ResponseBody
	@GetMapping(value = "ajaxSelectDateCategoryConcert.ot" , produces="application/json; charset-UTF-8")
	public String ajaxSelectDateCategoryConcert(String categoryNo, String concertDate, String cPage) {
		
		ArrayList<Concert> dcList = oService.selectDateCategoryConcert(categoryNo, concertDate);
		int currentPage = Integer.parseInt(cPage);
		int listCount = dcList.size();
		
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 10, 6);
		ArrayList<Concert> pdcList = oService.selectPageConcert(categoryNo, concertDate, pi);
		
		return  new Gson().toJson(pdcList);
	}
	
	
	
	
	
	
	
}
