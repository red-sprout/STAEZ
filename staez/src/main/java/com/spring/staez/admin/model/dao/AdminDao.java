package com.spring.staez.admin.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.spring.staez.community.model.vo.Board;

@Repository
public class AdminDao {

	public int faqIncert(SqlSessionTemplate sqlSession, Board b) {
		return sqlSession.insert("admin-mapper", b);
	}

}
