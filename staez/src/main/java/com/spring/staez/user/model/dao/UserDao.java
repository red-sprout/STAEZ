package com.spring.staez.user.model.dao;
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
	
	// 회원가입시 이메일 중복체크
	public User emailCheck(SqlSessionTemplate sqlSession2, String email) {
		return sqlSession.selectOne("userMapper.emailCheck", email);
	}
	
	// 간편로그인 이메일 유무 확인 (네이버, 카카오, 구글)
    public User findUserByEmail(SqlSessionTemplate sqlSession, String email) {
        return sqlSession.selectOne("userMapper.findUserByEmail", email);
    }

 // 이메일 인증번호 저장을 위한 서비스
    public int registerUser(String email, String authNo ) {
        Map<String, Object> params = new HashMap<>();
        params.put("email", email);
        params.put("authNo", authNo);
        return sqlSession.insert("userMapper.registerUser", params);
    }
    
 // 이메일 존재 여부 확인
    public Map<String, Object> findEmail(SqlSessionTemplate sqlSession, String email) {
        return sqlSession.selectOne("userMapper.findEmail", email);
    }
    
   //이메일 암호키 인증체크
    public int emailSecretCodeCheck(SqlSessionTemplate sqlSession, String authNo, String email) {
        //System.out.println("UUID Check: " + authNo);
       // System.out.println("Email: " + email);
        Map<String, Object> params = new HashMap<>();
        params.put("email", email);
        params.put("authNo", authNo);
        return sqlSession.selectOne("userMapper.emailSecretCodeCheck", params);
    }
    
    // 이메일로 아이디찾기
    public String findEmailCheck(SqlSessionTemplate sqlSession, String checkFindEmail, String userName) {
        Map<String, Object> params = new HashMap<>();
        params.put("email", checkFindEmail);
        params.put("userName", userName);
        String result = sqlSession.selectOne("userMapper.findEmailCheck", params);
        return result;
    }
    
    //핸드폰으로 아이디찾기
	public int findPhoneCheck(SqlSessionTemplate sqlSession, String checkFindPhone, String userName) {
        Map<String, Object> params = new HashMap<>();
        params.put("phone", checkFindPhone);
        params.put("userName", userName);
        int result = sqlSession.selectOne("userMapper.findPhoneCheck", params);
        return result;
	}
	
	// 유효성 검사 및 사용자 정보 확인
	public String findUserByIdEmailPhone(SqlSessionTemplate sqlSession, String user_id, String phone, String email) {
	    Map<String, Object> params = new HashMap<>();
	    params.put("userId", user_id);
	    params.put("phone", phone);
	    params.put("email", email);
	    String result = sqlSession.selectOne("userMapper.findUserByIdEmailPhone", params);
	    return result;
	}

	//새로운 비밀번호 저장
	public int updatePassword(SqlSessionTemplate sqlSession, String user_id, String phone, String email, String encPwd) {
	    Map<String, Object> params = new HashMap<>();
	    params.put("userId", user_id);
	    params.put("phone", phone);
	    params.put("email", email);
	    params.put("encPwd", encPwd);

	    int result = sqlSession.update("userMapper.updatePassword", params);
	    System.out.println("update Dao result: " + result);

	    return result;
	}
	
	// 이메일 인증 완료하면 정보 업데이트(테이블에 이메일 데이터 있을때)
	public int updateEmailAuth(SqlSessionTemplate sqlSession, String email, String authNo) {
	    Map<String, Object> params = new HashMap<>();
	    params.put("email", email);
	    params.put("authNo", authNo);
		return sqlSession.insert("userMapper.updateEmailAuth", params);
	}
	
    // 아이디/비번 찾기 중 이메일과 이름이 일치하는지
    public int emailbyIdCheck(String checkEmail, String userName) {
        Map<String, Object> params = new HashMap<>();
        params.put("email", checkEmail);
        params.put("user_name", userName);
        Integer result = sqlSession.selectOne("userMapper.emailbyIdCheck", params);
        System.out.println("DAO emailbyIdCheck result: " + result);
        return result != null ? result : 0;
    }
	

}
