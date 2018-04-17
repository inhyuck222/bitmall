package com.cafe24.bitmall.controller.admin;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.cafe24.bitmall.service.admin.CategoryService;
import com.cafe24.bitmall.service.admin.ProductService;
import com.cafe24.bitmall.service.admin.StockService;
import com.cafe24.bitmall.vo.CategoryVo;
import com.cafe24.bitmall.vo.ProductVo;
import com.cafe24.security.Auth;
import com.cafe24.security.Auth.Role;

@Controller("adminProductController")
@RequestMapping("/admin/product")
public class ProductController {
	
	@Autowired
	@Qualifier("adminProductService")
	ProductService productService;
	
	@Autowired
	@Qualifier("adminCategoryService")
	CategoryService categoryService;

	@Autowired
	@Qualifier("adminStockService")
	StockService stockService;
	
	@Auth(role=Role.ADMIN)
	@RequestMapping(value="", method=RequestMethod.GET)
	public String productMain(Model model) {
		
		List<Map<String, Object>> productMapList = productService.getAllProduct();
		model.addAttribute("productMapList", productMapList);
		
		return "admin/product/product_list";
	}
	
	@Auth(role=Role.ADMIN)
	@RequestMapping(value="/add", method=RequestMethod.GET)
	public String addProduct(Model model) {
		
		List<CategoryVo> categoryList = categoryService.getAllCategory();
		model.addAttribute("categoryList", categoryList);
		
		return "admin/product/product_new";
	}
	
	@Auth(role=Role.ADMIN)
	@RequestMapping(value="/add", method=RequestMethod.POST)
	public String addProduct(
			Model model, 
			@ModelAttribute ProductVo product, 
			@RequestParam("size") String[] size, 
			@RequestParam("quantity") Long[] quantity, 
			@RequestParam("picture") MultipartFile pictureFile) {
		
		boolean result = productService.registProduct(product, pictureFile);
		if(result == false) {
			return "redirect:/admin/product/add";
		}
		
		result = stockService.insertStock(product, size, quantity);
		if(result == false) {
			return "redirect:/admin/product/add";
		}
		
		return "redirect:/admin/product/";
	}

}
