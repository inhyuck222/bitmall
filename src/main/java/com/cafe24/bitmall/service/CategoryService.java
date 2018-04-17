package com.cafe24.bitmall.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.cafe24.bitmall.dao.CategoryDao;
import com.cafe24.bitmall.vo.CategoryVo;

@Service("categoryService")
public class CategoryService {
	
	@Autowired
	@Qualifier("categoryDao")
	CategoryDao categoryDao;
	
	public List<CategoryVo> getCategoryList() {
		List<CategoryVo> categoryList = categoryDao.selectCategoryList();
		
		return categoryList;		
	}

}
