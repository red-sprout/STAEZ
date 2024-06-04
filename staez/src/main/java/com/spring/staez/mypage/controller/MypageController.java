package com.spring.staez.mypage.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.google.gson.Gson;
import com.spring.staez.common.model.vo.PageInfo;
import com.spring.staez.common.template.MyFileRenamePolicy;
import com.spring.staez.common.template.Pagination;
import com.spring.staez.community.model.dto.BoardListDto;
import com.spring.staez.community.model.vo.Board;
import com.spring.staez.concert.model.vo.Concert;
import com.spring.staez.concert.model.vo.ConcertReview;
import com.spring.staez.mypage.service.MypageService;
import com.spring.staez.user.model.dto.PaymentsInfoDto;
import com.spring.staez.user.model.vo.ProfileImg;
import com.spring.staez.user.model.vo.User;
import com.spring.staez.user.service.UserService;

@Controller
public class MypageController {

	@Autowired
	private UserService userService;
	
	@Autowired
	private MypageService mypageService;
	
	@Autowired
	private BCryptPasswordEncoder bcryptPasswordEncoder;
	

	//마이페이지 메인 출력
	@RequestMapping("main.me")
	public String loadToMypageMain(HttpSession session, Model model) {
		if(session.getAttribute("loginUser") == null) { //로그인 되어있지 않을 경우
	        session.setAttribute("alertMsg", "로그인이 필요합니다.");
	        return "redirect:/loginForm.me";
		}
		
		model.addAttribute("contentPage", "mypageMain");
		return "mypage/mypageLayout";
	}
	
	//결제내역 리스트 페이지 출력
	@RequestMapping("paymentList.me")
	public String paymentsLog(int cpage, HttpSession session, Model model) {
		User loginUser = userService.loginUser((User)session.getAttribute("loginUser"));
		
		if(session.getAttribute("loginUser") == null) { //로그인 되어있지 않을 경우
	        session.setAttribute("alertMsg", "로그인이 필요합니다.");
	        return "redirect:/loginForm.me";
		}
		
		int userNo = loginUser.getUserNo();
		int currentPage = cpage;
		int listCount = mypageService.selectPaymentsCount(userNo);
		
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 10, 5);
		ArrayList<PaymentsInfoDto> list = mypageService.selectPaymentsList(userNo, pi);
		
