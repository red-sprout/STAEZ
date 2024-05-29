package com.spring.staez.concert.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

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
import com.spring.staez.concert.service.ConcertService;

@Controller
public class ConcertController {
	
	@Autowired
	private ConcertService concertService;
	
	// 공연 누르면 보여주는 공연 메인 페이지
	@GetMapping("main.co")
	public String concertMain() {
		return "concert/concertMain";
	}
	
	// category를 가져와라 콘서트 네비에 뿌려주기
	@ResponseBody
	@RequestMapping(value = "connavi.co", produces="application/json; charset=UTF-8")
	public String selectCateCon() {
		ArrayList<Category> conList =  concertService.selectCateCon();
		return new Gson().toJson(conList);
	}
	
	// 공연리스트 다가져와(ajax로)
	@ResponseBody // 리턴할 응답 바디를 직접 입력할꺼야
	@RequestMapping(value = "maincon.co", produces="application/json; charset=UTF-8")
	public String mainDrawAjax() {
		ArrayList<Concert> list =  concertService.selectconList();
		return new Gson().toJson(list);
	}
		
		
	// 공연을 concertNo로 가져와서 공연세부페이지로
	@RequestMapping(value = "detail.co", produces="application/json; charset=UTF-8")
	public String selectCon(@RequestParam(value = "concertNo") String concertNo, Model model) {
		
		Concert con = concertService.selectCon(Integer.parseInt(concertNo));
		model.addAttribute("con", con);
		
		return "concert/concertDetail";
	}
	
	
	@ResponseBody
	@RequestMapping(value = "conheart.co", produces="application/json; charset=UTF-8")
	public String insertConLike(@RequestParam("userNo") String userNo,
						   @RequestParam("concertNo") String concertNo, HttpSession session, Model model) {
		
		// 좋아요 버튼 체크, 만약 좋아요 버튼을 (그 전에 한번도) 클릭하지 않았으면 : checkLike null 반환 -> 좋아요 버튼 insert
		//  checkLike !null 반환 -> 좋아요 버튼 update(status n)
		
        Map<String, Integer> conL = new HashMap<>();
        conL.put("userNo", Integer.parseInt(userNo));
        conL.put("concertNo", Integer.parseInt(concertNo));
        int checkConLike = concertService.checkConLike(conL);
        
		if(checkConLike > 0) { //성공 => list 페이지로 이동
			session.setAttribute("alertMsg", "좋아요 성공");
			return "redirect:/";
		} else { // 실패 => 에러페이지
			session.setAttribute("alertMsg", "좋아요 실패");
			return "redirect:/";
		}
	}	
	
		
	
	
	
	
	
	// 공연을 concertNo로 가져와서 공연세부페이지로
	@RequestMapping(value = "sellInfo.co", produces="application/json; charset=UTF-8")
	public String selectSellInfoCon(@RequestParam(value = "concertNo") String concertNo, Model model) {
		
		Concert con = concertService.selectCon(Integer.parseInt(concertNo));
		model.addAttribute("con", con);
		
		return "concert/sellInfo";
	}
	
	
	// 공연을 concertNo로 가져와서 공연세부페이지로
	@RequestMapping(value = "comment.co", produces="application/json; charset=UTF-8")
	public String selectCommentCon(@RequestParam(value = "concertNo") String concertNo, Model model) {
		
		Concert con = concertService.selectCon(Integer.parseInt(concertNo));
		model.addAttribute("con", con);
		
		return "concert/comment";
	}
	
	
	// 공연을 concertNo로 가져와서 공연세부페이지로
	@RequestMapping(value = "detailReview.co", produces="application/json; charset=UTF-8")
	public String selectDetailReviewCon(@RequestParam(value = "concertNo") String concertNo, Model model) {
		
		Concert con = concertService.selectCon(Integer.parseInt(concertNo));
		model.addAttribute("con", con);
		
		return "concert/detailReview";
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
