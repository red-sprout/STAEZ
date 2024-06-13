package com.spring.staez.concert.model.dao;

import static org.junit.Assert.*;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.spring.staez.user.model.dao.UserDaoTest;

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
	public void testSelectCate() {
		fail("Not yet implemented");
	}

	@Test
	public void testSelectCateCon() {
		fail("Not yet implemented");
	}

	@Test
	public void testSelectconList() {
		fail("Not yet implemented");
	}

	@Test
	public void testSelectCon() {
		fail("Not yet implemented");
	}

	@Test
	public void testSelectConDetail() {
		fail("Not yet implemented");
	}

	@Test
	public void testSelectComCount() {
		fail("Not yet implemented");
	}

	@Test
	public void testSelectComDetail() {
		fail("Not yet implemented");
	}

	@Test
	public void testSelectRevDetail() {
		fail("Not yet implemented");
	}

	@Test
	public void testCheckLikeExist() {
		fail("Not yet implemented");
	}

	@Test
	public void testSelectConLikeCount() {
		fail("Not yet implemented");
	}

	@Test
	public void testSelectUserConLike() {
		fail("Not yet implemented");
	}

	@Test
	public void testSelectUserConLikeAll() {
		fail("Not yet implemented");
	}

	@Test
	public void testUpdateConLike() {
		fail("Not yet implemented");
	}

	@Test
	public void testInsertConLike() {
		fail("Not yet implemented");
	}

	@Test
	public void testPopularList() {
		fail("Not yet implemented");
	}

	@Test
	public void testLatestList() {
		fail("Not yet implemented");
	}

	@Test
	public void testHighscoreList() {
		fail("Not yet implemented");
	}

	@Test
	public void testLocationAllList() {
		fail("Not yet implemented");
	}

	@Test
	public void testSelectComList() {
		fail("Not yet implemented");
	}

	@Test
	public void testSelectRevCount() {
		fail("Not yet implemented");
	}

	@Test
	public void testSelectRevList() {
		fail("Not yet implemented");
	}

	@Test
	public void testSelectSeatPrice() {
		fail("Not yet implemented");
	}

	@Test
	public void testConapiCount() {
		assertEquals("concertApiCount", 0, concertDao.conapiCount(sqlSession));
	}

	@Test
	public void testConapiInsert() {
		 
	}

}
