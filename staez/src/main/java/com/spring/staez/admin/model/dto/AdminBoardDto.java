package com.spring.staez.admin.model.dto;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@ToString
public class AdminBoardDto {
	private String boardTitle;
	private String boardContent;
	private int categoryNo;
	private int boardNo;
}
