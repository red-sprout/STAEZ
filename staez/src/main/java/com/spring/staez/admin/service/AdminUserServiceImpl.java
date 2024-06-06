package com.spring.staez.admin.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.spring.staez.admin.model.dao.AdminUserDao;
import com.spring.staez.admin.model.dto.AdminSearchDto;
import com.spring.staez.admin.model.dto.AdminUserSelectDto;
import com.spring.staez.common.model.vo.PageInfo;
import com.spring.staez.user.model.vo.User;

@Service
public class AdminUserServiceImpl implements AdminUserService{

	@Autowired
	SqlSessionTemplate sqlSession;
	
	@Autowired
	AdminUserDao adminUserDao;
	
	@Transactional(readOnly = true)
	@Override
	public int selectUserCnt(AdminSearchDto dto) {
		return adminUserDao.selectUserCnt(sqlSession, dto);
	}

	@Transactional(readOnly = true)
	@Override
	public ArrayList<User> selectUser(AdminSearchDto dto, PageInfo pi) {
		return adminUserDao.selectUser(sqlSession, dto, pi);
	}

	@Transactional(rollbackFor = {Exception.class})
	@Override
	public int deleteUser(AdminUserSelectDto dto) {
		return adminUserDao.deleteUser(sqlSession, dto);
	}

	@Transactional(rollbackFor = {Exception.class})
	@Override
	public int updateGradeUser(AdminUserSelectDto dto) {
		return adminUserDao.updateGradeUser(sqlSession, dto);
	}

}
