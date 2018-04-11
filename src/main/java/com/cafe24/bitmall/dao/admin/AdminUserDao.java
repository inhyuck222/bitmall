package com.cafe24.bitmall.dao.admin;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.cafe24.bitmall.vo.UserVo;

@Repository
public class AdminUserDao {
	
	@Autowired
	SqlSession sqlSession;
	
	public UserVo selectAdminUser(UserVo user) {
		
		UserVo adminUser = sqlSession.selectOne("adminUser.selectByIdAndPassword", user);
		
		return adminUser;
	}

}
