package com.spring.staez.concert.service;

import static org.junit.Assert.assertTrue;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.EnableScheduling;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.transaction.support.TransactionSynchronizationManager;

import lombok.extern.slf4j.Slf4j;

@EnableScheduling
@Slf4j
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {
		"file:src/test/resources/root-context.xml",
		"file:src/test/resources/servlet-context.xml",
		"file:src/test/resources/spring-security.xml"
})
public class ConcertAPIServiceTest {
	
	@Autowired
	private ConcertAPIService concertAPIService;
	
	@Test
	@Transactional
	public void testTransactional() {
		log.info("==== Method start ====");
		boolean txActive = TransactionSynchronizationManager.isActualTransactionActive();
		log.info("==== Method transaction Active : {}", txActive);
		assertTrue(TransactionSynchronizationManager.isActualTransactionActive());
		log.info("==== Method end ====");
	}
	
	@Test
	public void testScheduled() {
		concertAPIService.requestConcertApi();
	}
	
}
