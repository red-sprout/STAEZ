package com.spring.staez.concert.controller;

import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.get;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.status;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;

import org.json.XML;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.MvcResult;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;
import org.springframework.web.context.WebApplicationContext;

import com.google.gson.JsonArray;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;
import com.spring.staez.concert.model.vo.Concert;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@RunWith(SpringJUnit4ClassRunner.class)
@WebAppConfiguration
@ContextConfiguration(locations = {
		"file:src/test/resources/root-context.xml",
		"file:src/test/resources/servlet-context.xml",
		"file:src/test/resources/spring-security.xml"
})
public class ConcertAPIControllerTest {
	
	@Value("${concert.service.key}")
	private String serviceKey;
	
	@Autowired
	private WebApplicationContext wac;

	private MockMvc mockMvc;
	
	@Before // Test메서드가 실행되기 전에 실행하는 메서드
	public void setup() {
		this.mockMvc = MockMvcBuilders.webAppContextSetup(this.wac).build();
	}
	
	@Test
	public void testGetConInfoDetailApi() {
		MvcResult result;
		try {
			mockMvc.perform(
					get("/condeapi.co")
					.param("concertId", "PF243147"))
					.andExpect(status().isOk());
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	@Test
	public void testConcertApiParser() throws IOException {
		String url = "http://www.kopis.or.kr/openApi/restful/pblprfr/" + "PF242664";
		//PF242664 - 예매처 1개
		//PF243147 - 예매처 여러개
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
		
		org.json.JSONObject xmltojsonObj = XML.toJSONObject(responseText);
		String jsonObj = xmltojsonObj.toString();
		
		JsonObject totalObj = JsonParser.parseString(jsonObj).getAsJsonObject();
		log.info("totalObj : {}", totalObj);
		
		JsonObject dbsObj = totalObj.getAsJsonObject("dbs");
		log.info("dbsObj : {}", dbsObj);
		
		JsonObject dbObj = dbsObj.getAsJsonObject("db");
		log.info("dbObj : {}", dbObj);
		
		JsonObject relates = dbObj.getAsJsonObject("relates");
		log.info("relates : {}", relates);
		
		JsonObject relate = null;
		try {			
			JsonArray relateArr = relates.getAsJsonArray("relate");
			relate = (JsonObject) relateArr.get(0);
			log.info("relate(Many Objects) : {}", relate);
		} catch (Exception e) {
			relate = relates.getAsJsonObject("relate");
			log.info("relate(One Object) : {}", relate);
		}

		br.close();
		urlConnection.disconnect();
	}

}
