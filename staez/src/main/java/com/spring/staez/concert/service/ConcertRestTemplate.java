//package com.spring.staez.concert.service;
//
//import java.io.BufferedReader;
//import java.io.InputStreamReader;
//import java.lang.reflect.Type;
//import java.net.HttpURLConnection;
//import java.net.URI;
//import java.nio.charset.StandardCharsets;
//import java.util.ArrayList;
//
//import org.json.JSONObject;
//import org.json.XML;
//import org.mybatis.spring.SqlSessionTemplate;
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.beans.factory.annotation.Value;
//import org.springframework.http.HttpStatus;
//import org.springframework.http.ResponseEntity;
//import org.springframework.stereotype.Service;
//import org.springframework.transaction.annotation.Transactional;
//import org.springframework.web.client.RestTemplate;
//import org.springframework.web.util.UriComponentsBuilder;
//
//import com.google.gson.Gson;
//import com.google.gson.JsonArray;
//import com.google.gson.JsonObject;
//import com.google.gson.JsonParser;
//import com.google.gson.reflect.TypeToken;
//import com.spring.staez.concert.model.dao.ConcertDao;
//import com.spring.staez.concert.model.vo.Concert;
//
//@Service
//public class ConcertRestTemplate {
//	
//
//	@Autowired
//	private SqlSessionTemplate sqlSession;
//	
//	@Autowired
//	private ConcertDao concertDao;
//	
//	@Value("${concert.service.key}")
//	private String serviceKey;
//
//	
//	
//	@Transactional(rollbackFor = {Exception.class})	
//	public void conapiInsert() {
//		
//		int conapiCount = concertDao.conapiCount(sqlSession);
//		System.out.println("conapiCount:" + conapiCount);
//		
//	    URI uri = UriComponentsBuilder
//	            .fromUriString("http://kopis.or.kr/")
//	            .path("openApi/restful/pblprfr")
//	            .queryParam("service", serviceKey)
//	            .queryParam("stdate", "20240101")
//	            .queryParam("eddate", "20241231")
//	            .queryParam("cpage", "1")
//	            .queryParam("rows", "3")
//	            .queryParam("shcate", "AAAA")
//	            .encode(StandardCharsets.UTF_8)
//	            .build()
//	            .toUri();
//	    
//		System.out.println(uri);
//		// 만약 theater_no 값이 null이라면? 갯수조건을 넣어야하나?
//		
//		
//		if (conapiCount > 5) { // 더미갯수
//            // API 호출 로직
//            RestTemplate rt = new RestTemplate();
//            ResponseEntity<String> response = rt.getForEntity(uri, String.class);
//
//            if (response.getStatusCode() == HttpStatus.OK) {
//                String responseData = response.getBody();
//
//        		// xml to jason
//        		org.json.JSONObject xmltojsonObj = XML.toJSONObject(responseData);
//        		String jsonObj = xmltojsonObj.toString();
//        		
//        		JsonObject totalObj = JsonParser.parseString(jsonObj).getAsJsonObject();
//        		JsonObject dbsObj = totalObj.getAsJsonObject("dbs"); //totalObj 안에 있는 키로 object 꺼내올 수 있다
//        		JsonArray dbArr = dbsObj.getAsJsonArray("db"); // {를 여는 것은 jsonObject {다음에 [있으면 array 시작
//        		
//        		System.out.println("dbArr:" + dbArr);
//                ArrayList<Concert> concertList = parseConcertData(dbArr.toString());
//                
//                // 데이터를 엔티티에 매핑하여 저장
//                for (Concert concert : concertList) {
//                    concertDao.conapiInsert(sqlSession, concert);
//                }
//            }
//        }
//
//
//        
//    }
//
//	    private ArrayList<Concert> parseConcertData(String responseData) {
//	    	 // Gson 인스턴스 생성
//	        Gson gson = new Gson();
//	        
//	        // List<Concert> 타입을 나타내는 TypeToken 생성
//	        Type concertListType = new TypeToken<ArrayList<Concert>>(){}.getType();
//	        
//	        // JSON 데이터를 List<Concert> 객체로 변환
//	        ArrayList<Concert> concertList = gson.fromJson(responseData, concertListType);
//	        
//	        // ArrayList로 변환하여 반환
//	        return new ArrayList<>(concertList);
//	    }
//	
//	
//	
//
//}
