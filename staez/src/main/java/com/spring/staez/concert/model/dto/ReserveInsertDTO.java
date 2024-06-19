package com.spring.staez.concert.model.dto;

import java.sql.Date;
import java.util.List;

import com.google.gson.JsonArray;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class ReserveInsertDTO {
	private int concertNo; //공연번호
	private int userNo; //회원번호
	private String concertDate; //콘서트날짜
	private String schedule; //공연시간
	private String recipientName; //수령인 이름
	private String recipientPhone; //수령인 전화번호
	private String recipientBirth; //수령인생년월일
	private String recipientEmail; // 수령인 이메일
	private String payMethod; //결제방식
	private List<String> seatList; //좌석 정보들
	private int row;
	private int col;
}
