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
public class AdminUserSearchDto {
	private String select; // 검색 항목
	private String keyword; // 검색 키워드
}
