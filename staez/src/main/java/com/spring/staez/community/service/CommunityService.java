package com.spring.staez.community.service;

import java.util.ArrayList;

import com.spring.staez.admin.model.vo.Category;
import com.spring.staez.concert.model.vo.Concert;

public interface CommunityService {

	ArrayList<Category> selectCategory(Category c);

	ArrayList<Concert> selectConcertList(String keyword);

}
