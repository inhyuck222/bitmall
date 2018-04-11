package com.cafe24.bitmall.controller.admin;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.cafe24.bitmall.service.admin.CategoryService;
import com.cafe24.bitmall.vo.CategoryVo;

@Controller("adminCategoryController")
@RequestMapping("/admin/category")
public class CategoryController {
	
	@Autowired
	@Qualifier("adminCategoryService")
	CategoryService categoryService;
	
	@RequestMapping("")
	public String getAllCategory(Model model) {
		
		List<CategoryVo> categoryList = categoryService.getAllCategory();
		
		model.addAttribute("categoryList", categoryList);
		
		return "/admin/category/category_list";
	}	

}
