package com.spring.staez.concert.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.spring.staez.admin.model.vo.Category;
import com.spring.staez.admin.model.vo.Seat;
import com.spring.staez.common.model.vo.PageInfo;
import com.spring.staez.common.template.Pagination;
import com.spring.staez.community.model.vo.Board;
import com.spring.staez.concert.model.vo.Concert;
import com.spring.staez.concert.model.vo.ConcertLike;
import com.spring.staez.concert.model.vo.ConcertReview;
import com.spring.staez.concert.service.ConcertService;

import lombok.RequiredArgsConstructor;
@RequiredArgsConstructor
@Controller
public class ConcertController {

	private final ConcertService concertService;
	
	// category를 가져와라 콘서트 '네비'에 뿌려주기
	@ResponseBody
	@RequestMapping(value = "connavi.co", produces="application/json; charset=UTF-8")
	public String selectCateCon() {
		ArrayList<Category> conList =  concertService.selectCateCon();
		return new Gson().toJson(conList);
	}
	
	// 공연을 categoryNo로 가져와서 공연세부페이지로, 메인페이지에 categoryNo를 내려주면 클릭하면 mian.co?에 들어감
	@RequestMapping(value = "main.co")
	public String concertMain(String categoryNo, Model model) {
		Category cat = concertService.selectCate(Integer.parseInt(categoryNo));
		model.addAttribute("cat", cat);
		return "concert/concertMain";
	}
	
	// 공연리스트 categoryNo로 다가져와(ajax로): 슬라이더랑 그리드
	@ResponseBody
	@RequestMapping(value = "maincon.co", produces="application/json; charset=UTF-8")
	public String mainDrawAjax(@RequestParam(value = "categoryNo")int categoryNo) {
		ArrayList<Concert> list =  concertService.selectconList(categoryNo);
		return new Gson().toJson(list);
	}
		
		
	// 공연을 concertNo로 가져와서 공연세부페이지로: 한줄평이랑 리뷰
	// model로 내려줄 때는 한 메서드에 다 몰아서 해줘야하는군
	@RequestMapping(value = "detail.co", produces="application/json; charset=UTF-8")
	public String selectCon(@RequestParam(value = "concertNo") String concertNo, Model model) {
		Concert con = concertService.selectCon(Integer.parseInt(concertNo));
		ArrayList<ConcertReview> conComDlist =  concertService.selectComDetail(Integer.parseInt(concertNo));
		ArrayList<Board> conRevDlist =  concertService.selectRevDetail(Integer.parseInt(concertNo));
		// 공연세부페이지 공연 가격
		ArrayList<Seat> s =  concertService.selectSeatPrice(Integer.parseInt(concertNo));

		model.addAttribute("rev", conRevDlist);
		model.addAttribute("com", conComDlist);
		model.addAttribute("con", con);
		model.addAttribute("s", s);
		
		return "concert/concertDetailMain";
	}
		
	
	// 좋아요 몇개인지
	@ResponseBody
	@RequestMapping(value = "likecount.co", produces="application/json; charset=UTF-8")
	public String likeCount(String userNo, String concertNo) {
		
		Map map = new HashMap();
		map.put("userNo", Integer.parseInt(userNo));
		map.put("concertNo", Integer.parseInt(concertNo));
		
		int conLikeCount = concertService.selectConLikeCount(Integer.parseInt(concertNo));		
		int userConLikeCount = concertService.selectUserConLike(map);
		
		Map<String, Object> conMap = new HashMap<>();
		conMap.put("conLikeCount", conLikeCount); // 콘서트가 가진 좋아요 총 갯수 status Y
		conMap.put("userConLikeCount", userConLikeCount); // a유저가 1이라는 콘서트에 좋아요한 갯수 status Y

		return new Gson().toJson(conMap);
	}
	
	
	// 좋아요 insert, update
	@ResponseBody
	@RequestMapping(value = "likeupdate.co")
	public String likeUpdate(ConcertLike like) {
		// like 있는지 없는지 체크후 없으면 insert

		int userNo = like.getUserNo();
		int concertNo = like.getConcertNo();
		Map map = new HashMap();
		map.put("userNo", userNo);
		map.put("concertNo", concertNo);
		
		int result =  concertService.selectUserConLikeAll(map); // a유저가 1이라는 콘서트에 좋아요한 적이 있냐 status 노상관
		
		if(result > 0) {
			result = concertService.updateConLike(like); // 좋아요 한 적 있으면 update
		} else {
			result = concertService.insertConLike(like); // 좋아요 한 적 없으면 insert
		}
				
		int conLikeCount = concertService.selectConLikeCount(concertNo);
		
		if(result > 0) {
			return String.valueOf(conLikeCount);
		} else {
			return "좋아요 실패";
		}
	}
	
	
	// 공연을 concertNo로 가져와서 공연세부페이지로
	@ResponseBody
	@RequestMapping(value = "conDetail.co", produces="application/json; charset=UTF-8")
	public String conDetail(@RequestParam(value = "concertNo") String concertNo) {
		ArrayList<Concert> conDlist =  concertService.selectConDetail(Integer.parseInt(concertNo));
		return new Gson().toJson(conDlist);
	}
	
