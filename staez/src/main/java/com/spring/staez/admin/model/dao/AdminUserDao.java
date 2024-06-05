package com.spring.staez.admin.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.spring.staez.admin.model.dto.AdminUserSearchDto;
import com.spring.staez.admin.model.dto.AdminUserSelectDto;
import com.spring.staez.common.model.vo.PageInfo;
import com.spring.staez.user.model.vo.User;

@Repository
public class AdminUserDao {

	public int selectUserCnt(SqlSessionTemplate sqlSession, AdminUserSearchDto dto) {
		return sqlSession.selectOne("adminMapper.selectUserCnt", dto);
	}

	public ArrayList<User> selectUser(SqlSessionTemplate sqlSession, AdminUserSearchDto dto, PageInfo pi) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		int limit = pi.getBoardLimit();
		
		RowBounds rowBounds = new RowBounds(offset, limit);
		return (ArrayList)sqlSession.selectList("adminMapper.selectUser", dto, rowBounds);
	}

	public int deleteUser(SqlSessionTemplate sqlSession, AdminUserSelectDto dto) {
		return sqlSession.update("adminMapper.deleterUser", dto);
	}

	public int updateGradeUser(SqlSessionTemplate sqlSession, AdminUserSelectDto dto) {
		return sqlSession.update("adminMapper.updateGradeUser", dto);
	}
	
}
