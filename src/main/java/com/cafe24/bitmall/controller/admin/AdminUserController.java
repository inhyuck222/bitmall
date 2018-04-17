package com.cafe24.bitmall.controller.admin;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.cafe24.bitmall.vo.UserVo;
import com.cafe24.security.AdminUser;

@Controller("adminUserController")
@RequestMapping("/admin")
public class AdminUserController {
	
	@RequestMapping(value= {"", "/login"}, method=RequestMethod.GET)
	public String login(@AdminUser UserVo adminUser) {
		
		if(adminUser != null) {
			return "redirect:admin/product";
		}
		
		return "admin/login";
	}
	
}
