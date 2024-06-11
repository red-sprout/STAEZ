package com.spring.staez.concert.controller;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.ArrayList;

import org.json.XML;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.google.gson.JsonArray;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;
import com.spring.staez.admin.model.vo.Category;
import com.spring.staez.admin.model.vo.Seat;
import com.spring.staez.community.model.vo.Board;
import com.spring.staez.concert.model.vo.Concert;
import com.spring.staez.concert.model.vo.ConcertReview;
import com.spring.staez.concert.service.ConcertService;

@Controller
public class ConcertAPIController {
	
	@Value("${concert.service.key}")
	private String serviceKey;
	
	@Autowired
	private ConcertService concertService;
	
	
	
	@GetMapping("conapi.co")
	public String concertMain() {
		return "concert/concertAPIMain";
	}

	@ResponseBody
	@RequestMapping(value="mainconapi.co", produces="application/json; charset=UTF-8")
	public String getConInfo() throws IOException {
		
		String url = "http://kopis.or.kr/openApi/restful/pblprfr";
		url += "?service=" + serviceKey;
		url += "&returnType=json"; // 리턴값은 기본이 xml이니까 json으로 하고 싶어서 넣어줌
		url += "&stdate=20240601"; // 시작일
		url += "&eddate=20240731"; //끝나는일
		url += "&cpage=1"; //현재페이지
		url += "&rows=15"; // 포스터 경로
		url += "&shcate=AAAA"; //장르코드
		
		String stdate;
		String eddate;


		URL requestURL = new URL(url);
		HttpURLConnection urlConnection = (HttpURLConnection)requestURL.openConnection();
		urlConnection.setRequestMethod("GET"); // 안해줘도 기본값 있으나 연습으로 해봄
		
		BufferedReader br =	new BufferedReader(new InputStreamReader(urlConnection.getInputStream()));
		
		String responseText = "";
		String line;
		while((line = br.readLine()) != null) {
			responseText += line;
		}
		
		// xml to jason
		org.json.JSONObject xmltojsonObj = XML.toJSONObject(responseText);
		String jsonObj = xmltojsonObj.toString();
		
		JsonObject totalObj = JsonParser.parseString(jsonObj).getAsJsonObject();
		JsonObject dbsObj = totalObj.getAsJsonObject("dbs"); //totalObj 안에 있는 키로 object 꺼내올 수 있다
		JsonArray dbArr = dbsObj.getAsJsonArray("db"); // {를 여는 것은 jsonObject {다음에 [있으면 array 시작
		
		br.close();
		urlConnection.disconnect();
		
		
		return dbArr.toString();
		
	}
	
	
//	// 공연을 concertNo로 가져와서 공연세부페이지로: 한줄평이랑 리뷰
//	// model로 내려줄 때는 한 메서드에 다 몰아서 해줘야하는군
//	@RequestMapping(value = "detailapi.co", produces="application/json; charset=UTF-8")
//	public String selectCon(@RequestParam(value = "concertNo") String concertNo, Model model) {
//		Concert con = concertService.selectCon(Integer.parseInt(concertNo));
//		ArrayList<ConcertReview> conComDlist =  concertService.selectComDetail(Integer.parseInt(concertNo));
//		ArrayList<Board> conRevDlist =  concertService.selectRevDetail(Integer.parseInt(concertNo));
//		// 공연세부페이지 공연 가격
//		ArrayList<Seat> s =  concertService.selectSeatPrice(Integer.parseInt(concertNo));
//
//		
//		model.addAttribute("rev", conRevDlist);
//		model.addAttribute("com", conComDlist);
//		model.addAttribute("con", con);
//		model.addAttribute("s", s);
//		
//		return "concert/concertDetailMain";
//	}
	
}
