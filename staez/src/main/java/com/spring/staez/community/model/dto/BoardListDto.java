package com.spring.staez.community.model.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@AllArgsConstructor
@NoArgsConstructor
@Builder
@Getter
@Setter
@ToString
public class BoardListDto {
	private String userId; //작성자
	private int boardNo;
	private String boardTitle;
	private String boardWriteDate;
	private int boardCount;
	private int likeCount;
	
}
