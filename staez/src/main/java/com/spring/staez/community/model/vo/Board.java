package com.spring.staez.community.model.vo;

import java.sql.Timestamp;

import com.spring.staez.user.model.vo.User;

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
public class Board {
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
	private int categoryNo; //카테고리번호
	private String categoryName; //카테고리이름
	private int refCategoryNo; //상위카테고리번호
	private int categoryLevel; //카테고리레벨
	private int concertNo; //공연번호
	private int likeCount; //좋아요 개수
	private User user;
	private BoardAttachment boardAttachment;
}

