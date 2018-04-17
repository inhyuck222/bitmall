package com.cafe24.bitmall.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.cafe24.bitmall.service.ProductService;
import com.cafe24.bitmall.vo.ProductVo;

@Controller("categoryController")
@RequestMapping(value = "/category")
public class CategoryController {
	
	@Autowired
	@Qualifier("productService")
	ProductService productService;
	
	@RequestMapping(value = "/{categoryNo:(?!assets).*}")	
	public String showProductByCategory(Model model, @PathVariable(value="categoryNo") Long categoryNo) {
		
		List<ProductVo> productList = productService.getProductListByCategoryNo(categoryNo);

		model.addAttribute("productList", productList);		
		
		return "/category/category_product_list";
	}

}
