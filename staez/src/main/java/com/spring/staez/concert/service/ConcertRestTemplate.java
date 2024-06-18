package com.spring.staez.concert.service;

import java.lang.reflect.Type;
import java.net.URI;
import java.nio.charset.StandardCharsets;
import java.util.ArrayList;
import java.util.List;

import org.json.XML;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.util.UriComponentsBuilder;

import com.google.gson.Gson;
import com.google.gson.JsonArray;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;
import com.google.gson.reflect.TypeToken;
import com.spring.staez.concert.model.dao.ConcertDao;
import com.spring.staez.concert.model.dto.ConcertDto;
import com.spring.staez.concert.model.vo.Concert;

import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Service
public class ConcertRestTemplate {
	
	private final SqlSessionTemplate sqlSession;
	
	private final ConcertDao concertDao;
	
	@Value("${concert.service.key}")
	private String serviceKey;

	public URI makeUriList() {
	    return UriComponentsBuilder
	            .fromUriString("http://kopis.or.kr/")
	            .path("openApi/restful/pblprfr")
	            .queryParam("service", serviceKey)
	            .queryParam("stdate", "20240101")
	            .queryParam("eddate", "20241231")
	            .queryParam("cpage", "1")
	            .queryParam("rows", "10")
	            .queryParam("shcate", "AAAA")
	            .encode(StandardCharsets.UTF_8)
	            .build()
	            .toUri();
	}
	
	
	// concertId로 api 콘서트 상세조회 위해 concertId로 매퍼로 가져와서 세부콘서트내용 조화하는데 넣어줌
	public List<URI> makeUriDetail() {
		ArrayList<ConcertDto> conIdList = new ArrayList();
		conIdList = concertDao.selectConcertId(sqlSession, conIdList);

		// uri 담을 리스트
		List concertIdList = new ArrayList();
		
		for(int i = 0; i < conIdList.size(); i++) {
			String concertId = conIdList.get(i).getConcertPlot();

			URI uri = UriComponentsBuilder
		            .fromUriString("http://kopis.or.kr/")
		            .path("openApi/restful/pblprfr")
		            .queryParam("concertId", concertId)
		            .queryParam("service", serviceKey)
		            .queryParam("newsql", "Y")
		            .encode(StandardCharsets.UTF_8)
		            .build()
		            .toUri();
			
			concertIdList.add(uri);
		}
	    return concertIdList;
	}


//	attatchment 에는 concertNo, originName, changeName, filePath 필요
//	schedule 에는 concertNo, startDate, endDate 필요

	@Transactional(rollbackFor = {Exception.class})	
	public void conDetailapiInsert() {
		ArrayList concertIdList = (ArrayList) makeUriDetail();
		
		if(!concertIdList.isEmpty()) {
			for(int i = 0; i < concertIdList.size(); i++) {
				URI uri = (URI) concertIdList.get(i);
				
		        // API 호출 로직
		        RestTemplate rt = new RestTemplate();
		        ResponseEntity<String> response = rt.getForEntity(uri, String.class);
		        if (response.getStatusCode() == HttpStatus.OK) {
		            String responseData = response.getBody();
//		            int result = concertDao.conapiDelete(sqlSession);

		            
		            // xml to json
		    		org.json.JSONObject xmltojsonObj = XML.toJSONObject(responseData);
		    		String jsonObj = xmltojsonObj.toString();
		    		
		    		JsonObject totalObj = JsonParser.parseString(jsonObj).getAsJsonObject();
		    		JsonObject dbsObj = totalObj.getAsJsonObject("dbs"); //totalObj 안에 있는 키로 object 꺼내올 수 있다
		    		JsonArray dbArr = dbsObj.getAsJsonArray("db"); // {를 여는 것은 jsonObject {다음에 [있으면 array 시작
		    		
		    		
		            ArrayList<ConcertDto> concertList = parseConcertData(dbArr.toString());
		            
		   		    // 데이터를 엔티티에 매핑하여 저장
		            for (ConcertDto concertDto : concertList) {
		            	if(concertDao.concertTitleCount(sqlSession, concertDto.getConcertTitle()) == 0)
		            		concertDao.conapiAttatchmentApiInsert(sqlSession, concertDto);
		            		concertDao.conapiScheduleApiInsert(sqlSession, concertDto);
			}
		}
            }
        }
    }
	
	
	@Transactional(rollbackFor = {Exception.class})	
	public void conapiInsert() {
		URI uri = makeUriList();
        // API 호출 로직
        RestTemplate rt = new RestTemplate();
        ResponseEntity<String> response = rt.getForEntity(uri, String.class);
        if (response.getStatusCode() == HttpStatus.OK) {
            String responseData = response.getBody();
//            int result = concertDao.conapiDelete(sqlSession);

    		// xml to json
    		org.json.JSONObject xmltojsonObj = XML.toJSONObject(responseData);
    		String jsonObj = xmltojsonObj.toString();
    		
    		JsonObject totalObj = JsonParser.parseString(jsonObj).getAsJsonObject();
    		JsonObject dbsObj = totalObj.getAsJsonObject("dbs"); //totalObj 안에 있는 키로 object 꺼내올 수 있다
    		JsonArray dbArr = dbsObj.getAsJsonArray("db"); // {를 여는 것은 jsonObject {다음에 [있으면 array 시작
    		
            ArrayList<ConcertDto> concertList = parseConcertData(dbArr.toString());
            
            // 데이터를 엔티티에 매핑하여 저장
            for (ConcertDto concertDto : concertList) {
            	if(concertDao.concertTitleCount(sqlSession, concertDto.getConcertTitle()) == 0)
            		concertDao.conapiInsert(sqlSession, concertDto);
            }
        }
    }

	
	
    public ArrayList<ConcertDto> parseConcertData(String responseData) {
    	 // Gson 인스턴스 생성
        Gson gson = new Gson();
        
        // List<ConcertDTO> 타입을 나타내는 TypeToken 생성
        Type concertListType = new TypeToken<ArrayList<ConcertDto>>(){}.getType();
        
        // JSON 데이터를 List<ConcertDTO> 객체로 변환
        ArrayList<ConcertDto> concertList = gson.fromJson(responseData, concertListType);
        
        // ArrayList로 변환하여 반환
        return new ArrayList<>(concertList);
    }
	
}
