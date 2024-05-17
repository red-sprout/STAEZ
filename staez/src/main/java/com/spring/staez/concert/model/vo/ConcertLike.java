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
public class ConcertLike {
	private int concertLikeNo; //공연찜번호
	private int userNo; //회원번호
	private int concertNo; //공연번호
	private Timestamp updateDate; //찜날짜
	private String status; //찜여부
}
