package com.spring.staez.admin.model.dto;

import java.util.List;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class AdminUpdateDto {
	private List<Integer> reserveList;
	private String reserveStatus;
}
