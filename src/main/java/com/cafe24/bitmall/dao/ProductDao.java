package com.cafe24.bitmall.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.cafe24.bitmall.vo.ProductVo;

@Repository("productDao")
public class ProductDao {

	@Autowired
	SqlSession sqlSession;
	
	public List<ProductVo> selectAllProduct() {
		
		List<ProductVo> productList = sqlSession.selectList("userProduct.selectAllProduct");
		
		return productList;
	}
	
	public ProductVo selectTheProduct(Long productNo) {
		ProductVo product = sqlSession.selectOne("userProduct.selectTheProduct", productNo);
		
		return product;
	}
	
	public List<ProductVo> selectProductListByCategoryNo(Long categoryNo) {
		List<ProductVo> productList = sqlSession.selectList("userProduct.selectProductListByCategoryNo", categoryNo);
		
		return productList;
	}
	
}
