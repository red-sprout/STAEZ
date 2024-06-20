package com.spring.staez.user.model.dto;

import java.sql.Date;
import java.sql.Timestamp;

import lombok.Data;

@Data
public class PaymentsInfoDto {
	private int concertNo;
	
	private String concertTitle;
	private String theaterName;
	private Timestamp concertDate;
	private String schedule;
	private int concertRuntime;
		
	private int reserveNo;
	private Timestamp reserveDate;
	private String grade;
	private int price;
	private String payMethod;
	private String rName;
	private String rPhone;
	private Date rBirth;
	
	private int reserveRow;
	private int reserveCol;
	private String reserveStatus;

	private String filePath;
	private String changeName;
	
	private int tickets; //같은 결제에서 예매한 자리수
}
