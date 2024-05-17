package com.spring.staez.concert.model.vo;

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
public class ConcertReview {
	private int reviewNo; //평가번호
	private int userNo; //평가회원번호
	private int concertNo; //평가공연번호
	private String reviewContent; //한줄평
	private int score; //별점(1~5)
	private String reviewStatus; //한줄평활성화여부
	private Timestamp reviewDate; //작성날짜
}
