package com.cafe24.bitmall.controller.admin;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.cafe24.bitmall.service.admin.FaQService;
import com.cafe24.bitmall.vo.FaQVo;

@Controller("adminFaQController")
@RequestMapping("/admin/faq")
public class FaQController {
	
	@Autowired
	@Qualifier("adminFaQService")
	FaQService faqService;
	
	@RequestMapping(value="", method=RequestMethod.GET)
	public String faqMain(Model model) {
		
		List<FaQVo> faqList = faqService.getAllFaQList();
		model.addAttribute("faqList", faqList);
		
		return "admin/faq/faq_list";
	}

}