		model.addAttribute("contentPage", "paymentsLog");
		model.addAttribute("clist", list);
		model.addAttribute("pi", pi);
		return "mypage/mypageLayout";
	}
	
	//찜목록 리스트 페이지 출력
	@RequestMapping("scrapList.me")
	public String myScrapList(int cpage, HttpSession session, Model model) {
		User loginUser = userService.loginUser((User)session.getAttribute("loginUser"));
		
		if(session.getAttribute("loginUser") == null) { //로그인 되어있지 않을 경우
	        session.setAttribute("alertMsg", "로그인이 필요합니다.");
	        return "redirect:/loginForm.me";
		}
		
		int userNo = loginUser.getUserNo();
		int currentPage = cpage;
		int listCount = mypageService.selectScrapCount(userNo);
		
		System.out.println("listCount:" + listCount);
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 10, 5);
		ArrayList<Concert> list = mypageService.selectScrapList(userNo, pi);
		
		model.addAttribute("contentPage", "myScrapList");
		model.addAttribute("clist", list);
		model.addAttribute("pi", pi);
		return "mypage/mypageLayout";
	}

	//한줄평 리스트 페이지 출력
	@RequestMapping("reviewList.me")
	public String oneLineReview(int cpage, HttpSession session, Model model) {
		User loginUser = userService.loginUser((User)session.getAttribute("loginUser"));
		
		if(session.getAttribute("loginUser") == null) { //로그인 되어있지 않을 경우
	        session.setAttribute("alertMsg", "로그인이 필요합니다.");
	        return "redirect:/loginForm.me";
		}
		
		int userNo = loginUser.getUserNo();
		int currentPage = cpage;
		int listCount = mypageService.selectReviewCount(userNo);

		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 10, 5);
		ArrayList<Concert> list = mypageService.selectReviewList(userNo, pi);
		
		model.addAttribute("contentPage", "oneLineReview");
		model.addAttribute("clist", list);
		model.addAttribute("pi", pi);
		return "mypage/mypageLayout";
	}
	
	//나의 문의내역 리스트 페이지 출력
	@RequestMapping("inquireList.me")
	public String myInquireList(int cpage, HttpSession session, Model model) {
		User loginUser = userService.loginUser((User)session.getAttribute("loginUser"));

		if(session.getAttribute("loginUser") == null) { //로그인 되어있지 않을 경우
	        session.setAttribute("alertMsg", "로그인이 필요합니다.");
	        return "redirect:/loginForm.me";
		}
		
		int userNo = loginUser.getUserNo();
		int currentPage = cpage;
		int listCount = mypageService.selectMyInquireCount(userNo);
		
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 10, 8);
		ArrayList<Board> list = mypageService.selectMyInquireList(userNo, pi);
		
		model.addAttribute("contentPage", "myInquireList");
		model.addAttribute("blist", list);
		model.addAttribute("pi", pi);
		return "mypage/mypageLayout";
	}
	
	//문의 내역 답변 불러오기 ajax
	@RequestMapping("loadAnswer.me")
	@ResponseBody
	public String loadAnswerAjax(Integer boardNo) {
		System.out.println(boardNo);
		String inquireAnswer = mypageService.loadAnswerAjax(boardNo);
		
		return inquireAnswer;
	}
	
	//나의 작성 게시글 리스트 페이지 출력
	@RequestMapping("boardList.me")
	public String myBoardList(int cpage, HttpSession session, Model model) {
		User loginUser = userService.loginUser((User)session.getAttribute("loginUser"));
		if(loginUser == null) { //로그인 되어있지 않을 경우
	        session.setAttribute("alertMsg", "로그인이 필요합니다.");
	        return "redirect:/loginForm.me";
		}
		
		int userNo = loginUser.getUserNo();
		int currentPage = cpage;
		int listCount = mypageService.selectMyBoardListCount(userNo);
		
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 10, 10);
		ArrayList<BoardListDto> list = mypageService.selectMyBoardList(userNo, pi);
		model.addAttribute("contentPage", "myBoardList");
		model.addAttribute("blist", list);
		model.addAttribute("pi", pi);
		
		return "mypage/mypageLayout";
	}
	
	//나의 좋아요 게시글 리스트 페이지 출력
	@RequestMapping("likeList.me")
	public String likeBoardList(int cpage, HttpSession session, Model model) {
		User loginUser = userService.loginUser((User)session.getAttribute("loginUser"));
		if(loginUser == null) { //로그인 되어있지 않을 경우
	        session.setAttribute("alertMsg", "로그인이 필요합니다.");
	        return "redirect:/loginForm.me";
		}
		
		int userNo = loginUser.getUserNo();
		int currentPage = cpage;
		int listCount = mypageService.selectLikeBoardListCount(userNo);
		
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 10, 10);
		ArrayList<BoardListDto> list = mypageService.selectLikeBoardList(userNo, pi);
		
		model.addAttribute("contentPage", "likeBoardList");
		model.addAttribute("blist", list);
		model.addAttribute("pi", pi);
		
		return "mypage/mypageLayout";
	}
	
	//회원정보 변경 페이지 출력
	@RequestMapping("updateForm.me")
	public String updateUserForm(HttpSession session, Model model) {
		if(session.getAttribute("loginUser") == null) { //로그인 되어있지 않을 경우
	        session.setAttribute("alertMsg", "로그인이 필요합니다.");
	        return "redirect:/loginForm.me";
		}
		model.addAttribute("contentPage", "updateUserForm");
		return "mypage/mypageLayout";
	}
	
	//중복 체크
	@RequestMapping("dupliCheck.me")
	@ResponseBody
	public String duplicateCheck(String nickname) {
		int result = mypageService.duplicateCheck(nickname);
		return result > 0 ? "NNNNN" : "NNNNY"; 
	}
	
	//비밀번호 인증(일치 여부검사)
	@RequestMapping("authPwd.me")
	@ResponseBody
	public String authPassword(String inputPwd, HttpSession session) {
		
		User loginUser = userService.loginUser((User)session.getAttribute("loginUser"));
		System.out.println("입력 비밀번호 : " + inputPwd);
		System.out.println("loginUser : " + loginUser);
		
		return bcryptPasswordEncoder.matches(inputPwd, loginUser.getUserPwd()) ? "NNNNY" : "NNNNN"; 
	}
	
	
	// 비밀번호 변경
	@RequestMapping("updatePwd.me")
	public String updatePassword(String newPwd, HttpSession session) {
	    User updateUser = null;
	    updateUser = (User)session.getAttribute("loginUser");
	    if (updateUser == null) {
	        session.setAttribute("alertMsg", "로그인 정보가 없습니다. 다시 로그인 해주세요.");
	        return "redirect:/login.me";
	    }

	    updateUser.setUserPwd(bcryptPasswordEncoder.encode(newPwd));
	    System.out.println("Updated User: " + updateUser);

	    int result = mypageService.updatePassword(updateUser);

	    if (result > 0) { // 변경 성공
	    	session.setAttribute("loginUser", updateUser);
	        session.setAttribute("alertMsg", "비밀번호 변경에 성공하였습니다");
	        return "redirect:/main.me";
	    }

	    // 변경 실패 시
	    session.setAttribute("alertMsg", "비밀번호 변경에 실패하였습니다");
	    return "mypage/updateUserForm";
	}
	
	//프로필 이미지 불러오기ajax
	@RequestMapping("loadImg.me")
	@ResponseBody
	public String loadProfileImg(HttpSession session) {
		int userNo = ((User)session.getAttribute("loginUser")).getUserNo(); //로그인 된 유저의 고유번호 불러오기

		ProfileImg profileImg = mypageService.loadProfileImg(userNo);
		
		if(profileImg == null) {
			profileImg = new ProfileImg();
			profileImg.setFilePath("/resources/img/mypage/profile/");
			return new Gson().toJson(profileImg);
		}
		
		return new Gson().toJson(profileImg);
		
	}
	
	//프로필 이미지 변경
	@RequestMapping("updateImg.me")
	public String updateProfileImg(MultipartFile upfile, String imgOption, HttpSession session, Model model) {
		String path = "/resources/uploadfiles/profile/";
		ProfileImg profileImg = new ProfileImg();
		
		int result = 0, update = 0;
		if(upfile.getOriginalFilename() != "" && imgOption.equals("newImg")) { //업로드 파일 이름이 비어있지않다면(업로드할파일이 존재한다면)
			//이미지 파일 rename
			String changeName = MyFileRenamePolicy.saveFile(upfile, session, path);
			 
			profileImg.setUserNo(((User)session.getAttribute("loginUser")).getUserNo()); //로그인 된 유저의 고유번호 불러오기
			profileImg.setFilePath(path); //저장경로
			profileImg.setOriginName(upfile.getOriginalFilename());
			profileImg.setChangeName(changeName);

			//이미지 업데이트 => db에 존재하지 않으면 이미지 추가
			update = mypageService.updateProfileImg(profileImg); //업데이트 
			if(update == 0) {
				result = mypageService.insertProfileImg(profileImg);//추가
			} else if(update > 0) {
				result = 1;
			}
		} else if(upfile.getOriginalFilename() == "" && imgOption.equals("defaultImg")) {
			profileImg.setUserNo(((User)session.getAttribute("loginUser")).getUserNo()); //로그인 된 유저의 고유번호 불러오기
			profileImg.setFilePath("/resources/img/mypage/profile/"); //저장경로
			
			System.out.println("profileImg : " + profileImg);
			
			//이미지 업데이트 => db에 존재하지 않으면 이미지 추가
			update = mypageService.updateProfileImg(profileImg); //업데이트 
			if(update == 0) {
				result = mypageService.insertProfileImg(profileImg);//추가
			} else if(update > 0) {
				result = 1;
			}
		} else if(upfile.getOriginalFilename() == "" && imgOption.equals("currentImg")) {
			model.addAttribute("contentPage", "updateUserForm");
			return "mypage/mypageLayout";
		}

		
		if(result > 0) {			
			session.setAttribute("alertMsg", "수정되었습니다");
			return "redirect:/updateForm.me";
		}
		
		session.setAttribute("alertMsg", "수정에 실패하였습니다");
		model.addAttribute("contentPage", "updateUserForm");
		return "mypage/mypageLayout";
		
	}
	
	//회원 정보 변경
	@RequestMapping("update.me")
	public String updateUserInfo(User user, HttpSession session, Model model) {
		
	    int result = mypageService.updateUserInfo(user);

		if(result > 0) {
			session.setAttribute("loginUser", userService.loginUser(user));
			session.setAttribute("alertMsg", "수정되었습니다");
			return "redirect:/updateForm.me";
		} else {
			session.setAttribute("alertMsg", "수정에 실패하였습니다");
			model.addAttribute("contentPage", "updateUserForm");
			return "mypage/mypageLayout";
		}
	}
	
	//회원탈퇴
	@RequestMapping("delete.me")
	public String withdrawalUser(HttpSession session, Model model) {
		User user = (User)session.getAttribute("loginUser"); 
		
	    int result = mypageService.withdrawalUser(user);
		
		if(result > 0) {
			session.removeAttribute("loginUser");
			session.setAttribute("alertMsg", "회원탈퇴가 완료되었습니다");
			return "redirect:/";
		} else {
			session.setAttribute("alertMsg", "회원탈퇴 실패하였습니다");
			model.addAttribute("contentPage", "updateUserForm");
			return "mypage/mypageLayout";
		}
	}
	
	//선택한 찜공연 삭제
	@RequestMapping("deleteMyScrap.me")
	@ResponseBody
	public String deleteMyScrapAjax(int concertNo, HttpSession session) {
		int userNo = ((User)session.getAttribute("loginUser")).getUserNo(); //로그인 된 유저의 고유번호 불러오기
		
		Map<String, Integer> params = new HashMap<>();
		
		params.put("userNo", userNo);
		params.put("concertNo", concertNo);
		
		int result = mypageService.deleteMyScrapAjax(params);
		
		return result > 0 ? "NNNNY" : "NNNNN";
	}


	//공연 리뷰 정보 받아오기(+공연정보)
	@RequestMapping("loadReview.me")
	@ResponseBody
	public String loadOneLineReviewAjax(int concertNo, HttpSession session) {
		int userNo = ((User)session.getAttribute("loginUser")).getUserNo(); //로그인 된 유저의 고유번호 불러오기

		Map<String, Integer> params = new HashMap<>();
		params.put("userNo", userNo);
		params.put("concertNo", concertNo);
		
		ConcertReview info = mypageService.loadOneLineReviewAjax(params);
		
		return info != null ? new Gson().toJson(info) : null;
	}
	
	//한줄평 리뷰 저장 및 수정
	@RequestMapping("saveReview.me")
	public String saveOneLineReview(ConcertReview concertReview, HttpSession session, Model model) {
		int userNo = ((User)session.getAttribute("loginUser")).getUserNo(); //로그인 된 유저의 고유번호 불러오기
		concertReview.setUserNo(userNo);
		
		System.out.println(concertReview);
		
		int result = 0;
		if(concertReview.getReviewNo() == 0) { //getReviewNo 값이 0이라면 작성된 리뷰가 없다는 뜻 => insert
			result = mypageService.insertOneLineReview(concertReview);
		} else { // 아닐 경우 => update
			result = mypageService.updateOneLineReview(concertReview);			
		}
		
		if(result > 0) {
			session.setAttribute("alertMsg", "저장되었습니다");
			return "redirect:/reviewList.me?cpage=1";
		}
		
		session.setAttribute("alertMsg", "수정에 실패하였습니다");
		model.addAttribute("contentPage", "oneLineReview");
		return "mypage/mypageLayout";
	
	}
	
	
}
