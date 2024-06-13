package com.spring.staez.user.model.dao;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.fail;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.spring.staez.user.model.vo.User;
import com.spring.staez.user.service.UserService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {
		"file:src/test/resources/root-context.xml",
		"file:src/test/resources/servlet-context.xml",
		"file:src/test/resources/spring-security.xml"
})
public class UserDaoTest {
	
	@Autowired
	private UserDao userDao;
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	@Test
	public void testLoginUser() {
		User u = new User();
		u.setUserId("admin");
		u.setUserPwd("1234");
		
		u = userDao.loginUser(sqlSession, u);
		log.info("user : " + u);
		if (u != null) {			
			assertEquals("userNameEquals", "관리자", u.getUserName());
		} else {
			fail("testLoginUser fail");
		}
	}

	@Test
	public void testIdCheck() {
		fail("Not yet implemented");
	}

	@Test
	public void testNickCheck() {
		fail("Not yet implemented");
	}

	@Test
	public void testInsertUser() {
		fail("Not yet implemented");
	}

	@Test
	public void testFindUserByEmail() {
		fail("Not yet implemented");
	}

	@Test
	public void testRegisterUser() {
		fail("Not yet implemented");
	}

	@Test
	public void testFindEmail() {
		fail("Not yet implemented");
	}

	@Test
	public void testEmailSecretCodeCheck() {
		fail("Not yet implemented");
	}

	@Test
	public void testFindEmailCheck() {
		fail("Not yet implemented");
	}

	@Test
	public void testFindUserByIdEmailPhone() {
		fail("Not yet implemented");
	}

	@Test
	public void testUpdatePassword() {
		fail("Not yet implemented");
	}

	@Test
	public void testUpdateEmailAuth() {
		fail("Not yet implemented");
	}

}
