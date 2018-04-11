package com.cafe24.bitmall.service.admin;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cafe24.bitmall.dao.admin.AdminUserDao;
import com.cafe24.bitmall.dao.admin.AuthDao;
import com.cafe24.bitmall.vo.AuthVo;
import com.cafe24.bitmall.vo.UserVo;

@Service
public class AdminUserService {
	
	@Autowired
	AdminUserDao adminUserDao;
	
	@Autowired
	AuthDao authDao;
	
	public UserVo adminUserLogin(UserVo user) {
		UserVo adminUser = adminUserDao.selectAdminUser(user);
		if(adminUser == null) {
			return null;
		}
		
		AuthVo auth = authDao.selectAuth(adminUser);
		if(auth == null) {
			return null;
		}
		
		return adminUser;
	}

}
