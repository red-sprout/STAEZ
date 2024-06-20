package com.spring.staez.concert.model.dao;

import static org.junit.Assert.assertTrue;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.spring.staez.concert.model.dto.ConcertDto;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {
		"file:src/test/resources/root-context.xml",
		"file:src/test/resources/servlet-context.xml",
		"file:src/test/resources/spring-security.xml"
})
public class ConcertDaoTest {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	private ConcertDao concertDao;
	
	@Test
	public void testSelectLastAttachmentValue() {
		log.info("{}", concertDao.selectLastAttachmentValue(sqlSession));
	}
	
	@Test
	public void testSelectLastScheduleValue() {
		log.info("{}", concertDao.selectLastScheduleValue(sqlSession));
	}

	@Test
	public void testSelectConcertNoByConcertId() {
		ConcertDto concertDto = new ConcertDto();
		concertDto.setConcertPlot("PF243254");
		log.info("SelectConcertNoByConcertId(PF243254) : {}", concertDao.selectConcertNoByConcertId(sqlSession, concertDto));
	}
	
	@Test
	public void testConcertAttachmentApiCount() {
		ConcertDto concertDto = new ConcertDto();
		// API 반영된 공연
		concertDto.setConcertPlot("PF243254");
		assertTrue(concertDao.concertAttachmentApiCount(sqlSession, concertDto) > 0);
		// API 없는 공연
		concertDto.setConcertPlot("PF200000");
		assertTrue(concertDao.concertAttachmentApiCount(sqlSession, concertDto) == 0);
	}
	
	@Test
	public void testConcertScheduleApiCount() {
		ConcertDto concertDto = new ConcertDto();
		// API 반영된 공연
		concertDto.setConcertPlot("PF243254");
		assertTrue(concertDao.concertScheduleApiCount(sqlSession, concertDto) > 0);
		// API 없는 공연
		concertDto.setConcertPlot("PF200000");
		assertTrue(concertDao.concertScheduleApiCount(sqlSession, concertDto) == 0);
	}
	
}
