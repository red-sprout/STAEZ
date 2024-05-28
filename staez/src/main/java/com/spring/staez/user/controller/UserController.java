package com.spring.staez.user.controller;

import javax.activation.DataSource;
import javax.activation.FileDataSource;
import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.support.ServletUriComponentsBuilder;

import com.spring.staez.user.model.vo.User;
import com.spring.staez.user.service.UserService;

@Controller
public class UserController {

    @Autowired
    private UserService userService;
    @Autowired
    private BCryptPasswordEncoder bcryptPasswordEncoder;
	@Autowired
	private JavaMailSender sender;

    // 로그인
    @GetMapping("loginForm.me")
    public String loginForm() {
        return "user/loginForm";
    }

    // 회원가입
    @GetMapping("insertForm.me")
    public String signinForm() {
        return "user/insertForm";
    }

    // 아이디찾기
    @GetMapping("findIdForm.me")
    public String findIdForm() {
        return "user/findIdForm";
    }

    // 아이디찾기결과
    @GetMapping("idListForm.me")
    public String idListForm() {
        return "user/idListForm";
    }

    // 비밀번호 찾기
    @GetMapping("findPwdForm.me")
    public String findPwdForm() {
        return "user/findPwdForm";
    }

    // 새 비밀번호 입력
    @GetMapping("insertPwdForm.me")
    public String newPwdForm() {
        return "user/insertPwdForm";
    }

    // idCheck
    @ResponseBody
    @GetMapping("idCheck.me")
    public String idCheck(String checkId) {
        System.out.println("Check ID: " + checkId); // 디버깅을 위한 로그 추가
        int result = userService.idCheck(checkId);

        if (result > 0) { // 이미 존재한다면
            return "NNNNN";
        } else { // 존재하지 않는다면
            return "NNNNY";
        }
    }

    // nickCheck
    @ResponseBody
    @GetMapping("nickCheck.me")
    public String nickCheck(String checkNick) {
        int result = userService.nickCheck(checkNick);

        if (result > 0) { // 이미 존재한다면
            return "NNNNN";
        } else { // 존재하지 않는다면
            return "NNNNY";
        }
    }

    // 회원가입
    @PostMapping("insert.me")
    public String insertMember(User u, HttpSession session, Model model) {
        // 디버깅 추가
        System.out.println("Received password: " + u.getUserPwd());

        // 비밀번호가 null인지 확인
        if (u.getUserPwd() == null) {
            model.addAttribute("alertMsg", "비밀번호가 입력되지 않았습니다.");
            return "redirect:/";
        }

        // 암호화 작업
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
    
    //이메일 체크
    @ResponseBody
    @GetMapping("emailCheck.me")
    public String emailCheck(String checkEmail) {
        System.out.println("Check ID: " + checkEmail); // 디버깅을 위한 로그 추가
        int result = userService.idCheck(checkEmail);

        if (result > 0) { // 이미 존재한다면
            return "NNNNN";
        } else { // 존재하지 않는다면
            return "NNNNY";
        }
    }
    
}