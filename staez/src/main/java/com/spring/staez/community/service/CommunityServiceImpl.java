package com.spring.staez.community.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.spring.staez.admin.model.vo.Category;
import com.spring.staez.community.model.dao.CommunityDao;
import com.spring.staez.community.model.dto.AjaxBoardDto;
import com.spring.staez.community.model.dto.CategoryDto;
import com.spring.staez.community.model.dto.CommunityDto;
import com.spring.staez.community.model.vo.Board;
import com.spring.staez.community.model.vo.BoardLike;
import com.spring.staez.community.model.vo.Reply;
import com.spring.staez.community.model.vo.Tag;
import com.spring.staez.concert.model.vo.Concert;
import com.spring.staez.user.model.vo.ProfileImg;

@Service
public class CommunityServiceImpl implements CommunityService {

	@Autowired
	SqlSessionTemplate sqlSession;
	
	@Autowired
	CommunityDao communityDao;
	
	@Transactional(readOnly = true)
	@Override
	public ArrayList<Category> selectCategory(Category c) {
		return communityDao.selectCategory(sqlSession, c);
	}

	@Transactional(readOnly = true)
	@Override
	public ArrayList<Concert> selectConcertList(String keyword) {
		return communityDao.selectConcertList(sqlSession, keyword);
	}

	@Transactional(rollbackFor = {Exception.class})
	@Override
	public int insertBoard(CommunityDto communityDto) {
		int insertBoardResult = communityDao.insertBoard(sqlSession, communityDto);
		int insertCategoryResult = communityDao.insertCategory(sqlSession, communityDto.getCategoryNo());
		int insertTagResult = 1;
		
		if(communityDto.getConcertNo() > 0) {
			insertTagResult = communityDao.insertTag(sqlSession, communityDto.getConcertNo());
		}
		
		return insertBoardResult * insertCategoryResult * insertTagResult;
	}

	@Transactional(readOnly = true)
	@Override
	public ArrayList<Board> selectBoard(CategoryDto categoryDto) {
		return communityDao.selectBoard(sqlSession, categoryDto);
	}

	@Transactional(readOnly = true)
	@Override
	public ArrayList<Board> selectBoard() {
		return communityDao.selectBoard(sqlSession);
	}

	@Transactional(readOnly = true)
	@Override
	public ArrayList<Category> selectCategory(int boardNo) {
		return communityDao.selectCategory(sqlSession, boardNo);
	}

	@Transactional(readOnly = true)
	@Override
	public Board boardDetail(int boardNo) {
		return communityDao.boardDetail(sqlSession, boardNo);
	}

	@Transactional(rollbackFor = {Exception.class})
	@Override
	public String selectProfile(int userNo) {
		return communityDao.selectProfile(sqlSession, userNo);
	}

	@Transactional(readOnly = true)
	@Override
	public int selectUserBoardLike(AjaxBoardDto dto) {
		return communityDao.selectUserBoardLike(sqlSession, dto);
	}

	@Transactional(readOnly = true)
	@Override
	public int selectBoardLikeCnt(AjaxBoardDto dto) {
		return communityDao.selectBoardLikeCnt(sqlSession, dto);
	}

	@Transactional(readOnly = true)
	@Override
	public int selectReplyCnt(int boardNo) {
		return communityDao.selectReplyCnt(sqlSession, boardNo);
	}

	@Transactional(readOnly = true)
	@Override
	public Concert selectConcert(int concertNo) {
		return communityDao.selectConcert(sqlSession, concertNo);
	}

	@Transactional(rollbackFor = {Exception.class})
	@Override
	public int updateBoard(CommunityDto communityDto) {
		int updateBoardResult = communityDao.updateBoard(sqlSession, communityDto);
		int updateCategoryResult = 1;
		updateCategoryResult *= communityDao.deleteCategory(sqlSession, communityDto.getBoardNo());
		updateCategoryResult *= communityDao.insertCategory(sqlSession, communityDto);
		
		int updateTagResult = 1;
		if(communityDto.getConcertNo() > 0) {
			updateTagResult = communityDao.updateTag(sqlSession, communityDto);
		}
		
		int result = updateBoardResult * updateCategoryResult * updateTagResult;
		return result;
	}

	@Transactional(rollbackFor = {Exception.class})
	@Override
	public int deleteBoard(int boardNo) {
		return communityDao.deleteBoard(sqlSession, boardNo);
	}

	@Transactional(readOnly = true)
	@Override
	public Tag selectTag(int boardNo) {
		return communityDao.selectTag(sqlSession, boardNo);
	}

	@Transactional(readOnly = true)
	@Override
	public int selectUserBoardLikeAll(AjaxBoardDto dto) {
		return communityDao.selectUserBoardLikeAll(sqlSession, dto);
	}

	@Transactional(rollbackFor = {Exception.class})
	@Override
	public int updateBoardLike(BoardLike boardLike) {
		return communityDao.updateBoardLike(sqlSession, boardLike);
	}

	@Transactional(rollbackFor = {Exception.class})
	@Override
	public int insertBoardLike(BoardLike boardLike) {
		return communityDao.insertBoardLike(sqlSession, boardLike);
	}

	@Transactional(readOnly = true)
	@Override
	public ArrayList<Reply> selectReply(int boardNo) {
		return communityDao.selectReply(sqlSession, boardNo);
	}
}
