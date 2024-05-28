package com.spring.staez.user.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.spring.staez.user.model.vo.User;

@Repository
public class UserDao {

	public User loginUser(SqlSessionTemplate sqlSession, User u) {
		return sqlSession.selectOne("userMapper.loginUser", u);
	}
    //회원가입 아이디 중복체크
	public int idCheck(SqlSessionTemplate sqlSession, String checkId) {
		return sqlSession.selectOne("userMapper.idCheck", checkId);
	}
	
	//회원가입 닉네임 중복체크
	public int nickCheck(SqlSessionTemplate sqlSession, String checkNick) {
		return sqlSession.selectOne("userMapper.checkNick", checkNick);
	}
	
	//회원가입
	public int insertUser(SqlSessionTemplate sqlSession, User u) {
		return sqlSession.insert("userMapper.insertUser", u);
	}
	
	//회원가입 이메일 체크
	public int emailCheck(SqlSessionTemplate sqlSession, String checkEmail) {
		return sqlSession.selectOne("userMapper.checkNick", checkEmail);
	}
	
	// 네이버로그인 이메일 유무 확인
    public User findUserByEmail(SqlSessionTemplate sqlSession, String email) {
        return sqlSession.selectOne("userMapper.findUserByEmail", email);
    }

}
