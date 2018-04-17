package com.cafe24.bitmall.controller.api;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.cafe24.bitmall.dto.JSONResult;
import com.cafe24.bitmall.service.CategoryService;
import com.cafe24.bitmall.vo.CategoryVo;

@Controller("apiCategoryController")
@RequestMapping("/api/category")
public class CategoryController {
	
	@Autowired
	@Qualifier("categoryService")
	CategoryService categoryService;
	
	@ResponseBody
	@RequestMapping("/list")
	public JSONResult getCategoryList() {
		List<CategoryVo> categoryList = categoryService.getCategoryList();
				
		return JSONResult.success(categoryList);
	}

}