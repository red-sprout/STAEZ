package com.spring.staez.user.controller;

import java.util.Properties;

import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSenderImpl;

// 직접 도구를 생성해서 이메일을 보내보자

/*
 * 
 * Email Protocol
 * SMTP
 * 이메일을 전송할 때 사용하는 프로토콜
 * 
 * POP
 * 이메일 서버에 도착한 메일을 클라이언트로 가져올 떄 사용하는 프로토콜
 * 
 * IMAP
 * 이메일 서버에 직접 적솝하여 이메일을 확인할 때 사용하는 프로토콜
 * (gmail의 SMTP를 이용하기위해서는 IMAP를 사용으로 해줘야한다.)
 */
public class Test1 {

	public static void main(String[] args) {
		//UUID : 임시로만든 아이디 곂치지않기 위해 (암호키)

		//MIME 형식의 메일 JavaMailSender 인터페이스를 사용한다.

		JavaMailSenderImpl sender = new JavaMailSenderImpl();
		sender.setHost("smtp.gmail.com");
		sender.setPort(587); //지정된 포스트
		sender.setUsername("missjj312@gmail.com"); //본인 아이디
		sender.setPassword("wlpq ufjq jjmn zqcw "); //계정 비밀번호
		
		//옵션설정
		Properties prop = new Properties();
		prop.put("mail.smtp.auth", true);
		prop.put("mail.smtp.starttls.enable", true);
		
		sender.setJavaMailProperties(prop);
		
		//메세지 생성
		SimpleMailMessage message = new SimpleMailMessage();
		message.setSubject("이메일 전송 테스트");
		message.setText("이메일을 테스트하도록 하겠습니다.");
		
		String[] to = {"missjj312@gmail.com"}; //받는사람 여러명이니 스트링 배열로
		message.setTo(to);
		
		String[] cc = {"missjj312@gmail.com"}; //받는사람 여러명이니 스트링 배열로
		message.setCc(cc);
		
		sender.send(message);
		
	}

}
