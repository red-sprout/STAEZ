package com.spring.staez.admin.model.dto;

import java.util.List;

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
public class AdminBoardSelectDto {
	private List<Integer> boardList;
	private int categoryNo;
	private int categoryLevel;
}
