package com.cafe24.bitmall.controller.api;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.cafe24.bitmall.dto.CartUpdateInfoDto;
import com.cafe24.bitmall.dto.JSONResult;
import com.cafe24.bitmall.service.CartService;
import com.cafe24.bitmall.service.ProductService;
import com.cafe24.bitmall.service.StockService;
import com.cafe24.bitmall.vo.CartVo;
import com.cafe24.bitmall.vo.ProductVo;
import com.cafe24.bitmall.vo.StockVo;
import com.cafe24.security.Auth;
import com.cafe24.security.Auth.Role;

@Controller("apiCartController")
@RequestMapping("/api/cart")
public class CartController {
	
	@Autowired
	@Qualifier("cartService")
	CartService cartService;
	
	@Autowired
	@Qualifier("stockService")
	StockService stockService;
	
	@Autowired
	@Qualifier("productService")
	ProductService productService;

	@Auth(role=Role.USER)
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

	@Auth(role=Role.USER)
	@ResponseBody
	@RequestMapping(value="/update", method=RequestMethod.POST)
	public JSONResult updateCartItemQuantity(@RequestBody CartUpdateInfoDto cartUpdateInfo) {
		boolean result = false;
		CartVo cart = cartUpdateInfo.getCart();
		StockVo stock = stockService.checkStockQuantity(cartUpdateInfo);		
		if(stock == null) {		
			return JSONResult.fail("fail update stock : checkStockQuantity");	
		}
		
		Long originQuantity = cartUpdateInfo.getOriginQuantity();
		Long newQuantity = cartUpdateInfo.getCart().getQuantity();
		stock.setQuantity(originQuantity - newQuantity);
		result = stockService.updateStockQuantityFromCartForUpdating(stock);
		if(result == false) {
			return JSONResult.fail("fail update stock : updateStockQuantityFromCartForUpdating");
		}
		
		ProductVo product = productService.getProduct(cart.getProductNo());
		stock.setQuantity(newQuantity);
		result = cartService.updateQuantityInCart(cart, stock, product);
		if(result == false) {
			return JSONResult.fail("fail update stock : updateQuantityInCart");
		}
		
		return JSONResult.success(cart);		
	}

}
