package com.spring.staez.community.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.google.gson.Gson;
import com.spring.staez.admin.model.vo.Category;
import com.spring.staez.common.model.vo.PageInfo;
import com.spring.staez.common.template.MyFileRenamePolicy;
import com.spring.staez.common.template.Pagination;
import com.spring.staez.community.model.dto.AjaxBoardDto;
import com.spring.staez.community.model.dto.AjaxReplyDto;
import com.spring.staez.community.model.dto.CategoryDto;
import com.spring.staez.community.model.dto.CommunityDto;
import com.spring.staez.community.model.dto.UpdateBoardDto;
import com.spring.staez.community.model.vo.Board;
import com.spring.staez.community.model.vo.BoardLike;
import com.spring.staez.community.model.vo.Reply;
import com.spring.staez.community.model.vo.ReplyLike;
import com.spring.staez.community.model.vo.Tag;
import com.spring.staez.community.service.CommunityService;
import com.spring.staez.concert.model.vo.Concert;

@Controller
public class CommunityController {
	
	private static final String BASIC_PROFILE = "/resources/uploadfiles/profile/basic_profile.jpg";
	
	@Autowired
	CommunityService communityService;
	
	@GetMapping("main.cm")
	public String communityMain() {		
		return "community/communityMain";
	}
	
	@GetMapping("detail.cm")
	public String communityDetail(int boardNo, Model model, HttpSession session) {
		int result = communityService.updateBoardCnt(boardNo);
		if(result > 0) {			
			Board board = communityService.boardDetail(boardNo);
			Tag tag = communityService.selectTag(boardNo);
			model.addAttribute("board", board);
			model.addAttribute("tag", tag);
			return "community/communityDetail";
		} else {
			session.setAttribute("alertMsg", "서버 에러입니다. 나중에 다시 접속하세요.");
			return "redirect:/main.cm";
		}
	}
	
	@GetMapping("insertForm.cm")
	public String communityInsertForm() {
		return "community/communityInsertForm";
	}
	
	@GetMapping("updateForm.cm")
	public String communityUpdateForm(UpdateBoardDto dto, Model model) {
		Board board = communityService.boardDetail(Integer.parseInt(dto.getBoardNo()));
		ArrayList<Category> categoryList = communityService.selectCategory(Integer.parseInt(dto.getBoardNo()));
		Concert concert = new Concert();
		try {
			concert = communityService.selectConcert(Integer.parseInt(dto.getConcertNo()));
		} catch (Exception e) {
			System.out.println("선택한 콘서트가 존재하지 않습니다.");
		}
		
		String genre, div;
		if(categoryList.get(0).getCategoryNo() > categoryList.get(1).getCategoryNo()) {
			genre = categoryList.get(0).getCategoryName();
			div = categoryList.get(1).getCategoryName();
		} else {
			genre = categoryList.get(1).getCategoryName();
			div = categoryList.get(0).getCategoryName();
		}
		
		model.addAttribute("board", board);
		model.addAttribute("genre", genre);
		model.addAttribute("division", div);
		model.addAttribute("concert", concert);
		
		return "community/communityUpdateForm";
	}
	
	// 게시글 불러오기(페이지네이션)
	@ResponseBody
	@GetMapping(value = "list.bo", produces = "application/json; charset-UTF-8")
	public String communityMainList(CategoryDto categoryDto, String cPage) {
		int listSize, listCount;
		int currentPage = Integer.parseInt(cPage);
		
		ArrayList<Board> list = null;
		PageInfo pi = null;
		
		if(categoryDto.getCategoryNo() != null) {			
			listSize = communityService.selectBoardCnt(categoryDto);
			listCount = listSize;
			pi = Pagination.getPageInfo(listCount, currentPage, 10, 10);
			list = communityService.selectBoard(categoryDto, pi);
		} else {
			listSize = communityService.selectBoardCnt(categoryDto.getKeyword());
			listCount = listSize;
			pi = Pagination.getPageInfo(listCount, currentPage, 10, 10);
			list = communityService.selectBoard(categoryDto.getKeyword(), pi);
		}

		Map<String, Object> map = new HashMap<>();
		map.put("pagination", pi);
		map.put("boardList", list);
		return new Gson().toJson(map);
	}
	
