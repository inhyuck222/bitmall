package com.cafe24.bitmall.service.admin;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.cafe24.bitmall.dao.admin.OrderDao;
import com.cafe24.bitmall.dao.admin.OrderProductDao;
import com.cafe24.bitmall.dao.admin.StockDao;
import com.cafe24.bitmall.dto.OrderProductInfoDto;
import com.cafe24.bitmall.vo.OrderVo;

@Service("adminOrderService")
public class OrderService {

	@Autowired
	@Qualifier("adminOrderDao")
	OrderDao orderDao;

	@Autowired
	@Qualifier("adminOrderProductDao")
	OrderProductDao orderProductDao;
	
	@Autowired
	@Qualifier("adminStockDao")
	StockDao stockDao;

	public List<OrderVo> getAllOrder() {
		List<OrderVo> orderList = orderDao.selectAllOrder();

		return orderList;
	}

	public OrderVo getOrderByOrderNo(Long orderNo) {
		OrderVo orderInfo = orderDao.selectOrderByOrderNo(orderNo);
		return orderInfo;
	}

	public boolean deleteOrder(OrderVo order) {
		boolean result = false;
		Long productNo;
		Long quantity;
		String size;
		OrderProductInfoDto orderProductInfo;
		List<OrderProductInfoDto> orderProductInfoList = orderProductDao.selectOrderProductListByOrderNo(order.getNo());
		
		for (int i = 0; i < orderProductInfoList.size(); i++) {
			orderProductInfo = orderProductInfoList.get(i);
			productNo = orderProductInfo.getProductNo();
			size = orderProductInfo.getSize();
			quantity = orderProductInfo.getQuantity();
			
			result = stockDao.updateStockQuantity(productNo, size, quantity);
			if(result == false) {
				return false;
			}
			
			result = orderProductDao.deleteOrderProduct(orderProductInfo.getOrderProductNo());
			if(result == false) {
				return false;
			}
		}
		
		result = orderDao.deleteOrder(order.getNo());

		return result;
	}

}
