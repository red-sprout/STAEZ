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
	
	public int duplicateCheck(SqlSessionTemplate sqlSession, String nickname) {
		int result = sqlSession.selectOne("mypageMapper.duplicateCheck", nickname);
		System.out.println(result);
		return result;
	}
	
	public int updatePassword(SqlSessionTemplate sqlSession, User user) {
		int result = sqlSession.update("mypageMapper.updatePassword", user);
		System.out.println(result);
		return result;
		
	}
}
