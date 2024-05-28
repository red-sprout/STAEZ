package com.spring.staez.community.model.dto;

import java.util.List;

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
public class CommunityDto {
	private int userNo;
	private String boardTitle;
	private List<Integer> categoryNo;
	private int concertNo;
	private String boardContent;
}
