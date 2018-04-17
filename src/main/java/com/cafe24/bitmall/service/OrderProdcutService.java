package com.cafe24.bitmall.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.cafe24.bitmall.dao.OrderProdcutDao;
import com.cafe24.bitmall.dto.OrderProductInfoDto;

@Service("orderProductService")
public class OrderProdcutService {

	@Autowired
	@Qualifier("orderProductDao")
	OrderProdcutDao orderProdcutDao; 
	
	public List<OrderProductInfoDto> getOrderProductListByOrderNo(Long orderNo) {
		
		List<OrderProductInfoDto> orderProductList = orderProdcutDao.selectOrderProductListByOrderNo(orderNo);
		
		return orderProductList;
	}
	
}
