package com.spring.staez.concert.model.vo;

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
public class Theater {
	private int theaterNo; //공연시설번호
	private String theaterName; //공연장명
	private int theaterRow; //총행수
	private int theaterCol; //총열수
	private String address; //주소
	private String telno; //전화번호
}
