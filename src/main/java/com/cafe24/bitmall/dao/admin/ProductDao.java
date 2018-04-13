package com.cafe24.bitmall.dao.admin;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.cafe24.bitmall.vo.ProductVo;

@Repository("adminProductDao")
public class ProductDao {
	
	@Autowired
	SqlSession sqlSession;
	
	public List<Map<String, Object>> selectAllProducts() {
		
		List<Map<String, Object>> productMapList = sqlSession.selectList("adminProduct.selectAllProduct");
		
		return productMapList;
	}
	
	public boolean insertProduct(ProductVo product) {
		int count = sqlSession.insert("adminProduct.insertNewProduct", product);
		
		return count == 1;
	}
	
	public boolean deleteProduct(ProductVo productForDelete) {
		int count = sqlSession.delete("adminProduct.deleteProductByNo", productForDelete);
		
		return count == 1;
	}

}
