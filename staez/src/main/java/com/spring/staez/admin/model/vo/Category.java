package com.spring.staez.admin.model.vo;

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
public class Category {
	private int	categoryNoo; //카테고리번호
	private int refCategoryNo; //상위카테고리번호
	private String categoryName; //카테고리이름
	private int categoryLevel; //카테고리레벨
}
