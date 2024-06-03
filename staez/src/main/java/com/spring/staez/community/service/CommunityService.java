package com.spring.staez.community.service;

import java.util.ArrayList;

import com.spring.staez.admin.model.vo.Category;
import com.spring.staez.common.model.vo.PageInfo;
import com.spring.staez.community.model.dto.AjaxBoardDto;
import com.spring.staez.community.model.dto.CategoryDto;
import com.spring.staez.community.model.dto.CommunityDto;
import com.spring.staez.community.model.vo.Board;
import com.spring.staez.community.model.vo.BoardLike;
import com.spring.staez.community.model.vo.Reply;
import com.spring.staez.community.model.vo.Tag;
import com.spring.staez.concert.model.vo.Concert;

public interface CommunityService {

	ArrayList<Category> selectCategory(Category c);

	ArrayList<Concert> selectConcertList(String keyword);

	int insertBoard(CommunityDto communityDto);

	ArrayList<Board> selectBoard(CategoryDto categoryDto, PageInfo pi);

	ArrayList<Board> selectBoard(PageInfo pi);

	ArrayList<Category> selectCategory(int boardNo);

	Board boardDetail(int boardNo);

	String selectProfile(int userNo);

	int selectUserBoardLike(AjaxBoardDto dto);

	int selectBoardLikeCnt(AjaxBoardDto dto);

	int selectReplyCnt(int boardNo);

	Concert selectConcert(int concertNo);

	int updateBoard(CommunityDto communityDto);

	int deleteBoard(int boardNo);

	Tag selectTag(int boardNo);

	int selectUserBoardLikeAll(AjaxBoardDto dto);

	int updateBoardLike(BoardLike boardLike);

	int insertBoardLike(BoardLike boardLike);

	ArrayList<Reply> selectReplyAll(int boardNo);

	int selectBoardCnt(CategoryDto categoryDto);

	int selectBoardCnt();

}
