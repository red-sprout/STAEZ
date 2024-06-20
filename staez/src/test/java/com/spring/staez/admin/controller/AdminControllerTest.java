package com.spring.staez.admin.controller;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;
import org.springframework.test.web.servlet.MockMvc;
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
public class AdminControllerTest {
	
	@Autowired
	private WebApplicationContext wac;

	private MockMvc mockMvc;

	@Test
	public void testSelectOneBoard() {
		
	}

}