	// 카테고리 정보 불러오기
	@ResponseBody
	@GetMapping(value = "category.ct", produces = "application/json; charset-UTF-8")
	public String ajaxCategory(Category c) {
		ArrayList<Category> list = communityService.selectCategory(c);
		return new Gson().toJson(list);
	}
	
	// 게시글 카테고리 조회
	@ResponseBody
	@GetMapping(value = "boardCategory.cm", produces = "application/json; charset-UTF-8")
	public String boardCategory(int boardNo) {
		ArrayList<Category> list = communityService.selectCategory(boardNo);
		return new Gson().toJson(list);
	}
	
	// 공연 검색
	@ResponseBody
	@GetMapping(value = "searchConcertList.cm", produces = "application/json; charset-UTF-8")
	public String ajaxSearchTheaterList(String keyword) {
		ArrayList<Concert> list = communityService.selectConcertList(keyword);
		return new Gson().toJson(list);
	}
	
	// summernote 이미지 표기
	@ResponseBody
	@PostMapping(value = "communityImgUpload.cm", produces = "application/json; charset-UTF-8")
	public String concertImgUpload(List<MultipartFile> fileList, HttpSession session) {
		List<String> changeNameList = new ArrayList<String>();
		for(MultipartFile f : fileList) {
			String path = "/resources/uploadfiles/community/";
			String changeName = MyFileRenamePolicy.saveFile(f, session, path);
			changeNameList.add(path + changeName);
		}
		
		return new Gson().toJson(changeNameList);
	}
	
	// 게시글 입력
	@ResponseBody
	@PostMapping(value = "insert.cm")
	public String insertBoard(CommunityDto communityDto, HttpSession session) {
		int result = communityService.insertBoard(communityDto);
		if(result == 0) {
			session.setAttribute("alertMsg", "게시글 등록 실패");
		} else {
			session.setAttribute("alertMsg", "성공적으로 등록하였습니다.");
		}
		
		return "main.cm";
	}
	
	// 프로필 가져오기
	@ResponseBody
	@GetMapping(value = "select.pr")
	public String selectProfile(int userNo) {
		String profile = communityService.selectProfile(userNo);
		if(profile == null) {
			profile = BASIC_PROFILE;
		}
		return profile;
	}
	
	// 게시글 좋아요 가져오기
	@ResponseBody
	@GetMapping(value = "select.bl", produces = "application/json; charset-UTF-8")
	public String selectLike(AjaxBoardDto dto) {
		int boardLikeCnt = communityService.selectBoardLikeCnt(dto);
		int userBoardLikeCnt = communityService.selectUserBoardLike(dto);
		
		Map<String, Object> map = new HashMap<>();
		map.put("boardLikeCnt", boardLikeCnt);
		map.put("userBoardLike", userBoardLikeCnt > 0);
		
		return new Gson().toJson(map);
	}

	// 게시글 업데이트
	@ResponseBody
	@PostMapping(value = "update.cm")
	public String updateBoard(CommunityDto communityDto, HttpSession session) {
		int result = communityService.updateBoard(communityDto);
		if(result == 0) {
			session.setAttribute("alertMsg", "게시글 수정 실패");
		} else {
			session.setAttribute("alertMsg", "성공적으로 수정하였습니다.");
		}
		
		return "main.cm";
	}
	
	// 게시글 삭제
	@GetMapping("delete.cm")
	public String deleteBoard(int boardNo, HttpSession session) {
		int result = communityService.deleteBoard(boardNo);
		if(result == 0) {
			session.setAttribute("alertMsg", "게시글 삭제 실패");
		} else {
			session.setAttribute("alertMsg", "성공적으로 삭제하였습니다.");
		}
		
		return "community/communityMain";
	}
	
