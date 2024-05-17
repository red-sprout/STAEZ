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
public class Reply {
	private int	replyNo; //댓글번호
	private int refReplyNo; //참조댓글번호
	private int boardNo; //게시글번호
	private int userNo; //작성회원번호
	private String replyContent; //내용
	private Timestamp replyWriteDate; //작성날짜
	private String replyStatus; //댓글활성화여부
}
