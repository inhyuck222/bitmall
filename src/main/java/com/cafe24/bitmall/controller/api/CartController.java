package com.cafe24.bitmall.controller.api;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.cafe24.bitmall.dto.JSONResult;
import com.cafe24.bitmall.service.CartService;
import com.cafe24.bitmall.service.StockService;
import com.cafe24.bitmall.vo.CartVo;

@Controller("apiCartController")
@RequestMapping("/api/cart")
public class CartController {
	
	@Autowired
	@Qualifier("cartService")
	CartService cartService;
	
	@Autowired
	@Qualifier("stockService")
	StockService stockService;
	
	@ResponseBody
	@RequestMapping(value="/delete", method=RequestMethod.POST)
	public JSONResult deleteCartItem(@RequestBody CartVo cart) {
		
		boolean result = stockService.updateStockQuantityFromCart(cart);
		
		if(result == false) {
			return JSONResult.fail("fail update stock");
		}
				
		result = cartService.deleteCartItem(cart);
		if(result == false) {
			return JSONResult.fail("fail delete cart");
		}
		
		return JSONResult.success(null);
	}

}
