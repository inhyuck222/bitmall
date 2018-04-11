package com.cafe24.bitmall.dao.admin;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.cafe24.bitmall.vo.CategoryVo;

@Repository("adminCategoryDao")
public class CategoryDao {
	
	@Autowired
	SqlSession sqlSession;
	
	public List<CategoryVo> selectAllCategory(){
		
		List<CategoryVo> categoryList = sqlSession.selectList("adminCategory.selectAllCategory");
		
		return categoryList;
	}
	
	public boolean insertCategory(CategoryVo newCategoryVo) {
		int count = sqlSession.insert("adminCategory.insertCategory", newCategoryVo);
		
		return count == 1;
	}
	
	public boolean updateCategory(CategoryVo categoryVo) {
		int count = sqlSession.update("adminCategory.updateCategory", categoryVo);
		
		return count == 1;
	}
	
	public boolean deleteCategory(CategoryVo categoryVo) {
		int count = sqlSession.delete("adminCategory.deleteCategory", categoryVo);
		
		return count == 1;
	}

}
