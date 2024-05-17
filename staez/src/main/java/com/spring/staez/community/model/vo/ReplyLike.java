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
public class ReplyLike {
	private int	replyLikeNo; //댓글좋아요번호
	private int replyNo; //댓글번호
	private int userNo; //좋아요누른회원번호
	private Timestamp likeDate; //좋아요누른날짜
	private String status; //좋아요여부
}
