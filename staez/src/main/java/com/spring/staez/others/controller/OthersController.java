package com.spring.staez.others.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.spring.staez.admin.model.vo.Category;
import com.spring.staez.common.model.vo.PageInfo;
import com.spring.staez.common.template.Pagination;
import com.spring.staez.community.model.vo.Board;
import com.spring.staez.community.model.vo.BoardLike;
import com.spring.staez.concert.model.vo.Concert;
import com.spring.staez.others.service.OthersService;
import com.spring.staez.user.model.vo.ProfileImg;
import com.spring.staez.user.model.vo.Reserve;

@Controller
public class OthersController {
	
	@Autowired
	private OthersService oService;
	
	@GetMapping("/") // 메인페이지, "/"로 대체
	public String reserveMain() {
		return "others/reserveMain";
	}
	
	@GetMapping("searchResult.me") // 전체 검색 결과
	public String searchResultPage(@RequestParam("keyword") String keyword, Model model) {
		
		model.addAttribute("keyword", keyword);
		return "others/searchResultPage";
	}
	
	@GetMapping("searchResult.co") // 공연 더보기 검색 결과
	public String searchResultMoreConcert(@RequestParam("keyword") String keyword, Model model) {
		
		model.addAttribute("keyword", keyword);
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
		
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 10, 4);
		ArrayList<Concert> pdcList = oService.selectPageConcert(categoryNo, concertDate, pi);
		
		Map<String, Object> resMap = new HashMap<String, Object>();
		resMap.put("concertList", pdcList);
		resMap.put("pi", pi);
		
