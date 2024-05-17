package com.spring.staez.admin.model.vo;

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
public class ImpossibleSeat {
	private int impossibleSeatNo; //착석불가번호
	private int theaterNo; //공연장번호
	private int impossibleSeatRow; //좌석행
	private int impossibleSeatCol; //좌석열
}
