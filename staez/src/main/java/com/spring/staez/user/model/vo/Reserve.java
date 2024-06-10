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
	private String concertTitle; //공연제목
	private int userNo; //예매회원번호
	private int reserveRow; //좌석행
	private int reserveCol; //좌석열
	private Timestamp reserveDate; //예매날짜
	private String payMethod; //결제방법
	private Date concertDate; //공연날짜
	private String concertTimes; //공연일정(시간)
	private String reserveStatus; //예약활성화여부
	private String rName; //예매자이름(실명)
	private String rBirth; //예매자생년월일
	private String rPhone; //예매자휴대폰번호
	private String schedule; //일정(시간)
}
