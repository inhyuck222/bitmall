package com.cafe24.bitmall.controller;

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

import com.cafe24.bitmall.service.CartService;
import com.cafe24.bitmall.service.ProductService;
import com.cafe24.bitmall.service.StockService;
import com.cafe24.bitmall.vo.CartVo;
import com.cafe24.bitmall.vo.ProductVo;
import com.cafe24.bitmall.vo.StockVo;
import com.cafe24.bitmall.vo.UserVo;
import com.cafe24.security.Auth;
import com.cafe24.security.Auth.Role;
import com.cafe24.security.AuthUser;

@Controller("cartController")
@RequestMapping("/cart")
public class CartController {
	
	@Autowired
	@Qualifier("cartService")
	CartService cartService;
	
	@Autowired
	@Qualifier("productService")
	ProductService productService;
	
	@Autowired
	@Qualifier("stockService")
	StockService stockService;
	
	@Auth(role=Role.USER)
	@RequestMapping(value="/add", method=RequestMethod.POST)
	public String add(
			Model model, 
			@AuthUser UserVo authUser, 
			@RequestParam("productNo") Long productNo, 
			@RequestParam("stockNo") Long stockNo, 
			@RequestParam("productQuantity") Long productQuantity) {
				
		ProductVo product = productService.getProduct(productNo);
		if(product == null) {
			return "redirect:/";
		}
		
		StockVo stock = stockService.getStock(stockNo);
		if(stock == null) {
			return "redirect:/";
		}
		if(stock.getQuantity() - productQuantity < 0) {
			//재고 부족
			return "redirect:/";
		}
		
		Long amount = productQuantity * product.getPrice();
		CartVo cartVo = cartService.addNewCart(authUser, product, stock, amount, productQuantity);
		if(cartVo == null) {
			//등록 실패
			return "redirect:/";
		}
		
		stock.setQuantity(stock.getQuantity() - productQuantity);
		boolean result = stockService.updateStockQuantity(stock);
		if(result == false) {
			//재고 수정 실패
			return "redirect:/";
		}
		
		return "redirect:list";		
	}

	@Auth(role=Role.USER)
	@RequestMapping(value="/list", method=RequestMethod.GET)
	public String showCartList(Model model, @AuthUser UserVo authUser) {
		
		List<Map<String, Object>> cartInfoList = cartService.getAllCartByUserNo(authUser);
		
		model.addAttribute("cartInfoList", cartInfoList);
		
		return "cart/cart_list";		
	}
	
	

}
