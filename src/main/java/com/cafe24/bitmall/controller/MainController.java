	package com.cafe24.bitmall.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.cafe24.bitmall.service.ProductService;
import com.cafe24.bitmall.vo.ProductVo;

@Controller
public class MainController {
	
	@Autowired
	@Qualifier("productService")
	ProductService productService;
	
	@RequestMapping( "" )
	public String index(Model model) {
		
		List<ProductVo> productList = productService.getAllProducts();

		model.addAttribute("productList", productList);
		
		return "main/index";
	}	
}
