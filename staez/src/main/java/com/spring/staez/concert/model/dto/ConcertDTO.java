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
	
    @SerializedName("prfnm")
    private String concertTitle; //공연명

    @SerializedName("prfpdfrom")
    private String startDate; //시작날짜

    @SerializedName("prfpdto")
    private String endDate; //종료날짜

    @SerializedName("fcltynm")
    private String theaterName; //공영장명

    @SerializedName("poster")
    private String filePath; //파일경로

    @SerializedName("prfstate")
    private String concertStatus; //공연상태

}
