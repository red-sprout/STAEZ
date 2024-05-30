package com.spring.staez.others.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.staez.admin.model.vo.Category;
import com.spring.staez.common.model.vo.PageInfo;
import com.spring.staez.community.model.vo.Board;
import com.spring.staez.community.model.vo.BoardLike;
import com.spring.staez.concert.model.vo.Concert;
import com.spring.staez.others.model.dao.OthersDao;
import com.spring.staez.user.model.vo.ProfileImg;
import com.spring.staez.user.model.vo.Reserve;

@Service
public class OthersServiceImpl implements OthersService{
	@Autowired
	SqlSessionTemplate sqlSession;
	
	@Autowired
	OthersDao oDao;

	@Override
	public ArrayList<Category> selectCategory() {
		return oDao.selectCategory(sqlSession);		
	}

	@Override
	public ArrayList<Concert> selectCategoryConcert(int cNo) {
		return oDao.selectCategoryLikeConcert(sqlSession, cNo);
	}

	@Override
	public ArrayList<Concert> selectCategoryConcertImg(int cNo) {
		return oDao.selectCategoryConcertImg(sqlSession, cNo);
	}

	@Override
	public ArrayList<Concert> selectLatestCategoryConcert(int cNo) {
		return oDao.selectLatestCategoryConcert(sqlSession, cNo);
	}

	@Override
	public ArrayList<Concert> selectLatestCategoryConcertImg(int cNo) {
		return oDao.selectLatestCategoryConcertImg(sqlSession, cNo);
	}

	@Override
	public ArrayList<Concert> selectDateCategoryConcert(String categoryNo, String concertDate) {
		int cNo = Integer.parseInt(categoryNo);
		Map data = new HashMap();
		data.put("cNo", cNo);
		data.put("date", concertDate);

		ArrayList<Concert> dcList = oDao.selectDateCategoryConcert(sqlSession, data);
		
		return dcList;
	}

	@Override
	public ArrayList<Concert> selectPageConcert(String categoryNo, String concertDate, PageInfo pi) {
		int cNo = Integer.parseInt(categoryNo);
		Map data = new HashMap();
		data.put("cNo", cNo);
		data.put("date", concertDate);
		
		ArrayList<Concert> dcList = oDao.selectPageConcert(sqlSession, data, pi);
		
		return dcList;
	}

	@Override
	public ArrayList<Reserve> selectReserveConcertList(int uNo) {
		return oDao.selectReserveConcertList(sqlSession, uNo);
	}

	@Override
	public ArrayList<Concert> selectChoiceReserveConcertList(String userNo, String date) {
		int uNo = Integer.parseInt(userNo);
		Map data = new HashMap();
		data.put("uNo", uNo);
		data.put("date", date);
		return oDao.selectChoiceReserveConcertList(sqlSession, data);
	}

	@Override
	public ArrayList<Board> selectPopularBoardList() {
		return oDao.selectPopularBoardList(sqlSession);
	}

	@Override
	public ArrayList<Board> selectPopularBoardCategory() {
		
		return oDao.selectPopularBoardCategory(sqlSession);
	}

	@Override
	public ArrayList<ProfileImg> selectpopularBoardUserProfile() {
		return oDao.selectpopularBoardUserProfile(sqlSession);
	}

	@Override
	public ArrayList<BoardLike> insertUpdatelike(int userNo, int boardNo) {
		Map data = new HashMap();
		data.put("uNo", userNo);
		data.put("bNo", boardNo);
		ArrayList<BoardLike> like = null; 
		int result1 = oDao.checkLikeStatus(sqlSession, data);
		
		if(result1 < 1) { //insert문
			int result2 = oDao.insertBoardLike(sqlSession, data);
			
			if(result2 < 1) { //insert가 실패라면 null반환
				return like;
			} else { //insert가 성공이라면 해당 게시물 좋아요개수 조회 후 반환
				return oDao.selectLikeCount(sqlSession, data);				
			}
		} else {//update문
			int result3 = oDao.updateBoardLike(sqlSession, data);
			
			if(result3 < 1) { //update가 실패라면 null반환
				return like;
			} else { //update가 성공이라면 해당 게시물 좋아요개수 조회 후 반환
				return oDao.selectLikeCount(sqlSession, data);				
			}
		}
	}

	@Override
	public ArrayList<BoardLike> updateNoLike(int userNo, int boardNo) {
		Map data = new HashMap();
		data.put("uNo", userNo);
		data.put("bNo", boardNo);
		ArrayList<BoardLike> like = null; 
		
		int result = oDao.updateNoLike(sqlSession, data);
		
		if(result < 1) {
			return like;
		} else {
			return oDao.selectLikeCount(sqlSession, data);	
		}
	}

	@Override
	public ArrayList<BoardLike> selectUserLikeBoardNo(int userNo) {
		return oDao.selectUserLikeBoardNo(sqlSession, userNo);
	}
	
	
}
