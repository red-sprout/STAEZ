package com.spring.staez.others.service;

import java.util.ArrayList;

import com.spring.staez.admin.model.vo.Category;
import com.spring.staez.common.model.vo.PageInfo;
import com.spring.staez.community.model.vo.Board;
import com.spring.staez.community.model.vo.BoardLike;
import com.spring.staez.concert.model.vo.Concert;
import com.spring.staez.user.model.vo.ProfileImg;
import com.spring.staez.user.model.vo.Reserve;

public interface OthersService {
	
	ArrayList<Category> selectCategory();
	
	ArrayList<Concert> selectCategoryConcert(int cNo);
	
	ArrayList<Concert> selectCategoryConcertImg(int cNo);
	
	ArrayList<Concert> selectLatestCategoryConcert(int cNo);
	
	ArrayList<Concert> selectLatestCategoryConcertImg(int cNo);
	
	ArrayList<Concert> selectDateCategoryConcert(String categoryNo, String concertDate);
	
	ArrayList<Concert> selectPageConcert(String categoryNo, String concertDate, PageInfo pi);
	
	ArrayList<Reserve> selectReserveConcertList(int uNo);
	
	ArrayList<Concert> selectChoiceReserveConcertList(String userNo, String date);

	ArrayList<Board> selectPopularBoardList();
	
	ArrayList<Board> selectPopularBoardCategory();
	
	ArrayList<ProfileImg> selectpopularBoardUserProfile();
	
	ArrayList<BoardLike> insertUpdatelike(int userNo, int boardNo);
	
	ArrayList<BoardLike> updateNoLike(int userNo, int boardNo);
	
	ArrayList<BoardLike> selectUserLikeBoardNo(int userNo);
	
	ArrayList<Concert> selectKeywordConcert(String keyword);
	
	ArrayList<Concert> selectKeywordConcertImg(String keyword);
	
	ArrayList<Board> selectKeywordBoardList(String keyword);
	
	ArrayList<Board> selectkeywordCategoryList(int bNo);
	
	ArrayList<ProfileImg> selectKeywordUserProfilet(String keyword);
}
