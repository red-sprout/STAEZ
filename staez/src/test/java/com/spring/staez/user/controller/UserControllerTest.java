package com.spring.staez.user.controller;

import static org.junit.Assert.assertEquals;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.get;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.status;

import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.MvcResult;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;
import org.springframework.web.context.WebApplicationContext;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@RunWith(SpringJUnit4ClassRunner.class)
@WebAppConfiguration
@ContextConfiguration(locations = {
		"file:src/test/resources/root-context.xml",
		"file:src/test/resources/servlet-context.xml",
		"file:src/test/resources/spring-security.xml"
})
public class UserControllerTest {
	
	@Autowired
	private WebApplicationContext wac; // 웹어플리케이션 컨텍스트

	private MockMvc mockMvc; // HTTP요청 및 응답을 모의로 테스트 할 수 있는 객체
	
	@Before // Test메서드가 실행되기 전에 실행하는 메서드
	public void setup() {
		this.mockMvc = MockMvcBuilders.webAppContextSetup(this.wac).build(); // mockMvc에 컨텍스트 정보를 저장
		log.info("====================mockMvc 준비 완료====================");
	}

	@Test
	public void testIdCheck() {
		MvcResult result;
		try {
			result = mockMvc.perform(
					get("/idCheck.me") // POST 메서드로 /login.me 요청
					.param("checkId", "admin")) // 요청 파라미터 userId 세팅
					.andExpect(status().isOk())
					.andReturn();
			
	        // 응답 본문의 내용 확인 
	        String content = result.getResponse().getContentAsString();
	        assertEquals("NNNNN", content); // 아이디 사용가능 결과와 비교
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
