package com.cafe24.bitmall.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.cafe24.bitmall.vo.CategoryVo;

@Repository("categoryDao")
public class CategoryDao {

	@Autowired
	SqlSession sqlSession;
	
	public List<CategoryVo> selectCategoryList() {
		List<CategoryVo> categoryList = sqlSession.selectList("userCategory.selectCategoryList");
		
		return categoryList;
	}
	
}
