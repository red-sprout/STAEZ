package com.spring.staez.admin.model.dto;

import java.util.List;

import com.spring.staez.user.model.vo.User;

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
public class AdminUserSelectDto {
	private List<Integer> userList;
	private int grade;
}
