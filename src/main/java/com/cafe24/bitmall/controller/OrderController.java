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

import com.cafe24.bitmall.dto.OrderProductInfoDto;
import com.cafe24.bitmall.service.CartService;
import com.cafe24.bitmall.service.OrderProdcutService;
import com.cafe24.bitmall.service.OrderService;
import com.cafe24.bitmall.vo.OrderVo;
import com.cafe24.bitmall.vo.UserVo;
import com.cafe24.security.Auth;
import com.cafe24.security.AuthUser;
import com.cafe24.security.Auth.Role;

@Controller("orderController")
@RequestMapping("/order")
public class OrderController {
	
	@Autowired
	@Qualifier("orderService")
	OrderService orderService;
	
	@Autowired
	@Qualifier("orderProductService")
	OrderProdcutService orderProdcutService;
	
	@Autowired
	@Qualifier("cartService")
	CartService cartService;

	@Auth(role=Role.USER)
	@RequestMapping(value="", method=RequestMethod.GET)
	public String order(@ModelAttribute UserVo orderUser, @AuthUser UserVo authUser, Model model) {
		
		List<Map<String, Object>> cartInfoList = cartService.getAllCartByUserNo(authUser);		
		model.addAttribute("cartInfoList", cartInfoList);
		
		return "order/order";
	}

	@Auth(role=Role.USER)
	@RequestMapping(value="/pay", method=RequestMethod.POST)
	public String pay(
			Model model, 
			@ModelAttribute OrderVo orderVo, 
			@AuthUser UserVo authUser, 
			@ModelAttribute UserVo orderUser) {
		
		orderUser.setNo(authUser.getNo());
		model.addAttribute("orderUser", orderUser);
		model.addAttribute("orderVo", orderVo);
		
		List<Map<String, Object>> cartInfoList = cartService.getAllCartByUserNo(authUser);		
		model.addAttribute("cartInfoList", cartInfoList);
		
		return "order/order_pay";
	}

	@Auth(role=Role.USER)
	@RequestMapping(value="/success", method=RequestMethod.POST)
	public String orderSuccess(Model model, @ModelAttribute OrderVo orderVo, @AuthUser UserVo authUser, @ModelAttribute UserVo orderUser) {

		orderVo.setUserNo(authUser.getNo());
		orderVo.setStatus("주문 완료");
		
		List<Map<String, Object>> cartInfoList = cartService.getAllCartByUserNo(authUser);		
		model.addAttribute("cartInfoList", cartInfoList);
		
		orderService.insertNewOrderFromCart(orderVo, cartInfoList);
		
		return "redirect:successpage";
	}

	@Auth(role=Role.USER)
	@RequestMapping(value="/successpage", method=RequestMethod.GET)
	public String orderSuccess() {		
		
		return "order/order_success";
	}

	@Auth(role=Role.USER)
	@RequestMapping(value="/list", method=RequestMethod.GET)
	public String orderList(Model model, @AuthUser UserVo authUser) {
		List<OrderVo> orderList = orderService.getUserOrderList(authUser);
		model.addAttribute("orderList", orderList);
		return "order/order_list";
	}

	@Auth(role=Role.USER)
	@RequestMapping(value="/detail", method=RequestMethod.GET)
	public String orderDetail(Model model, @RequestParam("no") Long orderNo) {
		
		List<OrderProductInfoDto> orderProductInfoList = orderProdcutService.getOrderProductListByOrderNo(orderNo);
		OrderVo orderInfo = orderService.getOrderByNo(orderNo);
		model.addAttribute("orderProductInfoList", orderProductInfoList);
		model.addAttribute("orderInfo", orderInfo);
		
		return "order/order_info";
	}

}
