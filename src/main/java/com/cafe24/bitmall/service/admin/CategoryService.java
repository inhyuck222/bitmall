package com.cafe24.bitmall.service.admin;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.cafe24.bitmall.dao.admin.CategoryDao;
import com.cafe24.bitmall.vo.CategoryVo;

@Service("adminCategoryService")
public class CategoryService {
	
	@Autowired
	@Qualifier("adminCategoryDao")
	CategoryDao categoryDao;
	
	public List<CategoryVo> getAllCategory(){
		
		List<CategoryVo> categoryList = categoryDao.selectAllCategory();
		
		return categoryList;
	}
	
	public boolean addCategory(CategoryVo newCategoryVo) {
		boolean result = categoryDao.insertCategory(newCategoryVo);
		if(newCategoryVo.getNo() == null) {
			result = false;
		}
		
		return result;
	}
	
	public boolean updateCategory(CategoryVo categoryVo) {
		boolean result = categoryDao.updateCategory(categoryVo);
		
		return result;
	}
	
	public boolean deleteCategory(CategoryVo categoryVo) {
		boolean result = categoryDao.deleteCategory(categoryVo);
		
		return result;
	}

}
