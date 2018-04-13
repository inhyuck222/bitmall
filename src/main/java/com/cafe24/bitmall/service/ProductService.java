package com.cafe24.bitmall.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.cafe24.bitmall.dao.ProductDao;
import com.cafe24.bitmall.vo.ProductVo;

@Service("productService")
public class ProductService {
	
	@Autowired
	@Qualifier("productDao")
	ProductDao productDao;
	
	public List<ProductVo> getAllProducts() {
		
		List<ProductVo> productList = productDao.selectAllProduct();
		
		return productList;
	}

}
