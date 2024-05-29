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
public class Concert {

	private int concertNo; //공연번호
	private int theaterNo; //공연시설번호
	private String concertTitle; //공연명
	private String concertPlot; //줄거리
	private int concertRuntime; //공연런타임
	private String concertMembers; //출연진
	private String concertProduction; //제작진
	private String ageLimit; //관람연령
	private Timestamp updateDate; //최종수정일
	private String concertStatus; //공연상태
	private String originName; //파일원래명칭
	private String changeName; //파일수정명
	private String filePath; //파일경로
	private String startDate; //시작날짜
	private String endDate; //종료날짜
	private int categoryNo; //카테고리번호
	private String categoryName; //카테고리이름
	private String theaterName; //공영장명
	
	private String reviewContent; //한줄평 내용
}
