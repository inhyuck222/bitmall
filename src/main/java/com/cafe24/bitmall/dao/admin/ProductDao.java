package com.cafe24.bitmall.dao.admin;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository("adminProductDao")
public class ProductDao {
	
	@Autowired
	SqlSession sqlSession;
	
	public List<Map<String, Object>> selectAllProducts() {
		
		List<Map<String, Object>> productMapList = sqlSession.selectList("adminProduct.selectAllProduct");
		
		return productMapList;
	}

}
