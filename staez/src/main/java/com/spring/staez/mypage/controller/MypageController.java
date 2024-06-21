package com.spring.staez.mypage.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
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

import net.nurigo.sdk.NurigoApp;
import net.nurigo.sdk.message.exception.NurigoMessageNotReceivedException;
import net.nurigo.sdk.message.model.Message;
import net.nurigo.sdk.message.service.DefaultMessageService;

@Controller
public class MypageController {

	@Autowired
	private UserService userService;
	
	@Autowired
	private MypageService mypageService;
	
	@Autowired
	private BCryptPasswordEncoder bcryptPasswordEncoder;
	
	@Autowired
	private JavaMailSender sender;
	
	@Value("${coolsms.api.key}")
    private String serviceKey;
	
	@Value("${coolsms.api.secret}")
	private String secretKey;
	

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
	
	//결제내역 상세 페이지 출력
	@RequestMapping("reserveDetail.me")
	public String selectPaymentsDetail(int reserveNo, Model model) {
		PaymentsInfoDto payments = mypageService.selectPaymentsDetail(reserveNo);
		
		model.addAttribute("payments", payments);
		
		return "mypage/paymentsDetail";
	}
	
//	//결제 작업(무통장입금)
//	@RequestMapping("deposit.me")
//	@ResponseBody
//	public String depositPayments(@RequestBody PaymentsInfoDto pid) {		
//		int result = mypageService.depositPayments(pid);
//		
//		return result > 0 ? "success" : "failed";	
//	};
	
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
	
	//문의 내역 상세페이지 출력
	@RequestMapping("inquireDetail.me")
	public String myInquireDetail(int boardNo, Model model) {
		Board inquire = mypageService.selectMyInquireDetail(boardNo);
		
		model.addAttribute("inquire", inquire);
		
		return "mypage/myInquireDetail";
	}
	
	//문의 내역 답변 불러오기 ajax
	@RequestMapping("loadAnswer.me")
	@ResponseBody
	public String loadAnswerAjax(int boardNo) {
		Board answer = mypageService.loadAnswerAjax(boardNo);
		
		return new Gson().toJson(answer);
	}
		
	//문의글 답변있는지 판별 ajax
	@RequestMapping("answerCheck.me")
	@ResponseBody
	public String answerCheckAjax(int boardNo) {
		System.out.println(boardNo);
		Board answer = mypageService.loadAnswerAjax(boardNo);
			
		return answer == null ? "NNNNN" : "NNNNY";
	}
	
	//문의글 삭제 ajax
	@RequestMapping("deleteInquire.me")
	@ResponseBody
	public String deleteInquireAjax(int boardNo) {
		System.out.println("문의글 삭제");
		int result = mypageService.deleteInquireAjax(boardNo);
		
		if(result > 0) {
			return "NNNNY";
		} else {
			return "NNNNN";
		}
	}
	
	//나의 작성 게시글 리스트 페이지 출력
	@RequestMapping("boardList.me")
	public String myBoardList(int cpage, String keyword, HttpSession session, Model model) {
		User loginUser = userService.loginUser((User)session.getAttribute("loginUser"));
		if(loginUser == null) { //로그인 되어있지 않을 경우
	        session.setAttribute("alertMsg", "로그인이 필요합니다.");
	        return "redirect:/loginForm.me";
		}
		
		System.out.println(keyword);
		
		int userNo = loginUser.getUserNo();
		ArrayList<BoardListDto> list;
		int currentPage = cpage;
		int listCount;
		PageInfo pi;
		
		Map<String, Object> map = new HashMap<>();

		if(!(keyword == null || keyword.equals(""))) {
			map.put("userNo", userNo);
			map.put("keyword", keyword.trim());
			
			listCount = mypageService.selectMyBoardSearchListCount(map);
			pi = Pagination.getPageInfo(listCount, currentPage, 10, 10);
			list =  mypageService.selectMyBoardSearchList(map, pi);
			System.out.println("키워드 있음");
		} else {
			listCount = mypageService.selectMyBoardListCount(userNo);
			pi = Pagination.getPageInfo(listCount, currentPage, 10, 10);
			list =  mypageService.selectMyBoardList(userNo, pi);
			System.out.println("키워드 없음");
		}
		
		model.addAttribute("contentPage", "myBoardList");
		model.addAttribute("keyword", map.get("keyword"));
		model.addAttribute("blist", list);
		model.addAttribute("pi", pi);
		
		return "mypage/mypageLayout";
	}
	
