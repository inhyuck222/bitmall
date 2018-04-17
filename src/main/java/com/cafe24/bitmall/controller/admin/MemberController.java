package com.cafe24.bitmall.controller.admin;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.cafe24.bitmall.service.admin.MemberService;
import com.cafe24.bitmall.vo.UserVo;
import com.cafe24.security.Auth;
import com.cafe24.security.Auth.Role;

@Controller("adminMemberController")
@RequestMapping("/admin/member")
public class MemberController {
	
	@Autowired
	@Qualifier("adminMemberService")
	MemberService memberService;

	@Auth(role=Role.ADMIN)
	@RequestMapping(value="", method=RequestMethod.GET)
	public String showMemberList(Model model) {
		List<UserVo> memberList = memberService.getMemberList();
		
		model.addAttribute("memberList", memberList);
		
		return "admin/member/member";
	}

}
