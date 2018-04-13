package com.cafe24.bitmall.service.admin;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.cafe24.bitmall.dao.admin.ProductDao;
import com.cafe24.bitmall.service.FileUploadService;
import com.cafe24.bitmall.vo.ProductVo;

@Service("adminProductService")
public class ProductService {
	
	@Autowired
	@Qualifier("adminProductDao")
	ProductDao productDao;
	
	@Autowired
	FileUploadService fileUploadService;
	
	@Autowired
	@Qualifier("adminStockService")
	StockService stockService;
	
	public List<Map<String, Object>> getAllProduct(){
		
		List<Map<String, Object>> productMapList = productDao.selectAllProducts();
		
		return productMapList;		
	}
	
	public boolean registProduct(ProductVo product, MultipartFile pictureFile) {
		String picturePath = fileUploadService.restore(pictureFile);
		if("".equals(picturePath)) {
			return false;
		}
		product.setPicturePath(picturePath);
		
		boolean result = productDao.insertProduct(product);
		if(product.getNo() == null) {
			result = false;
		}
		
		return result;
	}
	
	public boolean deleteProduct(ProductVo productForDelete) {
		boolean result = stockService.deleteAllByProductNo(productForDelete);
		if(result == false) {
			return false;
		}
	
		result = productDao.deleteProduct(productForDelete);
		
		return result;
	}

}