	//나의 좋아요 게시글 리스트 페이지 출력
	@RequestMapping("likeList.me")
	public String likeBoardList(int cpage, String keyword, HttpSession session, Model model) {
		User loginUser = userService.loginUser((User)session.getAttribute("loginUser"));
		if(loginUser == null) { //로그인 되어있지 않을 경우
	        session.setAttribute("alertMsg", "로그인이 필요합니다.");
	        return "redirect:/loginForm.me";
		}
		
		System.out.println(keyword);
		
		int userNo = loginUser.getUserNo();
		ArrayList<BoardListDto> list;
		int currentPage = cpage;
		int listCount;
		PageInfo pi;
		
		Map<String, Object> map = new HashMap<>();

		if(!(keyword == null || keyword.equals(""))) {
			map.put("userNo", userNo);
			map.put("keyword", keyword.trim());
			
			listCount = mypageService.selectLikeBoardSearchListCount(map);
			pi = Pagination.getPageInfo(listCount, currentPage, 10, 10);
			list =  mypageService.selectLikeBoardSearchList(map, pi);
			System.out.println("키워드 있음");
		} else {
			listCount = mypageService.selectLikeBoardListCount(userNo);
			pi = Pagination.getPageInfo(listCount, currentPage, 10, 10);
			list =  mypageService.selectLikeBoardList(userNo, pi);
			System.out.println("키워드 없음");
		}
		
		model.addAttribute("contentPage", "likeBoardList");
		model.addAttribute("blist", list);
		model.addAttribute("keyword", map.get("keyword"));
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
		
		//session에 이미 인증했다는 정보가 있을 경우
		String isAuth = (String)session.getAttribute("isAuth");
		System.out.println(isAuth);
		if(isAuth != null && isAuth.equals("done")) {
			model.addAttribute("isAuth", "done");
			System.out.println("이미 인증함");
		}
		
		model.addAttribute("contentPage", "updateUserForm");
		return "mypage/mypageLayout";
	}

	
	//비밀번호 인증(일치 여부검사)
	@RequestMapping("authPwd.me")
	@ResponseBody
	public String authPassword(String inputPwd, HttpSession session) {			
		User loginUser = userService.loginUser((User)session.getAttribute("loginUser"));
		System.out.println("입력 비밀번호 : " + inputPwd);
		System.out.println("loginUser : " + loginUser);
		
		if(bcryptPasswordEncoder.matches(inputPwd, loginUser.getUserPwd())) {
			session.setAttribute("isAuth", "done");
			return "NNNNY";
		} else {
			session.removeAttribute("isAuth");
			return "NNNNN";
		}
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
	        session.removeAttribute("isAuth");
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
			profileImg.setFilePath("/resources/uploadfiles/profile/");
			return new Gson().toJson(profileImg);
		}
		
