package com.spring.staez.user.model.dao;

import java.time.LocalDateTime;
import java.util.HashMap;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.staez.user.model.vo.User;

@Repository
public class UserDao {
	
	@Autowired
    private SqlSessionTemplate sqlSession;

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
	
	// 네이버로그인 이메일 유무 확인
    public User findUserByEmail(SqlSessionTemplate sqlSession, String email) {
        return sqlSession.selectOne("userMapper.findUserByEmail", email);
    }

 // 이메일 인증번호 저장을 위한 서비스
    public int registerUser(String email, String authNo, LocalDateTime send_time) {
        Map<String, Object> params = new HashMap<>();
        params.put("email", email);
        params.put("authNo", authNo);
        params.put("send_time", send_time);
        return sqlSession.insert("userMapper.registerUser", params);
    }
    
  //암호키 인증체크
	public int emailSecretCodeCheck(SqlSessionTemplate sqlSession,String uuidCheck, String email) {
        Map<String, Object> params = new HashMap<>();
        params.put("email", email);
        params.put("uuidCheck", uuidCheck);
        return sqlSession.selectOne("userMapper.emailSecretCodeCheck", params);
	}
}
