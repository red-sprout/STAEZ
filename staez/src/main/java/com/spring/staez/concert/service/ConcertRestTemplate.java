package com.spring.staez.concert.service;

import java.lang.reflect.Type;
import java.net.URI;
import java.nio.charset.StandardCharsets;
import java.util.ArrayList;

import org.json.XML;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.transaction.support.TransactionSynchronizationManager;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.util.UriComponentsBuilder;

import com.google.gson.Gson;
import com.google.gson.JsonArray;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;
import com.google.gson.reflect.TypeToken;
import com.spring.staez.concert.model.dao.ConcertDao;
import com.spring.staez.concert.model.dto.ConcertDto;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@RequiredArgsConstructor
@Service
@Transactional
public class ConcertRestTemplate {
	
	private final SqlSessionTemplate sqlSession;
	
	private final ConcertDao concertDao;
	
	@Value("${concert.service.key}")
	private String serviceKey;
	
	public URI makeUriDetail() {
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
	
    public ArrayList<ConcertDto> parseConcertData(String responseData) {
    	// Gson 인스턴스 생성
    	Gson gson = new Gson();
    	// List<ConcertDTO> 타입을 나타내는 TypeToken 생성
    	Type concertListType = new TypeToken<ArrayList<ConcertDto>>(){}.getType();
    	// JSON 데이터를 List<ConcertDto> 객체로 변환
    	ArrayList<ConcertDto> concertList = gson.fromJson(responseData, concertListType);
    	// ArrayList로 변환하여 반환
    	return new ArrayList<>(concertList);
    }
	
	public void requestConcertApi() {
		URI uri = makeUriDetail();
        // API 호출 로직
        RestTemplate rt = new RestTemplate();
        ResponseEntity<String> response = rt.getForEntity(uri, String.class);
        if (response.getStatusCode() == HttpStatus.OK) {
            String responseData = response.getBody();
    		// xml to json
    		org.json.JSONObject xmltojsonObj = XML.toJSONObject(responseData);
    		String jsonObj = xmltojsonObj.toString();
    		
    		JsonObject totalObj = JsonParser.parseString(jsonObj).getAsJsonObject();
    		JsonObject dbsObj = totalObj.getAsJsonObject("dbs"); //totalObj 안에 있는 키로 object 꺼내올 수 있다
    		JsonArray dbArr = dbsObj.getAsJsonArray("db"); // {를 여는 것은 jsonObject {다음에 [있으면 array 시작
    		
            ArrayList<ConcertDto> concertList = parseConcertData(dbArr.toString());
            concertTotalApiInsert(concertList);
        }
    }
	
	@Transactional(propagation = Propagation.REQUIRED)
	public void concertTotalApiInsert(ArrayList<ConcertDto> concertList) {
		log.info("==== outMethod start ====");
		log.info("==== outMethod transaction Active : {}", TransactionSynchronizationManager.isActualTransactionActive());
        // 데이터를 엔티티에 매핑하여 저장
        for(ConcertDto concertDto : concertList) {
        	log.info(concertDto.toString());
        	if(concertDao.concertIdCount(sqlSession, concertDto.getConcertPlot()) == 0) {
        		concertApiInsert(concertDto);
        	}
        	
        	int concertNo = concertDao.selectConcertNoByConcertId(sqlSession, concertDto);
        	if(concertDao.concertAttachmentApiCount(sqlSession, concertDto) == 0 && concertNo > 0) {
        		concertDto.setConcertNo(concertNo);
        		concertAttatchmentApiInsert(concertDto);
        	}
        	
        	if(concertDao.concertScheduleApiCount(sqlSession, concertDto) == 0 && concertNo > 0) {
        		concertDto.setConcertNo(concertNo);
        		concertScheduleApiInsert(concertDto);
        	}
        }
        log.info("==== outMethod end ====");
	}
	
	@Transactional
	public void concertApiInsert(ConcertDto concertDto) {
		log.info("==== innerMethod concertApiInsert start ====");
		log.info("==== innerMethod concertApiInsert transaction Active : {}", TransactionSynchronizationManager.isActualTransactionActive());
		int concertResult = concertDao.concertApiInsert(sqlSession, concertDto);
		if(concertResult == 0)
			throw new RuntimeException("concert table 삽입 실패");
		log.info("==== innerMethod concertApiInsert end ====");
	}
	
	@Transactional
	public void concertAttatchmentApiInsert(ConcertDto concertDto) {
		log.info("==== innerMethod concertAttatchmentApiInsert start ====");
		log.info("==== innerMethod concertAttatchmentApiInsert transaction Active : {}", TransactionSynchronizationManager.isActualTransactionActive());
		int attachmentResult = concertDao.concertAttatchmentApiInsert(sqlSession, concertDto);
		if(attachmentResult == 0)
			throw new RuntimeException("concert_attachment table 삽입 실패");
		log.info("==== innerMethod concertAttatchmentApiInsert end ====");
	}
	
	@Transactional
	public void concertScheduleApiInsert(ConcertDto concertDto) {
		log.info("==== innerMethod concertScheduleApiInsert start ====");
		log.info("==== innerMethod concertScheduleApiInsert transaction Active : {}", TransactionSynchronizationManager.isActualTransactionActive());
		int scheduleResult = concertDao.concertScheduleApiInsert(sqlSession, concertDto);
		if(scheduleResult == 0)
			throw new RuntimeException("concert_schedule table 삽입 실패");
		log.info("==== innerMethod concertScheduleApiInsert end ====");
	}

}
