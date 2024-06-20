package com.spring.staez.user.service;

import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Service;

import com.spring.staez.user.model.dao.UserDao;
import com.spring.staez.user.model.vo.User;

import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Service
public class UserServiceImpl implements UserService{
	
	private final SqlSessionTemplate sqlSession;
	private final UserDao userDao;

	@Override
	public User loginUser(User u) {
		return userDao.loginUser(sqlSession, u);
	}
	
	@Override //회원가입 아이디 중복체크
	public int idCheck(String checkId) {
		return userDao.idCheck(sqlSession, checkId);
	}
	
	@Override //회원가입 닉네임 중복체크
	public int nickCheck(String checkNick) {
		return userDao.nickCheck(sqlSession, checkNick);
	}

//	회원가입
	@Override
	public int insertUser(User u) {
		return userDao.insertUser(sqlSession, u);
	}
	
	// 회원가입시 이메일 중복체크
	@Override
	public User emailCheck(String email) {
		return userDao.emailCheck(sqlSession, email);
	}

	// 간편로그인 이메일 유무 확인 (네이버, 카카오, 구글)
	@Override
	public User findUserByEmail(String email) {
        return userDao.findUserByEmail(sqlSession,email);
    }

	// 이메일 인증번호 저장을 위한 서비스
	@Override
	public int registerUser(String email, String authNo ) {
        return userDao.registerUser(email, authNo);
    }
	
	// 이메일 존재 여부 확인
	@Override
	public Map<String, Object> findEmail(String email) {
	    return userDao.findEmail(sqlSession, email);
	}
	
	//이메일 암호키 인증체크
	@Override
	public int emailSecretCodeCheck(String authNo, String email) {
		return userDao.emailSecretCodeCheck(sqlSession, authNo, email);
	}
	
    // 이메일로 아이디찾기
    @Override
    public String findEmailCheck(String checkFindEmail, String userName) {
        return userDao.findEmailCheck(sqlSession, checkFindEmail, userName);
    }
    
    // 핸드폰으로 아이디찾기
    @Override
	public String findPhoneCheck(String checkFindPhone, String userName) {
		return userDao.findPhoneCheck(sqlSession, checkFindPhone, userName);
	}
	
	// 유효성 검사 및 사용자 정보 확인
	@Override
	public String findUserByIdEmailPhone(String user_id, String phone, String email) {
	    return userDao.findUserByIdEmailPhone(sqlSession, user_id, phone, email);
	}

	//새로운 비밀번호 저장
	@Override
	public int updatePassword(String user_id, String phone, String email, String encPwd) {
	    return userDao.updatePassword(sqlSession, user_id, phone, email, encPwd);
	}

	// 이메일 인증 완료하면 정보 업데이트(테이블에 이메일 데이터 있을때)
	@Override
	public int updateEmailAuth(String email, String authNo) {
		return userDao.updateEmailAuth(sqlSession, email , authNo);
	}

	// 아이디/비번 찾기 중 이메일과 이름이 일치하는지
    @Override
    public int emailbyIdCheck(String checkEmail, String userName) {
        int result = userDao.emailbyIdCheck(checkEmail, userName);
        System.out.println("emailbyIdCheck result: " + result);
        return result;
    }


}
