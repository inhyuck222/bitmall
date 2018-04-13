package com.cafe24.bitmall.service;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.cafe24.bitmall.dao.UserDao;
import com.cafe24.bitmall.vo.UserVo;

@Service("userService")
public class UserService {
	
	@Autowired
	@Qualifier("userDao")
	UserDao userDao;
	
	public boolean join(UserVo user, String confirmPassword) {
		if(confirmPassword == null) {
			return false;
		}			
		if(user.getPassword().equals(confirmPassword) == false) {
			return false;
		}
		
		boolean result = userDao.insertUser(user);
		
		return result;		
	}
	
	public UserVo login(UserVo user) {
		UserVo authUser = userDao.selectAuthUser(user);
		
		return authUser;
	}
	
	public boolean modifyUserInfo(UserVo userModified, UserVo authUser, String newPassword) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("no", authUser.getNo());
		map.put("name", userModified.getName());
		map.put("password", newPassword);
		map.put("phone", userModified.getPhone());
		map.put("address", userModified.getAddress());		
		boolean result = userDao.updateUserInfo(map);
		
		return result;
	}
	
	public boolean checkPassword(UserVo userModified, UserVo authUser) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("no", authUser.getNo());
		map.put("password", userModified.getPassword());
		
		UserVo result = userDao.selectUserForCheckPassword(map);
		
		if(result == null) {
			return false;
		}
		
		return true;
	}
}
