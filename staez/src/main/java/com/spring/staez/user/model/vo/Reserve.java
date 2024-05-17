package com.spring.staez.user.model.vo;

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
public class Reserve {
	private int reserveNo; //예매번호
	private int concertNo; //공연번호
	private int userNo; //예매회원번호
	private int reserveRow; //좌석행
	private int reserveCol; //좌석열
	private Timestamp reserveDate; //예매날짜
	private String payMethod; //결제방법
	private Date concertDate; //공연날짜
	private Date concertTimes; //공연회차
	private String reserveStatus; //예약활성화여부
}
