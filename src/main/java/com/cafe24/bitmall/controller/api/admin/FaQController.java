package com.cafe24.bitmall.controller.api.admin;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.cafe24.bitmall.dto.JSONResult;
import com.cafe24.bitmall.service.admin.FaQService;
import com.cafe24.bitmall.vo.FaQVo;
import com.cafe24.security.Auth;
import com.cafe24.security.Auth.Role;

@Controller("apiAdminFaQController")
@RequestMapping("/api/admin/faq")
public class FaQController {
	
	@Autowired
	FaQService faqService;
	
	@Auth(role=Role.ADMIN)
	@ResponseBody
	@RequestMapping(value="/add", method=RequestMethod.POST)
	public JSONResult addNewFaQ(@RequestBody FaQVo newFaQVo) {
		FaQVo faqVoAdded = faqService.addNewFaQ(newFaQVo);
		
		if(faqVoAdded == null) {
			return JSONResult.fail("fail to add new FaQ");
		}
		
		return JSONResult.success(newFaQVo);		
	}
	
	@Auth(role=Role.ADMIN)
	@ResponseBody
	@RequestMapping(value="/update", method=RequestMethod.POST)
	public JSONResult updateFaQ(@RequestBody FaQVo faQVo) {
		boolean result = faqService.updateFaQ(faQVo);
		
		if(result == false) {
			return JSONResult.fail("fail to update the FaQ");
		}
		
		return JSONResult.success(result);
	}
	
	@Auth(role=Role.ADMIN)
	@ResponseBody
	@RequestMapping(value="/delete", method=RequestMethod.GET)
	public JSONResult deleteFaQ(@ModelAttribute FaQVo faQVo) {
		boolean result = faqService.deleteFaQ(faQVo);
		
		if(result == false) {
			return JSONResult.fail("fail to update the FaQ");
		}
		
		return JSONResult.success(result);
	}

}
