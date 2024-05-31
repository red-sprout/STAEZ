package com.spring.staez.concert.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.spring.staez.admin.model.vo.Category;
import com.spring.staez.concert.model.vo.Concert;
import com.spring.staez.concert.model.vo.ConcertReview;
import com.spring.staez.concert.service.ConcertService;

@Controller
public class ConcertController {
	
	@Autowired
	private ConcertService concertService;
	
	// 공연 누르면 보여주는 공연 메인 페이지
//	@GetMapping("main.co")
//	public String concertMain() {
//		
//		return "concert/concertMain";
//	}
	
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
		System.out.println("main : " + categoryNo);
		Category cat = concertService.selectCate(Integer.parseInt(categoryNo));
		model.addAttribute("cat", cat);
		return "concert/concertMain";
	}
	
	// 공연리스트 categoryNo로 다가져와(ajax로)
	@ResponseBody
	@RequestMapping(value = "maincon.co", produces="application/json; charset=UTF-8")
	public String mainDrawAjax(@RequestParam(value = "categoryNo")int categoryNo) {
		
		System.out.println("maincon : " + categoryNo);
		ArrayList<Concert> list =  concertService.selectconList(categoryNo);
		
		return new Gson().toJson(list);
	}
		
		
	// 공연을 concertNo로 가져와서 공연세부페이지로
	@RequestMapping(value = "detail.co", produces="application/json; charset=UTF-8")
	public String selectCon(@RequestParam(value = "concertNo") String concertNo, Model model) {
		Concert con = concertService.selectCon(Integer.parseInt(concertNo));
		model.addAttribute("con", con);
		return "concert/concertDetail";
	}
	
//	
//	@ResponseBody
//	@RequestMapping(value = "conheart.co", produces="application/json; charset=UTF-8")
//	public String insertConLike(@RequestParam("userNo") String userNo,
//						   @RequestParam("concertNo") String concertNo, HttpSession session, Model model) {
//		
//		// 좋아요 버튼 체크, 만약 좋아요 버튼을 (그 전에 한번도) 클릭하지 않았으면 : checkLike null 반환 -> 좋아요 버튼 insert
//		//  checkLike !null 반환 -> 좋아요 버튼 update(status n)
//		
//        Map<String, Integer> conL = new HashMap<>();
//        conL.put("userNo", Integer.parseInt(userNo));
//        conL.put("concertNo", Integer.parseInt(concertNo));
//        int checkConLike = concertService.checkConLike(conL);
//        
//		if(checkConLike > 0) { //성공 => list 페이지로 이동
//			session.setAttribute("alertMsg", "좋아요 성공");
//			return "redirect:/";
//		} else { // 실패 => 에러페이지
//			session.setAttribute("alertMsg", "좋아요 실패");
//			return "redirect:/";
//		}
//	}	
//	
		
	
	
	
	
	
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
	
	// 공연을 concertNo로 가져와서 한줄평 페이지로
	@ResponseBody
	@RequestMapping(value = "commentDetail.co", produces="application/json; charset=UTF-8")
	public String commentDetail(@RequestParam(value = "concertNo") String concertNo) {
		
		ArrayList<ConcertReview> conComDlist =  concertService.selectComDetail(Integer.parseInt(concertNo));
		System.out.println(conComDlist);
		return new Gson().toJson(conComDlist);
	}
	
	// 공연을 concertNo로 가져와서 리뷰 페이지로
	@ResponseBody
	@RequestMapping(value = "reviewDetail.co", produces="application/json; charset=UTF-8")
	public String reviewDetail(@RequestParam(value = "concertNo") String concertNo) {
		
		ArrayList<ConcertReview> conRevDlist =  concertService.selectRevDetail(Integer.parseInt(concertNo));
		System.out.println(conRevDlist);
		return new Gson().toJson(conRevDlist);
	}
	

	
	
	// 보드넘버로 찾을 보드 가지러 가서
	// 찾아서 가져와서 보드 상세 페이지로 보내주기
	@GetMapping("sellInfo.co")
	public String sellInfo() {
		return "concert/concertDetailSellInfo";
	}

	@GetMapping("comment.co")
	public String comment() {
		return "concert/concertDetailComment";
	}
	
	@GetMapping("detailReview.co")
	public String detailReview() {
		return "concert/concertDetailReview";
	}
	

}
