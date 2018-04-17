package com.cafe24.bitmall.controller.admin;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.cafe24.bitmall.dto.OrderProductInfoDto;
import com.cafe24.bitmall.service.admin.AdminUserService;
import com.cafe24.bitmall.service.admin.OrderProductService;
import com.cafe24.bitmall.service.admin.OrderService;
import com.cafe24.bitmall.vo.OrderVo;
import com.cafe24.bitmall.vo.UserVo;

@Controller("adminOrderController")
@RequestMapping("/admin/order")
public class OrderController {
	
	@Autowired
	@Qualifier("adminOrderService")
	OrderService orderService;
	
	@Autowired
	@Qualifier("adminUserService")
	AdminUserService userService;
	
	@Autowired
	@Qualifier("adminOrderProductService")
	OrderProductService orderProductService;
	
	@RequestMapping("")
	public String adminOrderList(Model model) {
		List<OrderVo> orderList = orderService.getAllOrder();
		model.addAttribute("orderList", orderList);		
		
		return "admin/order/order_list";
	}
	
	@RequestMapping("/info")
	public String showOrderInfo(Model model, @RequestParam("orderNo") Long orderNo) {

		OrderVo orderInfo = orderService.getOrderByOrderNo(orderNo);
		if(orderInfo == null) {
			return "admin/order/order_list";
		}
		model.addAttribute("orderInfo", orderInfo);
		
		UserVo orderUser = userService.getUserByUserNo(orderInfo.getUserNo());
		if(orderUser == null) {
			return "admin/order/order_list";
		}
		model.addAttribute("orderUser", orderUser);
		
		List<OrderProductInfoDto> orderProductList = orderProductService.getOrderProductListByOrderNo(orderInfo.getNo());
		if(orderProductList == null) {
			return "admin/order/order_list";
		}
		model.addAttribute("orderProductList", orderProductList);
		
		return "admin/order/order_info";
	}

}
