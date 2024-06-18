package com.spring.staez.community.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.spring.staez.admin.model.vo.Category;
import com.spring.staez.common.model.vo.PageInfo;
import com.spring.staez.community.model.dao.CommunityDao;
import com.spring.staez.community.model.dto.AjaxBoardDto;
import com.spring.staez.community.model.dto.AjaxReplyDto;
import com.spring.staez.community.model.dto.CategoryDto;
import com.spring.staez.community.model.dto.CommunityDto;
import com.spring.staez.community.model.vo.Board;
import com.spring.staez.community.model.vo.BoardLike;
import com.spring.staez.community.model.vo.Reply;
import com.spring.staez.community.model.vo.ReplyLike;
import com.spring.staez.community.model.vo.Tag;
import com.spring.staez.concert.model.vo.Concert;

@Service
public class CommunityServiceImpl implements CommunityService {
	
	private static final String BASIC_PROFILE = "/resources/uploadfiles/profile/basic_profile.jpg";

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
	public ArrayList<Board> selectBoard(CategoryDto categoryDto, PageInfo pi) {
		return communityDao.selectBoard(sqlSession, categoryDto, pi);
	}

	@Transactional(readOnly = true)
	@Override
	public ArrayList<Board> selectBoard(String keyword, PageInfo pi) {
		return communityDao.selectBoard(sqlSession, keyword, pi);
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
	public ArrayList<Reply> selectReplyAll(int boardNo) {
		ArrayList<Reply> list = communityDao.selectReplyAll(sqlSession, boardNo);
		for(Reply r : list) {
			if(r.getPath() == null) 
				r.setPath(BASIC_PROFILE);
		}
		return list;
	}

	@Transactional(readOnly = true)
	@Override
	public int selectBoardCnt(CategoryDto categoryDto) {
		return communityDao.selectBoardCnt(sqlSession, categoryDto);
	}

	@Transactional(readOnly = true)
	@Override
	public int selectBoardCnt(String keyword) {
		return communityDao.selectBoardCnt(sqlSession, keyword);
	}

	@Transactional(rollbackFor = {Exception.class})
	@Override
	public int insertReport(Board report) {
		return communityDao.insertReport(sqlSession, report);
	}

	@Transactional(rollbackFor = {Exception.class})
	@Override
	public int updateBoardCnt(int boardNo) {
		return communityDao.updateBoardCnt(sqlSession, boardNo);
	}

	@Transactional(rollbackFor = {Exception.class})
	@Override
	public int insertReply(Reply r) {
		return communityDao.insertReply(sqlSession, r);
	}

	@Transactional(rollbackFor = {Exception.class})
	@Override
	public int updateReply(Reply r) {
		return communityDao.updateReply(sqlSession, r);
	}

	@Transactional(rollbackFor = {Exception.class})
	@Override
	public int deleteReply(int replyNo) {
		return communityDao.deleteReply(sqlSession, replyNo);
	}

	@Transactional(readOnly = true)
	@Override
	public int selectUserReplyLike(AjaxReplyDto dto) {
		return communityDao.selectUserReplyLike(sqlSession, dto);
	}

	@Transactional(readOnly = true)
	@Override
	public int selectUserReplyLikeAll(AjaxReplyDto dto) {
		return communityDao.selectUserReplyLikeAll(sqlSession, dto);
	}

	@Transactional(readOnly = true)
	@Override
	public int selectReplyLikeCnt(AjaxReplyDto dto) {
		return communityDao.selectReplyLikeCnt(sqlSession, dto);
	}

	@Transactional(readOnly = true)
	@Override
	public int selectReplyLike(int replyNo) {
		return communityDao.selectReplyLike(sqlSession, replyNo);
	}

	@Transactional(rollbackFor = {Exception.class})
	@Override
	public int updateReplyLike(ReplyLike replyLike) {
		return communityDao.updateReplyLike(sqlSession, replyLike);
	}

	@Transactional(rollbackFor = {Exception.class})
	@Override
	public int insertReplyLike(ReplyLike replyLike) {
		return communityDao.insertReplyLike(sqlSession, replyLike);
	}
	
	@Transactional(readOnly = true)
	@Override
	public String selectConcertId(int concertNo) {
		return communityDao.selectConcertId(sqlSession, concertNo);
	}
}
