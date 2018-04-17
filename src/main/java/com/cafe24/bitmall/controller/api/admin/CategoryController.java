package com.cafe24.bitmall.controller.api.admin;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.cafe24.bitmall.dto.JSONResult;
import com.cafe24.bitmall.service.admin.CategoryService;
import com.cafe24.bitmall.vo.CategoryVo;
import com.cafe24.security.Auth;
import com.cafe24.security.Auth.Role;

@Controller("apiAdminCategoryController")
@RequestMapping("api/admin/category")
public class CategoryController {
	
	@Autowired
	@Qualifier("adminCategoryService")
	CategoryService categoryService;
	
	@Auth(role=Role.ADMIN)
	@ResponseBody
	@RequestMapping(value="/add", method=RequestMethod.POST)
	public JSONResult addCategory(@RequestBody CategoryVo newCategoryVo) {
		
		boolean result = categoryService.addCategory(newCategoryVo);
		if(result == false) {
			return JSONResult.fail("fail while adding new category");
		}
		
		return JSONResult.success(newCategoryVo);
	}
	
	@Auth(role=Role.ADMIN)
	@ResponseBody
	@RequestMapping(value="/update", method=RequestMethod.POST)
	public JSONResult updateCategory(@RequestBody CategoryVo categoryVo) {
		boolean result = categoryService.updateCategory(categoryVo);
		
		if(result == false) {
			return JSONResult.fail("fail while adding new category");
		}
		
		return JSONResult.success(categoryVo);
	}
	
	@Auth(role=Role.ADMIN)
	@ResponseBody
	@RequestMapping(value="/delete", method=RequestMethod.GET)
	public JSONResult deleteCategory(@ModelAttribute CategoryVo categoryVo) {
		
		boolean result = categoryService.deleteCategory(categoryVo);
		
		if(result == false) {
			return JSONResult.fail("fail while delete new category");
		}
		
		return JSONResult.success(categoryVo);
	}

}

