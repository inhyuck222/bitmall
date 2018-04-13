package com.cafe24.bitmall.controller;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.cafe24.bitmall.service.ProductService;
import com.cafe24.bitmall.service.StockService;
import com.cafe24.bitmall.vo.ProductVo;
import com.cafe24.bitmall.vo.StockVo;

@Controller("productController")
@RequestMapping(value = "/product/{categoryNo:(?!assets).*}")
public class ProductController {
	
	@Autowired
	@Qualifier("productService")
	ProductService productService;
	
	@Autowired
	@Qualifier("stockService")
	StockService stockService;
	
	
	@RequestMapping("/{productNo:(?!images).*}")
	public String showProductDetail(
			Model model, 
			@PathVariable(value="categoryNo") Long categoryNo,  
			@PathVariable(value="productNo") Optional<Long> productNo) {
		
		if(productNo.isPresent() == false) {
			return "/";
		}
		
		Long no = productNo.get();
		ProductVo product = productService.getProduct(no);
		if(product == null) {
			return "/";
		}
				
		List<StockVo> stockList = stockService.getAllStockByProductNo(no);
				
		model.addAttribute("stockList", stockList);
		model.addAttribute("product", product);
		
		return "product/product_detail";
	}

}
