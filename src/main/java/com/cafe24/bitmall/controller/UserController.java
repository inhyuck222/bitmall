package com.cafe24.bitmall.controller;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.cafe24.bitmall.service.UserService;
import com.cafe24.bitmall.vo.UserVo;
import com.cafe24.security.Auth;
import com.cafe24.security.AuthUser;

@Controller("userController")
@RequestMapping("/user")
public class UserController {

	@Autowired
	@Qualifier("userService")
	UserService userService;
	
	@RequestMapping(value="/join", method=RequestMethod.GET)
	public String join(UserVo user) {
		
		return "/user/user_join";
	}
	
	@RequestMapping(value="/join", method=RequestMethod.POST)
	public String join(
			@Valid UserVo user, 
			BindingResult bindingResult, 
			@RequestParam("passwordConfirm") String confirmPassword
			) {
		if(bindingResult.hasErrors()) {
			return "/user/user_join";
		}
		
		boolean result = userService.join(user, confirmPassword);
		if(result == false) {
			return "/user/user_join";
		}
		
		return "redirect:joinsuccess";
	}
	
	@RequestMapping(value="/joinsuccess", method=RequestMethod.GET)
	public String joinSuccess() {
		
		return "user/user_join_success";
	}
	
	@RequestMapping(value="/login", method=RequestMethod.GET)
	public String login(@ModelAttribute UserVo userVo) {
		
		return "user/user_login";
	}
	
	@Auth(role=Auth.Role.USER)
	@RequestMapping(value="/modify", method=RequestMethod.GET)
	public String modify(@AuthUser UserVo authUser, @ModelAttribute UserVo userVo) {

		userVo.setEmail(authUser.getEmail());
		return "user/user_modify";
	}
	
	@Auth(role=Auth.Role.USER)
	@RequestMapping(value="/modify", method=RequestMethod.POST)
	public String modify(
			@ModelAttribute @Valid UserVo userModified, 
			BindingResult bindingResult, 
			@AuthUser UserVo authUser, 
			@RequestParam("newPassword") String newPassword) {
		
		if(bindingResult.hasErrors()) {
			return "user/user_modify";
		}
		
		boolean result = userService.checkPassword(userModified, authUser);
		if(result == false) {
			return "redirect:/modify";
		}		

		result = userService.modifyUserInfo(userModified, authUser, newPassword);
		
		if(result == false) {
			return "redirect:/modify";
		}
		
		return "redirect:/";
	}
	
}
