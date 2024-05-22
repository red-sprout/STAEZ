package com.spring.staez.user.model.vo;

import java.sql.Date;
import java.sql.Timestamp;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter
@ToString
public class User {
	private int userNo; //회원번호
	private String userId; //아이디
	private String userPwd; //비밀번호
	private String nickname; //닉네임
	private String gender; //성별
	private Date birth; //생년월일(나이)
	private String address; //주소
	private String email; //이메일
	private String phone; // 핸드폰
	private String genreLike; //관심장르
	private String grade; //회원등급
	private Timestamp enrollDate; //가입날짜
	private Timestamp withdrawalDate; //탈퇴날짜
	private String userStatus; //회원상태

}
