package com.spring.staez.user.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.staez.user.model.dao.UserDao;
import com.spring.staez.user.model.vo.User;

@Service
public class UserServiceImpl implements UserService{
	
	@Autowired
	SqlSessionTemplate sqlSession;
	
	@Autowired
	UserDao userDao;

	@Override
	public User loginUser(User u) {
		return userDao.loginUser(sqlSession, u);
	}

}
