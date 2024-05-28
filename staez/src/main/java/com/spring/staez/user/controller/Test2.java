package com.spring.staez.user.controller;

import javax.activation.DataSource;
import javax.activation.FileDataSource;
import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.support.ServletUriComponentsBuilder;

@Controller
public class Test2 {
	
	@Autowired
	private JavaMailSender sender;
	
	@GetMapping("send")
	public String mail() {
		//메세지 생성
		SimpleMailMessage message = new SimpleMailMessage();
		//message.setSubject("이메일 전송 테스트2");
		//message.setText("이메일을 테스트 하도록 하겠습니다.");
		
		String[] to = {"missjj312@gmail.com"}; //받는사람 여러명이니 스트링 배열로
		message.setTo(to); //setSubject
		
		String[] cc = {"missjj312@gmail.com"}; //받는사람 여러명이니 스트링 배열로
		message.setCc(cc); //setText
		
		sender.send(message);
		
		return "redirect:/";
	}
	
//	html이나 파일 보낼땐 hypermail로 해야한다
	//이건 아이디비밀번호 찾기
	@GetMapping("hypermail")
	public String hypermail() throws MessagingException {
		MimeMessage message = sender.createMimeMessage();
		
		MimeMessageHelper helper = new MimeMessageHelper(message, false, "UTF-8");
		
		String[] to = {"missjj312@gmail.com"}; //받는사람 여러명이니 스트링 배열로
		helper.setTo(to); //setSubject
		
		String[] cc = {"missjj312@gmail.com"}; //받는사람 여러명이니 스트링 배열로
		helper.setCc(cc); //setText
		
		helper.setSubject("이메일 전송 테스트3");
		
		String url = ServletUriComponentsBuilder
				.fromCurrentContextPath()
				.port(8888).path("/user")
				.queryParam("user_id", "missjj312")
				.queryParam("uuid", "asdasdawdasdas") //암호비번
				.toUriString();
		
		//두번쨰 인자를 true로 보낼시 html을 사용하겠다라는 의미
		helper.setText("<a href='" + url + "'>웹사이트로이동</a>", true);
		sender.send(message);
		
		return "redirect:/";
	}
	
	//파일보내는거
	@GetMapping("sebdFile")
	public String sebdFile() throws MessagingException {
		MimeMessage message = sender.createMimeMessage();
		MimeMessageHelper helper = new MimeMessageHelper(message, true, "UTF-8");
		
		String[] to = {"missjj312@gmail.com"}; //받는사람 여러명이니 스트링 배열로
		helper.setTo(to); //setSubject
		
		String[] cc = {"missjj312@gmail.com"}; //받는사람 여러명이니 스트링 배열로
		helper.setCc(cc); //setText
		
		helper.setSubject("이미지 전송 이메일 테스트");
		
		helper.setText("파일 전송 테스트입니다");
		
		//첨부파일 추가
		DataSource source = new FileDataSource("C:\\Users\\user1\\Desktop\\파이널 로고 이미지\\btnG_icon_square 1.png");
		helper.addAttachment(source.getName(), source);
		
		sender.send(message);
		
		return "redirect:/";
	}
	
}
