package com.cafe24.bitmall.controller.api.admin;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.cafe24.bitmall.dto.JSONResult;
import com.cafe24.bitmall.service.admin.OrderService;
import com.cafe24.bitmall.vo.OrderVo;
import com.cafe24.security.Auth;
import com.cafe24.security.Auth.Role;

@Controller("apiAdminOrderController")
@RequestMapping("api/admin/order")
public class OrderController {

	@Autowired
	@Qualifier("adminOrderService")
	OrderService orderService;
	
	@Auth(role=Role.ADMIN)
	@ResponseBody
	@RequestMapping("/delete")
	public JSONResult deleteOrder(@RequestBody OrderVo order) {
		
		boolean result = orderService.deleteOrder(order);
		if(result == false) {
			return JSONResult.fail("fail to delete order in admin page");
		}
		
		return JSONResult.success("success");
	}

}
