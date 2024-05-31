package com.spring.staez.mypage.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.spring.staez.common.model.vo.PageInfo;
import com.spring.staez.community.model.dto.BoardListDto;
import com.spring.staez.concert.model.vo.Concert;
import com.spring.staez.user.model.vo.ProfileImg;
import com.spring.staez.user.model.vo.User;

@Repository
public class MypageDao {

	public int duplicateCheck(SqlSessionTemplate sqlSession, String nickname) {
		int result = sqlSession.selectOne("mypageMapper.duplicateCheck", nickname);
		return result;
	}
	
	public int passwordCheck(SqlSessionTemplate sqlSession, String inputPwd) {
		int result = sqlSession.selectOne("mypageMapper.passwordCheck", inputPwd);
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

	public ProfileImg loadProfileImg(SqlSessionTemplate sqlSession, int userNo) {
		return sqlSession.selectOne("mypageMapper.loadProfileImg", userNo);
	}
	
	public int insertProfileImg(SqlSessionTemplate sqlSession, ProfileImg profileImg) {
		int result = sqlSession.insert("mypageMapper.insertProfileImg", profileImg);
		return result;
	}

	public int updateProfileImg(SqlSessionTemplate sqlSession, ProfileImg profileImg) {
		System.out.println("repo: "+ profileImg);
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

	public ArrayList<BoardListDto> selectMyBoardList(SqlSessionTemplate sqlSession, int userNo, PageInfo pi) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		ArrayList<BoardListDto> list = (ArrayList)sqlSession.selectList("mypageMapper.selectMyBoardList", userNo);
		return list;
		
	}

	public int selectLikeBoardListCount(SqlSessionTemplate sqlSession, int userNo) {
		int count = sqlSession.selectOne("mypageMapper.selectLikeBoardListCount", userNo);
		return count;
	}
	
	public ArrayList<BoardListDto> selectLikeBoardList(SqlSessionTemplate sqlSession, int userNo, PageInfo pi) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		ArrayList<BoardListDto> list = (ArrayList)sqlSession.selectList("mypageMapper.selectLikeBoardList", userNo);
		return list;
	}
	
	
	public int selectPaymentsCount(SqlSessionTemplate sqlSession, int userNo) {
		int count = sqlSession.selectOne("mypageMapper.selectPaymentsCount", userNo);
		return count;
	}
	
	public ArrayList<Concert> selectPaymentsList(SqlSessionTemplate sqlSession, int userNo, PageInfo pi) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		ArrayList<Concert> list = (ArrayList)sqlSession.selectList("mypageMapper.selectPaymentsList", userNo);
		return list;
	}
	
	public int selectScrapCount(SqlSessionTemplate sqlSession, int userNo) {
		int count = sqlSession.selectOne("mypageMapper.selectScrapCount", userNo);
		return count;
	}
	
	public ArrayList<Concert> selectScrapList(SqlSessionTemplate sqlSession, int userNo, PageInfo pi) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		ArrayList<Concert> list = (ArrayList)sqlSession.selectList("mypageMapper.selectScrapList", userNo);
		return list;
	}

	public int selectReviewCount(SqlSessionTemplate sqlSession, int userNo) {
		int count = sqlSession.selectOne("mypageMapper.selectReviewCount", userNo);
		return count;
	}
	
	public ArrayList<Concert> selectReviewList(SqlSessionTemplate sqlSession, int userNo, PageInfo pi) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		ArrayList<Concert> list = (ArrayList)sqlSession.selectList("mypageMapper.selectReviewList", userNo, rowBounds);
		return list;
	}
	
	
}
