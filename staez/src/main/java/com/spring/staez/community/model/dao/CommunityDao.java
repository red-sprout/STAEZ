package com.spring.staez.community.model.dao;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.spring.staez.admin.model.vo.Category;
import com.spring.staez.community.model.dto.AjaxBoardDto;
import com.spring.staez.community.model.dto.CategoryDto;
import com.spring.staez.community.model.dto.CommunityDto;
import com.spring.staez.community.model.vo.Board;
import com.spring.staez.community.model.vo.BoardLike;
import com.spring.staez.community.model.vo.Reply;
import com.spring.staez.concert.model.vo.Concert;
import com.spring.staez.user.model.vo.ProfileImg;

@Repository
public class CommunityDao {

	public ArrayList<Category> selectCategory(SqlSessionTemplate sqlSession, Category c) {
		return (ArrayList)sqlSession.selectList("communityMapper.selectCategory", c);
	}

	public ArrayList<Concert> selectConcertList(SqlSessionTemplate sqlSession, String keyword) {
		return (ArrayList)sqlSession.selectList("communityMapper.selectConcertList", keyword);
	}

	public int insertBoard(SqlSessionTemplate sqlSession, CommunityDto communityDto) {
		return sqlSession.insert("communityMapper.insertBoard", communityDto);
	}

	public int insertCategory(SqlSessionTemplate sqlSession, List<Integer> categoryNoList) {
		int result = 1;
		for(int categoryNo : categoryNoList) {
			result *= sqlSession.insert("communityMapper.insertCategory", categoryNo);
		}
		return result;
	}

	public int insertTag(SqlSessionTemplate sqlSession, int concertNo) {
		return sqlSession.insert("communityMapper.insertTag", concertNo);
	}

	public ArrayList<Board> selectBoard(SqlSessionTemplate sqlSession, CategoryDto categoryDto) {
		return (ArrayList)sqlSession.selectList("communityMapper.selectBoard", categoryDto);
	}

	public ArrayList<Board> selectBoard(SqlSessionTemplate sqlSession) {
		return (ArrayList)sqlSession.selectList("communityMapper.selectBoardAll");
	}

	public ArrayList<Category> selectCategory(SqlSessionTemplate sqlSession, int boardNo) {
		return (ArrayList)sqlSession.selectList("communityMapper.selectBoardCategory", boardNo);
	}

	public Board boardDetail(SqlSessionTemplate sqlSession, int boardNo) {
		return sqlSession.selectOne("communityMapper.boardDetail", boardNo);
	}

	public String selectProfile(SqlSessionTemplate sqlSession, int userNo) {
		return sqlSession.selectOne("communityMapper.selectProfile", userNo);
	}

	public int selectUserBoardLike(SqlSessionTemplate sqlSession, AjaxBoardDto dto) {
		return sqlSession.selectOne("communityMapper.selectUserBoardLike", dto);
	}

	public int selectBoardLikeCnt(SqlSessionTemplate sqlSession, AjaxBoardDto dto) {
		return sqlSession.selectOne("communityMapper.selectBoardLikeCnt", dto);
	}

	public int selectReplyCnt(SqlSessionTemplate sqlSession, int boardNo) {
		return sqlSession.selectOne("communityMapper.selectReplyCnt", boardNo);
	}

}
