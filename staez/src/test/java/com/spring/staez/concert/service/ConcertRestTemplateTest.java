package com.spring.staez.concert.service;

import static org.junit.Assert.fail;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {
		"file:src/test/resources/root-context.xml",
		"file:src/test/resources/servlet-context.xml",
		"file:src/test/resources/spring-security.xml"
})
public class ConcertRestTemplateTest {
	
	@Autowired
	private ConcertRestTemplate concertRestTemplate;
	
	@Test
	public void testMakeUri() {
		log.info(concertRestTemplate.makeUri().toString());
	}

	@Test
	public void testConapiInsert() {
		fail("Not yet implemented");
	}

	@Test
	public void testConcertRestTemplate() {
		fail("Not yet implemented");
	}

}
