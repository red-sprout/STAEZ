package com.spring.staez.user.model.vo;

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
public class ProfileImg {
	private int	fileNo; //파일번호
	private int userNo; //회원번호
	private String originName; //파일원본명
	private String changeName; //파일수정명
	private String filePath; //파일경로
	private Timestamp uploadDate; //업로드날짜
	private String status; //업로드여부
}
