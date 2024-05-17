package com.spring.staez.admin.model.vo;

import java.sql.Date;

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
public class ConcertSchedule {
	private int scheduleNo; //일정번호
	private int concertNo; //공연번호
	private String schedule; //일정
	private Date startDate; //시작날짜
	private Date endDate; //종료날짜
	private int concertTimes; //공연회차
	private String status; //일정상태
}