		return  new Gson().toJson(resMap);
	}
	
	
	@ResponseBody
	@GetMapping(value = "ajaxReserveConcertList.ot" , produces="application/json; charset-UTF-8")
	public String ajaxSelectReserveConcertList(String userNo) {
		int uNo = Integer.parseInt(userNo);
		
		ArrayList<Reserve> rList = oService.selectReserveConcertList(uNo);
		
		
		return  new Gson().toJson(rList);
	}
	
	@ResponseBody
	@GetMapping(value = "ajaxChoiceReserveConcertList.ot" , produces="application/json; charset-UTF-8")
	public String ajaxChoiceReserveConcertList(String userNo, String todate) {
		

		ArrayList<Concert> crList = oService.selectChoiceReserveConcertList(userNo, todate);
		
		
		return  new Gson().toJson(crList);
	}
	
	
	@ResponseBody
	@GetMapping(value = "ajaxSelectPopularBoardList.ot" , produces="application/json; charset-UTF-8")
	public String ajaxSelectPopularBoardList() {
		

		ArrayList<Board> bList = oService.selectPopularBoardList();
		
		
		return  new Gson().toJson(bList);
	}
	
	@ResponseBody
	@GetMapping(value = "ajaxSelectpopularBoardCategory.ot" , produces="application/json; charset-UTF-8")
	public String ajaxSelectpopularBoardCategory() {
		

		ArrayList<Board> bcList = oService.selectPopularBoardCategory();
		
		
		return  new Gson().toJson(bcList);
	}
	
	@ResponseBody
	@GetMapping(value = "ajaxSelectpopularBoardUserProfile.ot" , produces="application/json; charset-UTF-8")
	public String ajaxSelectpopularBoardUserProfile() {
		

		ArrayList<ProfileImg> profileList = oService.selectpopularBoardUserProfile();
		
		
		return  new Gson().toJson(profileList);
	}

	@ResponseBody
	@GetMapping(value = "ajaxInsertUpdatelike.ot" , produces="application/json; charset-UTF-8")
	public String ajaxInsertUpdatelike(String uNo, String bNo) {
		int userNo = Integer.parseInt(uNo);
		int boardNo = Integer.parseInt(bNo);
		
		ArrayList<BoardLike> likeCount = oService.insertUpdatelike(userNo, boardNo);
		
		
		return  new Gson().toJson(likeCount);
	}
	
	@ResponseBody
	@GetMapping(value = "ajaxUpdateNoLike.ot" , produces="application/json; charset-UTF-8")
	public String ajaxUpdateNoLike(String uNo, String bNo) {
		int userNo = Integer.parseInt(uNo);
		int boardNo = Integer.parseInt(bNo);
		
		ArrayList<BoardLike> likeCount = oService.updateNoLike(userNo, boardNo);
		
		
		return  new Gson().toJson(likeCount);
	}
	
	@ResponseBody
	@GetMapping(value = "ajaxSelectUserLikeBoardNo.ot" , produces="application/json; charset-UTF-8")
	public String ajaxSelectUserLikeBoardNo(String uNo) {
		int userNo = Integer.parseInt(uNo);
		
		ArrayList<BoardLike> userLikeList = oService.selectUserLikeBoardNo(userNo);
		
		
		return  new Gson().toJson(userLikeList);
	}
	
	@ResponseBody
	@GetMapping(value = "ajaxKeywordConcertList.ot" , produces="application/json; charset-UTF-8")
	public String ajaxKeywordConcertList(String keyword) {
		
		ArrayList<Concert> cList = oService.selectKeywordConcert(keyword);
		
		
		return  new Gson().toJson(cList);
	}
	
	@ResponseBody
	@GetMapping(value = "ajaxKeywordConcertImgList.ot" , produces="application/json; charset-UTF-8")
	public String ajaxKeywordConcertImgList(String keyword) {
		
		ArrayList<Concert> ciList = oService.selectKeywordConcertImg(keyword);
		
		
		return  new Gson().toJson(ciList);
	}
	
	@ResponseBody
	@GetMapping(value = "ajaxKeywordBoardList.ot" , produces="application/json; charset-UTF-8")
	public String ajaxKeywordBoardList(String keyword) {
		
		ArrayList<Board> bList = oService.selectKeywordBoardList(keyword);
		
		
		return  new Gson().toJson(bList);
	}
	
	@ResponseBody
	@GetMapping(value = "ajaxKeywordCategoryList.ot" , produces="application/json; charset-UTF-8")
	public String ajaxkeywordCategoryList(String bNo) {
		int boardNo = Integer.parseInt(bNo);
		ArrayList<Board> categoryList = oService.selectkeywordCategoryList(boardNo);
		
		
		return  new Gson().toJson(categoryList);
	}
	
	@ResponseBody
	@GetMapping(value = "ajaxKeywordUserProfile.ot" , produces="application/json; charset-UTF-8")
	public String ajaxKeywordUserProfile(String keyword) {
		
		ArrayList<ProfileImg> profileList = oService.selectKeywordUserProfilet(keyword);
		
		
		return  new Gson().toJson(profileList);
	}
	
	@ResponseBody
	@GetMapping(value = "ajaxKeywordMoreEndConcert.ot" , produces="application/json; charset-UTF-8")
	public String ajaxKeywordMoreEndConcert(String keyword, String cPage) {
		
		int currentPage = Integer.parseInt(cPage);
		int listCount = oService.selectKeywordMoreEndConcertCount(keyword).size();
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 10, 10);
		
		ArrayList<Concert> cList = oService.selectKeywordMoreEndConcert(keyword, pi);
		Map<String, Object> resMap = new HashMap<String, Object>();
		resMap.put("cList", cList);
		resMap.put("pi", pi);
		
		return  new Gson().toJson(resMap);
	}
	
	@ResponseBody
	@GetMapping(value = "ajaxKeywordMoreEndConcertImg.ot" , produces="application/json; charset-UTF-8")
	public String ajaxKeywordMoreEndConcertImg(String keyword, String cPage) {
		
		int currentPage = Integer.parseInt(cPage);
		int listCount = oService.selectKeywordMoreEndConcertImgCount(keyword).size();
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 10, 10);
		
		ArrayList<Concert> ciList = oService.selectKeywordMoreEndConcertImg(keyword, pi);
		Map<String, Object> resMap = new HashMap<String, Object>();
		resMap.put("ciList", ciList);
		resMap.put("pi", pi);
		
		return  new Gson().toJson(resMap);
	}
	
	@ResponseBody
	@GetMapping(value = "ajaxKeywordMoreConcert.ot" , produces="application/json; charset-UTF-8")
	public String ajaxKeywordMoreConcert(String keyword, String cPage) {
		
		int currentPage = Integer.parseInt(cPage);
		int listCount = oService.selectKeywordMoreConcertCount(keyword).size();
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 10, 10);
		
		ArrayList<Concert> cList = oService.selectKeywordMoreConcert(keyword, pi);
		Map<String, Object> resMap = new HashMap<String, Object>();
		resMap.put("cList", cList);
		resMap.put("pi", pi);
		
		return  new Gson().toJson(resMap);
	}
	
	@ResponseBody
	@GetMapping(value = "ajaxKeywordMoreConcertImg.ot" , produces="application/json; charset-UTF-8")
	public String ajaxKeywordMoreConcertImg(String keyword, String cPage) {
		
		int currentPage = Integer.parseInt(cPage);
		int listCount = oService.selectKeywordMoreConcertImgCount(keyword).size();
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 10, 10);
		
		ArrayList<Concert> ciList = oService.selectKeywordMoreConcertImg(keyword, pi);
		Map<String, Object> resMap = new HashMap<String, Object>();
		resMap.put("ciList", ciList);
		resMap.put("pi", pi);
		
		return  new Gson().toJson(resMap);
	}
	
	
}
