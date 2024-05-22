package com.spring.staez.user.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.spring.staez.user.service.UserService;

@Controller
public class UserController {
	
	@Autowired
	private UserService userService;
	
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
		
}
