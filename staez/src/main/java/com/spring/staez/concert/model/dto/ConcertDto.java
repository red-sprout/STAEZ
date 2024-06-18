package com.spring.staez.concert.model.dto;

import java.sql.Timestamp;

import com.google.gson.annotations.SerializedName;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class ConcertDto {
	
    private String concertNo;
	
    @SerializedName("prfnm")
    private String concertTitle; //공연명
    
    @SerializedName("mt20id") // 공연 ID를 플롯에 넣어서
    private String concertPlot; // 공연 ID

    @SerializedName("prfpdfrom")
    private String startDate; //시작날짜

    @SerializedName("prfpdto")
    private String endDate; //종료날짜

    @SerializedName("fcltynm")
    private String theaterName; //공영장명
    
    @SerializedName("prfstate")
    private String concertStatus; //공영장명

    @SerializedName("poster")
    private String changeName; //파일경로 : 포스터

    @SerializedName("prfcast")
    private String concertMembers; // 출연진
    
    @SerializedName("prfage")
    private String ageLimit; // 공연관람연령
}
