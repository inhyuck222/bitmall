package com.cafe24.bitmall.controller.admin;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller("adminUserController")
@RequestMapping("/admin")
public class AdminUserController {
	
	@RequestMapping(value="/login", method=RequestMethod.GET)
	public String login() {
		
		return "admin/login";
	}
	
}
