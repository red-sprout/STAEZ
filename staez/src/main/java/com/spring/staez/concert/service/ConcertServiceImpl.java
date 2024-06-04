package com.spring.staez.concert.service;

import java.util.ArrayList;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.spring.staez.admin.model.vo.Category;
import com.spring.staez.community.model.vo.Board;
import com.spring.staez.concert.model.dao.ConcertDao;
import com.spring.staez.concert.model.vo.Concert;
import com.spring.staez.concert.model.vo.ConcertLike;
import com.spring.staez.concert.model.vo.ConcertReview;

@Service
public class ConcertServiceImpl implements ConcertService {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	private ConcertDao concertDao;

	
	@Override
	public Category selectCate(int categoryNo) {
		return concertDao.selectCate(sqlSession, categoryNo);
	}
	
	@Override
	public ArrayList<Category> selectCateCon() {
		return concertDao.selectCateCon(sqlSession);
	}

	@Override
	public ArrayList<Concert> selectconList(int categoryNo) {
		return concertDao.selectconList(sqlSession, categoryNo);
	}

	@Override
	public Concert selectCon(int concertNo) {
		return concertDao.selectCon(sqlSession, concertNo);
	}

	@Override
	public ArrayList<Concert> selectConDetail(int concertNo) {
		return concertDao.selectConDetail(sqlSession, concertNo);
	}

	@Override
	public ArrayList<ConcertReview> selectComDetail(int concertNo) {
		return concertDao.selectComDetail(sqlSession, concertNo);
	}

	@Override
	public ArrayList<Board> selectRevDetail(int concertNo) {
		return concertDao.selectRevDetail(sqlSession, concertNo);
	}

	@Override
	public int selectConLikeCount(int concertNo) {
		return concertDao.selectConLikeCount(sqlSession, concertNo);
	}

	@Override
	public int selectUserConLike(Map map) {
		return concertDao.selectUserConLike(sqlSession, map);
	}

	@Override
	public int selectUserConLikeAll(Map map) {
		return concertDao.selectUserConLikeAll(sqlSession, map);
	}
	
	@Transactional(rollbackFor = {Exception.class})
	@Override
	public int updateConLike(ConcertLike like) {
		return concertDao.updateConLike(sqlSession, like);
	}

	@Transactional(rollbackFor = {Exception.class})
	@Override
	public int insertConLike(ConcertLike like) {
		return concertDao.insertConLike(sqlSession, like);
	}

	
	
//	// 그 공연의 총 좋아요 갯수
//	@Override
//	public ArrayList<ConcertLike> checkLikeExist(int concertNo) {
//		return concertDao.checkLikeExist(sqlSession, concertNo);
//	}
//
//
//	
//	@Override
//	public ArrayList<ConcertLike> insertLike(int userNo, int concertNo) {
//		Map insertLikeMap = new HashMap();
//		insertLikeMap.put("userNo", userNo);
//		insertLikeMap.put("concertNo", concertNo);
//		
//		
//		ArrayList<ConcertLike> noResult = null;
//		
//		// 유저가 좋아요한 적 있냐?
//		int checkDidLike = concertDao.checkDidLike(sqlSession, insertLikeMap);
//		
//		// 유저가 좋아요한 결과가 없으면: 새로 insert
//		if(checkDidLike < 1) {
//			int insertLike = concertDao.insertLike(sqlSession, insertLikeMap);
//			
//			if(insertLike < 1) { // insert 실패하면 null값 반환
//				return noResult;
//			} else { // insert 성공하면  좋아요 갯수 반환
//				
//				return concertDao.selectLikeCount(sqlSession, insertLikeMap);
//			}
//			
//		// 유저가 좋아요한 결과가 있으면: 있는 db update -> status Y 혹은 N
//		} else {
//			int updateYtoN = concertDao.updateYtoN(sqlSession, insertLikeMap);
//			
//			// update 한 결과가 실패면 null 값 반환
//			if(updateYtoN < 1) {
//				return noResult;
//			} else { // update 한 결과가 성공이면 콘서트의 좋아요 갯수 반환
//				return concertDao.selectLikeCount(sqlSession, insertLikeMap);
//						// concertDao.selectLikeCount(sqlSession, insertLikeMap);
//			}
//		}
//
//	}



	
//	@Transactional
//	@Override
//	public int insertConLike(ConcertLike conL) {  
//		
//		int cl = new ConcertServiceImpl().checkConLike(conL);
//		// 사용자가 찜한 적 없는 콘서트이면 찜: insert 가져와서
//		
//		if(cl == 0) { 
//			
//			int result = concertDao.insertConLike(sqlSession, conL);			
//						
//		} else { // 사용자가 찜한 적 있는 콘서트이고 status Y -> status N : update
//				 // 사용자가 찜한 적 있는 콘서트이고 status N -> status Y
//			if(conL.getStatus().equals("Y")) {
//				int updateLikeYtoN = concertDao.updateLikeYtoN(sqlSession, conL);
//			}else {
//				int updateLikeNtoY = concertDao.updateLikeNtoY(sqlSession, conL);
//			}
//		}
//		return concertDao.insertConLike(sqlSession, conL);
//	}
//
//
//	@Transactional
//    @Override
//    public int updateLikeYtoN(ConcertLike conL) {
//        return concertDao.updateLikeYtoN(sqlSession, conL);
//    }
//
//	@Transactional
//    @Override
//    public int updateLikeNtoY(ConcertLike conL) {
//        return concertDao.updateLikeNtoY(sqlSession, conL);
//    }





	

	



}
