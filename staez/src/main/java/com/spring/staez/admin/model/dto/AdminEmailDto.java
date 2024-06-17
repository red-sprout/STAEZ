package com.spring.staez.admin.model.dto;

import java.util.List;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class AdminEmailDto {
	private List<String> emailList;
	private String title;
	private String content;
}
