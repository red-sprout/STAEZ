package com.spring.staez.community.model.vo;

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
public class BoardAttachment {
	private int	fileNo; //파일번호
	private int boardNo; //게시글번호
	private String originName; //파일원본명
	private String changeName; //파일수정명
	private String filePath; //파일경로
	private Timestamp uploadDate; //업로드날짜
	private int	fileLevel; //파일레벨
	private String status; //업로드여부
}
