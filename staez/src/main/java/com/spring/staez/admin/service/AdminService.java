package com.spring.staez.admin.service;

import java.util.ArrayList;

import com.spring.staez.admin.model.vo.Category;
import com.spring.staez.community.model.vo.Board;

public interface AdminService {

	int faqIncert(Board b, int categoryNo);

	ArrayList<Category> selectFaqCategory(int refCategoryNo);

}