	// 좋아요 상태 변경
	@ResponseBody
	@GetMapping("update.bl")
	public String updateLike(BoardLike boardLike) {		
		AjaxBoardDto dto = new AjaxBoardDto();
		dto.setBoardNo(boardLike.getBoardNo());
		dto.setUserNo(boardLike.getUserNo());
		
		int result = communityService.selectUserBoardLikeAll(dto);
		if(result > 0) {
			result = communityService.updateBoardLike(boardLike);
		} else {
			result = communityService.insertBoardLike(boardLike);
		}
		
		int boardLikeCnt = communityService.selectBoardLikeCnt(dto);
		if(result > 0) {
			return String.valueOf(boardLikeCnt);
		} else {
			return "Exception 발생, 좋아요 실패";
		}
	}
	
	// 댓글 갯수 가져오기
	@ResponseBody
	@GetMapping(value = "select.ry", produces = "application/json; charset-UTF-8")
	public String selectReply(int boardNo) {
		int replyCnt = communityService.selectReplyCnt(boardNo);
		return String.valueOf(replyCnt);
	}
	
	// 댓글 select
	@ResponseBody
	@GetMapping(value = "selectAll.ry", produces = "application/json; charset-UTF-8")
	public String selectReplyAll(int boardNo) {
		ArrayList<Reply> list = communityService.selectReplyAll(boardNo);
		return new Gson().toJson(list);
	}
	
	@PostMapping("insert.rp")
	public String insertReport(Board report, HttpSession session) {
		int result = communityService.insertReport(report);
		if(result == 0) {
			session.setAttribute("alertMsg", "게시글 신고 실패");
		} else {
			session.setAttribute("alertMsg", "신고 완료하였습니다.");
		}
		
		return "redirect:/main.cm";
	}
	
	// 댓글 & 대댓글
	@ResponseBody
	@PostMapping(value = "insert.ry", produces = "application/json; charset-UTF-8")
	public String insertReply(Reply r) {
		int result = communityService.insertReply(r);
		return selectReplyAll(r.getBoardNo());
	}
	
	@ResponseBody
	@PostMapping(value = "update.ry", produces = "application/json; charset-UTF-8")
	public String updateReply(Reply r) {
		int result = communityService.updateReply(r);
		return selectReplyAll(r.getBoardNo());
	}
	
	@ResponseBody
	@PostMapping(value = "delete.ry", produces = "application/json; charset-UTF-8")
	public String deleteReply(int boardNo, int replyNo) {
		int result = communityService.deleteReply(replyNo);
		return selectReplyAll(boardNo);
	}
	
	@ResponseBody
	@GetMapping(value = "selectReplyLike.ry", produces = "application/json; charset=UTF-8")
	public String selectReplyLike(AjaxReplyDto dto) {
		int replyLikeCnt = communityService.selectReplyLikeCnt(dto);
		int userReplyLikeCnt = communityService.selectUserReplyLike(dto);
		
		Map<String, Object> map = new HashMap<>();
		map.put("ReplyLikeCnt", replyLikeCnt);
		map.put("userReplyLike", userReplyLikeCnt > 0);
		
		return new Gson().toJson(map);
	}
	
	// 좋아요 상태 변경
	@ResponseBody
	@GetMapping("updateReplyLike.ry")
	public String updateReplyLike(ReplyLike replyLike) {		
		AjaxReplyDto dto = new AjaxReplyDto();
		dto.setReplyNo(replyLike.getReplyNo());
		dto.setUserNo(replyLike.getUserNo());
		
		int result = communityService.selectUserReplyLikeAll(dto);
		if(result > 0) {
			result = communityService.updateReplyLike(replyLike);
		} else {
			result = communityService.insertReplyLike(replyLike);
		}
		
		int replyLikeCnt = communityService.selectReplyLikeCnt(dto);
		if(result > 0) {
			return String.valueOf(replyLikeCnt);
		} else {
			return "Exception 발생, 좋아요 실패";
		}
	}
	
	@ResponseBody
	@GetMapping(value = "selectConcertId.cm", produces = "text/plain; charset=utf-8")
	public String selectConcertId(@RequestParam("concertNo") int concertNo) {
		return communityService.selectConcertId(concertNo);
	}
}
