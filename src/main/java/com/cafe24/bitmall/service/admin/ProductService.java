package com.cafe24.bitmall.service.admin;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.cafe24.bitmall.dao.admin.ProductDao;

@Service("adminProductService")
public class ProductService {
	
	@Autowired
	@Qualifier("adminProductDao")
	ProductDao productDao;
	
	public List<Map<String, Object>> getAllProduct(){
		
		List<Map<String, Object>> productMapList = productDao.selectAllProducts();
		
		return productMapList;		
	}

}
