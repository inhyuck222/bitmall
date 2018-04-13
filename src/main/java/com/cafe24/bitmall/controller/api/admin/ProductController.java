package com.cafe24.bitmall.controller.api.admin;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.cafe24.bitmall.dto.JSONResult;
import com.cafe24.bitmall.service.admin.ProductService;
import com.cafe24.bitmall.vo.ProductVo;

@Controller("apiAdminProductController")
@RequestMapping("api/admin/product")
public class ProductController {
	
	@Autowired
	@Qualifier("adminProductService")
	ProductService productService;
	
	@ResponseBody
	@RequestMapping(value="/delete", method=RequestMethod.GET)
	public JSONResult deleteProduct(@ModelAttribute ProductVo productForDelete) {
		boolean result = productService.deleteProduct(productForDelete);
		if(result == false) {
			return JSONResult.fail("fail delete product");	
		}
		
		return JSONResult.success("succes delete");
	}
	

}
