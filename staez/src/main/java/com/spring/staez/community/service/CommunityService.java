package com.spring.staez.community.service;

import java.util.ArrayList;

import com.spring.staez.admin.model.vo.Category;
import com.spring.staez.community.model.dto.CategoryDto;
import com.spring.staez.community.model.dto.CommunityDto;
import com.spring.staez.community.model.vo.Board;
import com.spring.staez.concert.model.vo.Concert;

public interface CommunityService {

	ArrayList<Category> selectCategory(Category c);

	ArrayList<Concert> selectConcertList(String keyword);

	int insertBoard(CommunityDto communityDto);

	ArrayList<Board> selectBoard(CategoryDto categoryDto);

	ArrayList<Board> selectBoard();

	ArrayList<Category> selectCategory(int boardNo);

	Board boardDetail(int boardNo);

}
