package com.cafe24.bitmall.dao;

import java.util.HashMap;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.cafe24.bitmall.vo.UserVo;

@Repository("userDao")
public class UserDao {
	
	@Autowired
	SqlSession sqlSession;
	
	public boolean insertUser(UserVo user) {
		
		int count = sqlSession.insert("user.insert", user);
		
		return count == 1;		
	}
	
	public UserVo selectAuthUser(UserVo user) {
		
		UserVo authUser = sqlSession.selectOne("user.selectAuthUser", user);
		
		return authUser;
	}
	
	public boolean updateUserInfo(Map<String, Object> map) {
		int count = sqlSession.update("user.updateUserInfo", map);
		
		return count == 1;		
	}
	
	public UserVo selectUserForCheckPassword(Map<String, Object> map) {		
		UserVo result = sqlSession.selectOne("user.selectUserForCheckPassword", map);
		
		return result;
	}

}