	// 공연을 concertNo로 가져와서 공연 판매정보 페이지로
	@ResponseBody
	@RequestMapping(value = "conSellDetail.co", produces="application/json; charset=UTF-8")
	public String conSellDetail(@RequestParam(value = "concertNo") String concertNo) {
		ArrayList<Concert> conDlist =  concertService.selectConDetail(Integer.parseInt(concertNo));
		return new Gson().toJson(conDlist);
	}
	
	
	
	// 공연을 concertNo로 가져와서 한줄평 페이지로 + 페이지네이션
	@ResponseBody
	@RequestMapping(value = "commentDetail.co", produces="application/json; charset=UTF-8")
	public String commentDetail(@RequestParam(value = "concertNo") String concertNo,
								@RequestParam(value="cpage", defaultValue="1" )int cpage) {
		
		// 한줄평 총 갯수 가져오기
		int currentPage = cpage;
		int comCount = concertService.selectComCount(Integer.parseInt(concertNo));
		PageInfo pi = Pagination.getPageInfo(comCount, currentPage, 5, 10);
		ArrayList<ConcertReview> crList =  concertService.selectComList(pi, Integer.parseInt(concertNo));
		
		
	    Map<String, Object> result = new HashMap<>();
	    result.put("pi", pi);
	    result.put("crList", crList);

	    return new Gson().toJson(result);
	}
		
	
	// 공연을 concertNo로 가져와서 리뷰 페이지로: 리뷰페이지 페이지네이션
	@ResponseBody
	@RequestMapping(value = "reviewDetail.co", produces="application/json; charset=UTF-8")
	public String reviewDetail(@RequestParam(value = "concertNo") String concertNo,
							   @RequestParam(value="rpage", defaultValue="1" )int rpage) {
		
		
		int currentPage = rpage;
		int revCount = concertService.selectRevCount(Integer.parseInt(concertNo));
		PageInfo pi = Pagination.getPageInfo(revCount, currentPage, 5, 10);
		ArrayList<Board> rList =  concertService.selectRevList(pi, Integer.parseInt(concertNo));
		
	    Map<String, Object> result = new HashMap<>();
	    result.put("pi", pi);
	    result.put("rList", rList);
	    System.out.println("rList:" + rList);
		
		return new Gson().toJson(result);
	}
	
	
	@ResponseBody
	@RequestMapping(value = "popular.co", produces="application/json; charset=UTF-8")
	public String popular(@RequestParam(value = "categoryNo")int categoryNo) {
		ArrayList<Concert> list =  concertService.popularList(categoryNo);
		return new Gson().toJson(list);
	}
	@ResponseBody
	@RequestMapping(value = "latest.co", produces="application/json; charset=UTF-8")
	public String latest(@RequestParam(value = "categoryNo")int categoryNo) {
		ArrayList<Concert> list =  concertService.latestList(categoryNo);
		return new Gson().toJson(list);
	}	
	
	@ResponseBody
	@RequestMapping(value = "highscore.co", produces="application/json; charset=UTF-8")
	public String highscore(@RequestParam(value = "categoryNo")int categoryNo) {
		System.out.println(categoryNo);
		ArrayList<Concert> list =  concertService.highscoreList(categoryNo);
		
		System.out.println(list);
		return new Gson().toJson(list);
	}
	
	// 페이지네이션
	@ResponseBody
	@RequestMapping(value = "locationAll.co", produces="application/json; charset=UTF-8")
	public String locationAll(@RequestParam(value = "categoryNo")int categoryNo, @RequestParam(value = "area")String area) {
		System.out.println("area:" + area);
		
		Map map = new HashMap();
		map.put("categoryNo", categoryNo);
		map.put("area", area);
		
		ArrayList<Concert> list =  concertService.locationAllList(map);
		return new Gson().toJson(list);
	}
	

	
	

	// 공연 누르면 보여주는 공연 메인 페이지
//	@GetMapping("main.co")
//	public String concertMain() {
//		
//		return "concert/concertMain";
//	}
}