		return new Gson().toJson(profileImg);
		
	}
	
	//중복 체크
	@RequestMapping("dupliCheck.me")
	@ResponseBody
	public String duplicateCheck(String nickname) {
		int result = mypageService.duplicateCheck(nickname);
		return result > 0 ? "NNNNN" : "NNNNY"; 
	}
	
	//프로필 이미지 변경
	@RequestMapping("updateImg.me")
	public String updateProfileImg(MultipartFile upfile, String imgOption, HttpSession session, Model model) {
		String path = "/resources/uploadfiles/profile/"; //프로필 이미지들 저장되는 경로
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
			profileImg.setFilePath(path); //저장경로
			
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
	    System.out.println("result : " + result);
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
	
	//한줄평 삭제
	@ResponseBody
	@RequestMapping("deleteReview.me")
	public String deleteOneLineReviewAjax(int reviewNo) {
		System.out.println(reviewNo);
		
		int result = mypageService.deleteOneLineReviewAjax(reviewNo);	
		
		return result > 0 ? "success" : "filed";
	}
	
	
	//마이페이지 메인 미리보기 
	@RequestMapping("loadMainPageAjax.me")
	@ResponseBody
	public String loadMainPage(String tableType, HttpSession session) {
		int userNo = ((User)session.getAttribute("loginUser")).getUserNo(); //로그인 된 유저의 고유번호 불러오기
		
		switch(tableType) {
		case "myPayments":
			ArrayList<PaymentsInfoDto> paylist = mypageService.loadMyPaymentsAjax(userNo);
			return new Gson().toJson(paylist);
		case "myScrap":
			ArrayList<Concert> scraplist = mypageService.loadMyScrapAjax(userNo);
			return new Gson().toJson(scraplist);
		case "myReview":
			ArrayList<ConcertReview> reviewlist = mypageService.loadMyReviewAjax(userNo);
			return new Gson().toJson(reviewlist);
		case "myBoard":
			ArrayList<Board> boardlist = mypageService.loadMyBoardAjax(userNo);
			return new Gson().toJson(boardlist);
		case "myInquire":
			ArrayList<Board> inquirelist = mypageService.loadMyInquireAjax(userNo);
			return new Gson().toJson(inquirelist);
		default :
			return null; //
		}
		
	}

	//휴대폰번호 인증번호 전송
	@RequestMapping("sendPhoneAuth.me")
	@ResponseBody
	public String authPhone(String authNo, String phone) {   
		System.out.println("휴대폰번호 : " + phone);
		System.out.println("인증번호 : " + authNo);
		
		DefaultMessageService messageService = NurigoApp.INSTANCE.initialize(serviceKey, secretKey, "https://api.coolsms.co.kr");
		// Message 패키지가 중복될 경우 net.nurigo.sdk.message.model.Message로 치환하여 주세요
		Message message = new Message();
		message.setFrom("01053942839"); //계정에서 등록한 발신번호 입력
		message.setTo(phone);
		message.setText("STAEZ 인증번호는 [" + authNo + "] 입니다.");

		try {
		  // send 메소드로 ArrayList<Message> 객체를 넣어도 동작합니다!
		  messageService.send(message);
		  return "NNNNY";
		} catch (NurigoMessageNotReceivedException exception) {
		  // 발송에 실패한 메시지 목록을 확인할 수 있습니다!
		  System.out.println(exception.getFailedMessageList());
		  System.out.println(exception.getMessage());
		  return "NNNNY"; //나중에 NNNNN으로 변경해야됨

		} catch (Exception exception) {
		  System.out.println(exception.getMessage());
		  return "NNNNY"; //나중에 NNNNN으로 변경해야됨
		  
		}
	}

	//이메일 인증번호 전송
	@RequestMapping("sendEmailAuth.me")
	@ResponseBody
	public String authEmail(String authNo, String email) {   
	    if (authNo == null || email == null) {
	        return "ERROR: 인증번호 또는 이메일 주소가 필요합니다.";
	    }
		System.out.println("이메일주소 : " + email);
		System.out.println("인증번호 : " + authNo);
		
		// 메일 전송
		SimpleMailMessage message = new SimpleMailMessage();
		message.setTo(email);
		message.setSubject("STAEZ 이메일 인증");
		message.setText("STAEZ 인증 번호는 [" + authNo + "] 입니다.");
		
		sender.send(message);

		return "NNNNY";
	}
	
	//이메일, 휴대폰 번호 있는지 체크
	@RequestMapping("checkExist.me")
	@ResponseBody
	public String checkExistAjax(String info, int type, HttpSession session) { //type - 1 : phone, 2 : email
		
		int userNo = ((User)session.getAttribute("loginUser")).getUserNo();
		int result = mypageService.checkExistAjax(userNo, info, type);

		return result > 0 ? "exist" : "noneOrMine";
	}
	
}
	