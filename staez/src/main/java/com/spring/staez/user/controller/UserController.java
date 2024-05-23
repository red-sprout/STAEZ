package com.spring.staez.user.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.spring.staez.user.model.vo.User;
import com.spring.staez.user.service.UserService;

@Controller
public class UserController {
	
	@Autowired
	private UserService userService;
	@Autowired
	private BCryptPasswordEncoder bcryptPasswordEncoder;
	
	//	로그인
		@GetMapping("loginForm.me")
		public String loginForm() {
		    return "user/loginForm";
		}
	
	//	회원가입
		@GetMapping("insertForm.me")
		public String signinForm() {
			return "user/insertForm";
	}
		
//		아이디찾기
		@GetMapping("findIdForm.me")
		public String findIdForm() {
			return "user/findIdForm";
	}
//		아이디찾기결과
		@GetMapping("idListForm.me")
		public String idListForm() {
			return "user/idListForm";
	}
//		비밀번호 찾기
		@GetMapping("findPwdForm.me")
		public String findPwdForm() {
			return "user/findPwdForm";
		}
//		새 비밀번호 입력
		@GetMapping("insertPwdForm.me")
		public String newPwdForm() {
			return "user/insertPwdForm";
		}
		
		/*
		 * ajax요청에 대한 응답을 위한 controller에는 @ResponseBody어노테이션을 작성해줘야한다.
		 * 기본적인 세팅이 jsp응답으로 되어있기 때문에 @ResponseBody을작성해주면
		 * 반환값을 http응답 객체에 직접 작성하겠다라는 의미를 가지고있다.
		 */
		//idCheck ajax요청을 받아줄 controller
		@ResponseBody
		@GetMapping("idCheck.me")
		public String idCheck(String checkId) {
			int result = userService.idCheck(checkId);
			
			if (result > 0) {// 이미존재한다면
				return "NNNNN";
			} else { //존재하지않는다면
				return "NNNNY";
			}
			
			//return memberService.idCheck(checkId) > 0 ? "NNNNN" : "NNNNY";
		}
		
		//nickCheck ajax요청을 받아줄 controller
		@ResponseBody
		@GetMapping("nickCheck.me")
		public String nickCheck(String checkNick) {
			int result = userService.nickCheck(checkNick);
			
			if (result > 0) {// 이미존재한다면
				return "NNNNN";
			} else { //존재하지않는다면
				return "NNNNY";
			}
			
			//return memberService.idCheck(checkId) > 0 ? "NNNNN" : "NNNNY";
		}
		
//		회원가입
		@PostMapping("insert.me")
		public String insertMember(User u, HttpSession session, Model model) {
			/*
			 * 1. 한글깨짐문제 발생 => web.xml에 스프링에서 제공하는 인코딩 필터 등록
			 * 2. 나이를 입력하지 않을 경우 int자료형에 빈문자열을 대입해야하는 경우가 발생한다.
			 * => 400에러 방생  Member의 age필드 자료형을 String으로 변경해주면 된다.
			 * 3. 비밀번호가 사용자 입력 그대로 전달이 된다(평문)
			 * Bcrypt방식을 이용해서 암호화를 한 후 저장을 하겠다.
			 * => 스프링시큐리티에서 제공하는 모듈을 이용<pom.xml에 라이브러리 추가>
			 */
			
			//암호화작업
			String encPwd = bcryptPasswordEncoder.encode(u.getUserPwd());
			
			u.setUserPwd(encPwd);
			
			int result = userService.insertUser(u);
			
			if (result > 0) {
				session.setAttribute("alertMsg", "성공적으로 회원가입이 완료되었습니다.");
				return "redirect:/";
			} else {
				model.addAttribute("alertMsg", "회원가입 실패");
				return "redirect:/";
			}
		}
}
