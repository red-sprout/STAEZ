package com.spring.staez.mypage.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.spring.staez.community.model.vo.Board;
import com.spring.staez.community.model.vo.BoardLike;
import com.spring.staez.user.model.vo.ProfileImg;
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
		return result;
	}
	
	public int passwordCheck(SqlSessionTemplate sqlSession, String inputPwd) {
		int result = sqlSession.selectOne("mypageMapper.passwordCheck", inputPwd);
		System.out.println(result);
		return result;
	}
	
	
	public int updatePassword(SqlSessionTemplate sqlSession, User user) {
		int result = sqlSession.update("mypageMapper.updatePassword", user);
		return result;
		
	}

	public int updateUserInfo(SqlSessionTemplate sqlSession, User user) {
		int result = sqlSession.update("mypageMapper.updateUserInfo", user);
		return result;
	}

	public int insertProfileImg(SqlSessionTemplate sqlSession, ProfileImg profileImg) {
		int result = sqlSession.insert("mypageMapper.insertProfileImg", profileImg);
		return result;
	}

	public int updateProfileImg(SqlSessionTemplate sqlSession, ProfileImg profileImg) {
		int result = sqlSession.update("mypageMapper.updateProfileImg", profileImg);
		return result;
	}
	
	public int withdrawalUser(SqlSessionTemplate sqlSession, User user) {
		int result = sqlSession.update("mypageMapper.withdrawalUser", user);
		return result;
	}
	
	public int selectMyBoardListCount(SqlSessionTemplate sqlSession, int userNo) {
		int count = sqlSession.selectOne("mypageMapper.selectMyBoardListCount", userNo);
		return count;
	}

	public ArrayList<Board> selectMyBoardList(SqlSessionTemplate sqlSession, int userNo) {
		ArrayList<Board> list = (ArrayList)sqlSession.selectList("mypageMapper.selectMyBoardList", userNo);
		return list;
		
	}

	public int selectLikeBoardListCount(SqlSessionTemplate sqlSession, int userNo) {
		int count = sqlSession.selectOne("mypageMapper.selectLikeBoardListCount", userNo);
		return count;
	}
	
	public ArrayList<Board> selectLikeBoardList(SqlSessionTemplate sqlSession, int userNo) {
		ArrayList<Board> list = (ArrayList)sqlSession.selectList("mypageMapper.selectLikeBoardList", userNo);
		return list;
	}
	
	
	
	
}
