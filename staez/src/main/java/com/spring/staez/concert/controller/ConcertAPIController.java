package com.spring.staez.concert.controller;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import org.json.XML;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
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
import com.spring.staez.concert.model.vo.ConcertLike;
import com.spring.staez.concert.model.vo.ConcertReview;
import com.spring.staez.concert.service.ConcertService;

@Controller
public class ConcertAPIController {
	
	@Value("${concert.service.key}")
	private String serviceKey;
	
	@Autowired
	private ConcertService concertService;
	
	
	@GetMapping("conapi.co") // api 사이트로 ㄱ
	public String concertMain() {
		return "concert/concertAPIMain";
	}

	
	@ResponseBody
	@RequestMapping(value="mainconapi.co", produces="application/json; charset=UTF-8") // api 공연 메인페이지 : api로 내려줌
	public String getConInfoAjax() throws IOException {
		
		String url = "http://kopis.or.kr/openApi/restful/pblprfr";
		url += "?service=" + serviceKey;
		url += "&returnType=json"; // 리턴값은 기본이 xml이니까 json으로 하고 싶어서 넣어줌
		url += "&stdate=20240101"; // 시작일
		url += "&eddate=20241231"; //끝나는일
		url += "&cpage=1"; //현재페이지
		url += "&rows=10"; // 포스터 경로
		url += "&shcate=AAAA"; //장르코드
		

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
	
	
	@RequestMapping(value="condeapi.co", produces="application/json; charset=UTF-8") // api 공연 상세페이지 : api로 내려줌
	public String getConInfoDetail(@RequestParam(value = "concertId")String concertId, Model model) throws IOException {

		String url = "http://www.kopis.or.kr/openApi/restful/pblprfr/" + concertId;
		url += "?service=" + serviceKey;
		url += "&newsql=Y";

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
		JsonObject dbObj = dbsObj.getAsJsonObject("db"); // {를 여는 것은 jsonObject {다음에 [있으면 array 시작
		
		br.close();
		urlConnection.disconnect();
		
		Concert conapi = new Concert();
		conapi.setOriginName(dbObj.get("mt20id").getAsString()); // 공연ID 넣어봄
		conapi.setConcertTitle(dbObj.get("prfnm").getAsString());
		conapi.setStartDate(dbObj.get("prfpdfrom").getAsString());
		conapi.setEndDate(dbObj.get("prfpdto").getAsString());
		conapi.setTheaterName(dbObj.get("fcltynm").getAsString());
		conapi.setConcertPlot(dbObj.get("prfruntime").getAsString()); // 런타임넣자
		conapi.setAgeLimit(dbObj.get("prfage").getAsString());
		conapi.setPath(dbObj.get("pcseguidance").getAsString()); // price 넣자
		conapi.setFilePath(dbObj.get("poster").getAsString()); // 포스터 이미지 경로
		conapi.setConcertProduction(dbObj.get("entrpsnm").getAsString());
//		con.setReviewContent(reviewContent); // 한줄평, 관람후기...?

		// 장르 제목(네비처럼)
		String genrenm = dbObj.get("genrenm").getAsString();
		
		model.addAttribute("conapi", conapi);
		model.addAttribute("genrenm", genrenm);
		
		
//		this.apiConselect(concertId); // 콘 id로 콘서트  api conNo 내려주기?
		
		
		return "concert/concertAPIDetailMain";
		
	}
	
//	
//	public String apiConselect(String concertId) {
//		
//		
//	}
//	
//	
	
	
	
	
	// 콘서트 플롯(콘서트id)의 콘서트 넘버를 가져와서 어쩌고 처리 ㄱ
	
	
	// 좋아요 몇개인지
	@ResponseBody
	@RequestMapping(value = "likecountApi.co", produces="application/json; charset=UTF-8")
	public String likeCount(@RequestParam(value = "userNo")String userNo, @RequestParam(value = "concertId")String concertId) {
		
		System.out.println("userNo" + " & " + "concertId");
		
		// api에서 가져온 concertId가 db의 concertplot에 담겨있음
		Concert con = concertService.selectConApi(concertId);
		int concertNo = con.getConcertNo();
		System.out.println("concertID로 가져온 concertNo:" + concertNo);
		
		Map map = new HashMap();
		map.put("userNo", Integer.parseInt(userNo));
		map.put("concertNo", concertNo);
		
		int conLikeCount = concertService.selectConLikeCountApi(concertNo);		
		int userConLikeCount = concertService.selectUserConLikeApi(map);
		
		Map<String, Object> conMap = new HashMap<>();
		conMap.put("conLikeCount", conLikeCount); // 콘서트가 가진 좋아요 총 갯수 status Y
		conMap.put("userConLikeCount", userConLikeCount); // a유저가 1이라는 콘서트에 좋아요한 갯수 status Y

		return new Gson().toJson(conMap);
	}
	
	
	
	
	// 좋아요 insert, update
	@ResponseBody
	@RequestMapping(value = "likeupdateApi.co")
	public String likeUpdate(@RequestParam(value = "concertId")String concertId, ConcertLike like) {
		
		Concert con = concertService.selectConApi(concertId);
		int concertNo = con.getConcertNo();

		// like 있는지 없는지 체크후 없으면 insert

		int userNo = like.getUserNo();
		like.setConcertLikeNo(concertNo);
		
		
		Map map = new HashMap();
		map.put("userNo", userNo);
		map.put("concertNo", concertNo);
		
		System.out.println("likeUpdate에서:" + userNo + " & " + "concertNo:" + concertNo);
		
		int result =  concertService.selectUserConLikeAllApi(map); // a유저가 1이라는 콘서트에 좋아요한 적이 있냐 status 노상관
		
		if(result > 0) {
			result = concertService.updateConLikeApi(map); // 좋아요 한 적 있으면 update
		} else {
			result = concertService.insertConLikeApi(map); // 좋아요 한 적 없으면 insert
		}
				
		int conLikeCount = concertService.selectConLikeCountApi(concertNo);
		
		if(result > 0) {
			return String.valueOf(conLikeCount);
		} else {
			return "좋아요 실패";
		}
	}
	
}



