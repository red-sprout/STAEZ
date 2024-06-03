package com.spring.staez.others.model.dao;

import java.util.ArrayList;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.spring.staez.admin.model.vo.Category;
import com.spring.staez.common.model.vo.PageInfo;
import com.spring.staez.community.model.vo.Board;
import com.spring.staez.community.model.vo.BoardLike;
import com.spring.staez.concert.model.vo.Concert;
import com.spring.staez.user.model.vo.ProfileImg;
import com.spring.staez.user.model.vo.Reserve;

@Repository
public class OthersDao {
	
	public ArrayList<Category> selectCategory(SqlSessionTemplate sqlSession) {
		return (ArrayList)sqlSession.selectList("othersMapper.selectCategory");
	}
	
	public ArrayList<Concert> selectCategoryLikeConcert(SqlSessionTemplate sqlSession, int cNo){
		return (ArrayList)sqlSession.selectList("othersMapper.selectCategoryLikeConcert", cNo);
	}
	
	public ArrayList<Concert> selectCategoryConcertImg(SqlSessionTemplate sqlSession, int cNo){
		return (ArrayList)sqlSession.selectList("othersMapper.selectCategoryConcertImg", cNo);
	}
	
	public ArrayList<Concert> selectLatestCategoryConcert(SqlSessionTemplate sqlSession, int cNo){
		return (ArrayList)sqlSession.selectList("othersMapper.selectLatestCategoryConcert", cNo);
	}
	
	public ArrayList<Concert> selectLatestCategoryConcertImg(SqlSessionTemplate sqlSession, int cNo){
		return (ArrayList)sqlSession.selectList("othersMapper.selectLatestCategoryConcertImg", cNo);
	}
	
	public ArrayList<Concert> selectDateCategoryConcert(SqlSessionTemplate sqlSession, Map data){
		return (ArrayList)sqlSession.selectList("othersMapper.selectDateCategoryConcert", data); 
	}
	
	public ArrayList<Concert> selectPageConcert(SqlSessionTemplate sqlSession, Map data, PageInfo pi){
		int offset = (pi.getCurrentPage()-1)* pi.getBoardLimit();
		int limit = pi.getBoardLimit();
		
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return (ArrayList)sqlSession.selectList("othersMapper.selectDateCategoryConcert", data, rowBounds);
	}
	
	public ArrayList<Reserve> selectReserveConcertList(SqlSessionTemplate sqlSession, int uNo){
		return (ArrayList)sqlSession.selectList("othersMapper.selectReserveConcert", uNo);
	}
	
	public ArrayList<Concert> selectChoiceReserveConcertList(SqlSessionTemplate sqlSession, Map data){
		return (ArrayList)sqlSession.selectList("othersMapper.selectChoiceReserveConcert", data);
	}
	
	public ArrayList<Board> selectPopularBoardList(SqlSessionTemplate sqlSession){
		return (ArrayList)sqlSession.selectList("othersMapper.selectPopularBoard");
	}
	
	public ArrayList<Board> selectPopularBoardCategory(SqlSessionTemplate sqlSession){
		return (ArrayList)sqlSession.selectList("othersMapper.selectPopularBoardCategory");
	}
	
	public ArrayList<ProfileImg> selectpopularBoardUserProfile(SqlSessionTemplate sqlSession){
		return (ArrayList)sqlSession.selectList("othersMapper.selectpopularBoardUserProfile");
	}
	
	public int checkLikeStatus(SqlSessionTemplate sqlSession, Map data) {
		Integer result = sqlSession.selectOne("othersMapper.checkLikeStatus", data);
		
		return result != null ? 1 : 0;
	}
	
	public int insertBoardLike(SqlSessionTemplate sqlSession, Map data) {
		return sqlSession.insert("othersMapper.insertBoardLike", data);
	}
	
	public int updateBoardLike(SqlSessionTemplate sqlSession, Map data) {
		return sqlSession.insert("othersMapper.updateBoardLike", data);
	}
	
	public ArrayList<BoardLike> selectLikeCount(SqlSessionTemplate sqlSession, Map data) {
		return (ArrayList)sqlSession.selectList("othersMapper.selectLikeCount", data);
	}
	
	public int updateNoLike(SqlSessionTemplate sqlSession, Map data) {
		return sqlSession.insert("othersMapper.updateNoLike", data);
	}
	
	public ArrayList<BoardLike> selectUserLikeBoardNo(SqlSessionTemplate sqlSession, int userNo){
		return (ArrayList)sqlSession.selectList("othersMapper.selectUserLikeBoardNo", userNo);
	}
	
	public ArrayList<Concert> selectKeywordConcert(SqlSessionTemplate sqlSession, String keyword) {
		return (ArrayList)sqlSession.selectList("othersMapper.selectKeywordConcert", keyword);
	}
	
	public ArrayList<Concert> selectKeywordConcertImg(SqlSessionTemplate sqlSession, String keyword){
		return (ArrayList)sqlSession.selectList("othersMapper.selectKeywordConcertImg", keyword);
	}
	
	public ArrayList<Board> selectKeywordBoard(SqlSessionTemplate sqlSession, String keyword){
		return (ArrayList)sqlSession.selectList("othersMapper.selectKeywordBoard", keyword);
	}
	
	public ArrayList<Board> selectkeywordCategoryList(SqlSessionTemplate sqlSession, int bNo){
		return (ArrayList)sqlSession.selectList("othersMapper.selectkeywordCategoryList", bNo);
	}
	
	public ArrayList<ProfileImg> selectKeywordUserProfilet(SqlSessionTemplate sqlSession, String keyword){
		return (ArrayList)sqlSession.selectList("othersMapper.selectKeywordUserProfilet", keyword);
	}

}
