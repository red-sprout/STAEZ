package com.spring.staez.admin.model.vo;

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
public class Seat {
	private int seatId; //좌석아이디
	private int concertNo; //공연번호
	private String grade; //좌석등급
	private int price; //가격
	private Date concertDate; //공연날짜
	private int seatStartRow; //좌석시작행
	private int seatEndRow; //좌석끝행
	private int seatStartCol; //좌석시작열
	private int seatEndCol; //좌석끝열
	private String status; //좌석활성화여부
	private int seatCount; //sql문 조건에 맞는 좌석개수
}
