package com.spring.staez.admin.model.vo;

import java.sql.Timestamp;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@ToString
public class Faq {
	private int	boardNo; //게시글번호
	private int refBoardNo; //참조게시글
	private int userNo; //작성회원번호
	private int boardLevel; //게시글레벨
	private int boardCode; //게시글코드
	private Timestamp boardWriteDate; //작성날짜
	private String boardTitle; //제목
	private String boardContent; //내용
	private int boardCount; //조회수
	private String boardStatus; //게시글활성화여부
}
