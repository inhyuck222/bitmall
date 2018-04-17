package com.cafe24.bitmall.service.admin;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.cafe24.bitmall.dao.admin.OrderProductDao;
import com.cafe24.bitmall.dto.OrderProductInfoDto;

@Service("adminOrderProductService")
public class OrderProductService {
	
	@Autowired
	@Qualifier("adminOrderProductDao")
	OrderProductDao orderProductDao;
	
	public List<OrderProductInfoDto> getOrderProductListByOrderNo(Long orderNo){
		List<OrderProductInfoDto> orderProductList = orderProductDao.selectOrderProductListByOrderNo(orderNo);
		
		return orderProductList;
	}

}
