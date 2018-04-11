package com.cafe24.bitmall.dao.admin;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.cafe24.bitmall.vo.AuthVo;
import com.cafe24.bitmall.vo.UserVo;

@Repository
public class AuthDao {
	
	@Autowired
	SqlSession sqlSession;
	
	public AuthVo selectAuth(UserVo user) {
		AuthVo auth = sqlSession.selectOne("auth.selectByUserNo", user);
		
		return auth;
	}

}
