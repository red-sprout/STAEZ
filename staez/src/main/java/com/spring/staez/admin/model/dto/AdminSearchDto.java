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
public class AdminSearchDto {
	private String select; // 검색 항목
	private String keyword; // 검색 키워드
	private List<Integer> categoryList; // 카테고리 번호
}
