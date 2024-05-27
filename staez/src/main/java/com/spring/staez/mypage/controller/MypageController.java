package com.spring.staez.mypage.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.spring.staez.common.template.MyFileRenamePolicy;
import com.spring.staez.mypage.service.MypageService;
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
	public String paymentsLog(HttpSession session, Model model) {
		if(session.getAttribute("loginUser") == null) { //로그인 되어있지 않을 경우
	        session.setAttribute("alertMsg", "로그인이 필요합니다.");
	        return "redirect:/loginForm.me";
		}
		model.addAttribute("contentPage", "paymentsLog");
		return "mypage/mypageLayout";
	}
	
	//찜목록 리스트 페이지 출력
	@RequestMapping("scrapList.me")
	public String myScrapList(HttpSession session, Model model) {
		if(session.getAttribute("loginUser") == null) { //로그인 되어있지 않을 경우
	        session.setAttribute("alertMsg", "로그인이 필요합니다.");
	        return "redirect:/loginForm.me";
		}
		
		model.addAttribute("contentPage", "myScrapList");
		return "mypage/mypageLayout";
	}

	//한줄평 리스트 페이지 출력
	@RequestMapping("reviewList.me")
	public String oneLineReview(HttpSession session, Model model) {
		if(session.getAttribute("loginUser") == null) { //로그인 되어있지 않을 경우
	        session.setAttribute("alertMsg", "로그인이 필요합니다.");
	        return "redirect:/loginForm.me";
		}
		model.addAttribute("contentPage", "oneLineReview");
		return "mypage/mypageLayout";
	}
	
	//나의 작성 게시글 리스트 페이지 출력
	@RequestMapping("boardList.me")
	public String myBoardList(HttpSession session, Model model) {
		if(session.getAttribute("loginUser") == null) { //로그인 되어있지 않을 경우
	        session.setAttribute("alertMsg", "로그인이 필요합니다.");
	        return "redirect:/loginForm.me";
		}
		model.addAttribute("contentPage", "myBoardList");
		return "mypage/mypageLayout";
	}
	
	//나의 찜목록 게시글 리스트 페이지 출력
	@RequestMapping("likeList.me")
	public String likeBoardList(HttpSession session, Model model) {
		if(session.getAttribute("loginUser") == null) { //로그인 되어있지 않을 경우
	        session.setAttribute("alertMsg", "로그인이 필요합니다.");
	        return "redirect:/loginForm.me";
		}
		model.addAttribute("contentPage", "likeBoardList");
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
	
	//나의 문의내역 리스트 페이지 출력
	@RequestMapping("inquireList.me")
	public String myInquireList(HttpSession session, Model model) {
		if(session.getAttribute("loginUser") == null) { //로그인 되어있지 않을 경우
	        session.setAttribute("alertMsg", "로그인이 필요합니다.");
	        return "redirect:/loginForm.me";
		}
		model.addAttribute("contentPage", "myInquireList");
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
	
	//프로필 이미지 변경
	@RequestMapping("updateImg.me")
	public String updateProfileImg(MultipartFile upfile, ProfileImg profileImg, HttpSession session, Model model) {
		String filePath = session.getServletContext().getRealPath("/resources/img/mypage/profile/");
		profileImg.setFilePath(filePath);
		
		profileImg.setUserNo(((User)session.getAttribute("loginUser")).getUserNo()); //로그인 된 유저의 고유번호 불러오기
		
		if(!upfile.getOriginalFilename().equals("")) { //업로드 파일 이름이 비어있지않다면(업로드할파일이 존재한다면)
			//이미지 파일 rename
			String changeName = MyFileRenamePolicy.saveFile(upfile, session, filePath);
			 
			profileImg.setOriginName(upfile.getOriginalFilename());
			profileImg.setChangeName(changeName);
		}
		
		//이미지 업데이트 => db에 존재하지 않으면 이미지 추가
		int result = 0;
	    int update = mypageService.updateProfileImg(profileImg); //업데이트 
		if(update == 0) {
			result =  mypageService.insertProfileImg(profileImg);//추가
		} else if(update > 0) {
			result = 1;
		}

		if(result > 0) {
			session.setAttribute("alertMsg", "수정되었습니다");
//			model.addAttribute("profileImg", profileImg);
			return "redirect:/updateForm.me";
		} else {
			session.setAttribute("alertMsg", "수정에 실패하였습니다");
			return "updateForm.me";
		}
	}
	
	//회원 정보 변경
	@RequestMapping("update.me")
	public String updateUserInfo(User user, HttpSession session) {
		
	    int result = mypageService.updateUserInfo(user);

		if(result > 0) {
			session.setAttribute("loginUser", userService.loginUser(user));
			session.setAttribute("alertMsg", "수정되었습니다");
			return "redirect:/updateForm.me";
		} else {
			session.setAttribute("alertMsg", "수정에 실패하였습니다");
			return "updateForm.me";
		}
	}
	
	//회원탈퇴
	@RequestMapping("delete.me")
	public String withdrawalUser(User user, HttpSession session) {
		
	    int result = mypageService.updateUserInfo(user);

		if(result > 0) {
			session.setAttribute("loginUser", userService.loginUser(user));
			session.setAttribute("alertMsg", "수정되었습니다");
			return "redirect:/updateForm.me";
		} else {
			session.setAttribute("alertMsg", "수정에 실패하였습니다");
			return "updateForm.me";
		}
	}
	

}
