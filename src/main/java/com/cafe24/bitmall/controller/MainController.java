	package com.cafe24.bitmall.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MainController {
	
	@RequestMapping( "" )
	public String index() {
		return "main/index";
	}
	
	@RequestMapping( "/order" )
	public String order() {
		return "order/order";
	}
	
	@RequestMapping( "/jumun" )
	public String jumun() {
		return "order/order_info";
	}

	@RequestMapping( "/admin" )
	public String admin() {
		return "admin/member/member";
	}
}
