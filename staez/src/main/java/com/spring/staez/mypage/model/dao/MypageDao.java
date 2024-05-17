package com.spring.staez.mypage.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.spring.staez.user.model.vo.User;

@Repository
public class MypageDao {
	public User test(SqlSessionTemplate sqlSession) {
		
		User m = sqlSession.selectOne("userMapper.test"); 
		System.out.println(m);
		
		return m ;
	}
}
