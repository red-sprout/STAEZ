package com.spring.staez.others.service;

import java.util.ArrayList;

import com.spring.staez.admin.model.vo.Category;
import com.spring.staez.concert.model.vo.Concert;

public interface OthersService {
	
	ArrayList<Category> selectCategory();
	
	ArrayList<Concert> selectCategoryConcert(int cNo);
}
