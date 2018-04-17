package com.cafe24.bitmall.service;

import java.util.Calendar;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.cafe24.bitmall.dao.CartDao;
import com.cafe24.bitmall.dao.OrderDao;
import com.cafe24.bitmall.dao.OrderProdcutDao;
import com.cafe24.bitmall.vo.OrderVo;
import com.cafe24.bitmall.vo.UserVo;

@Service("orderService")
public class OrderService {
	
	@Autowired
	@Qualifier("orderDao")
	OrderDao orderDao;
	
	@Autowired
	@Qualifier("orderProductDao")
	OrderProdcutDao orderProductDao;
	
	@Autowired
	@Qualifier("cartDao")
	CartDao cartDao;
	
	public boolean insertNewOrderFromCart(OrderVo newOrder, List<Map<String, Object>> cartInfoList){

		boolean result = false;
		Map<String, Object> orderProductInfo = null;
		Calendar cal = Calendar.getInstance();
		
		String code = newOrder.getUserNo() + "" +cal.getTimeInMillis();
		newOrder.setCode(code);
		result = orderDao.insertOrder(newOrder);
		if(result == false) {
			return false;
		}
		
		for(int i=0;i<cartInfoList.size();i++) {
			orderProductInfo = cartInfoList.get(i);
			if(orderProductInfo == null) {
				return false;
			}
			
			orderProductInfo.put("orderNo", newOrder.getNo());
			result = orderProductDao.insertOrderProductFromCart(orderProductInfo);
			if(result == false) {
				return false;
			}
			
			result = cartDao.deleteCartItemWhenOrder(orderProductInfo);
			if(result == false) {
				return false;
			}
		}
		
		return result;
	}
	
	public List<OrderVo> getUserOrderList(UserVo authUser){
		List<OrderVo> orderList = orderDao.selectOrdersByUserNo(authUser.getNo());
		
		return orderList;		
	}
	
	public OrderVo getOrderByNo(Long orderNo) {
		
		OrderVo orderInfo = orderDao.selectOrderByOrderNo(orderNo);
		if(orderInfo.getPayment().equals("bankBook")) {
			orderInfo.setPayment("무통장 입금");
		} else if(orderInfo.getPayment().equals("card")) {
			orderInfo.setPayment("카드");
		}
		
		return orderInfo;
	}

}
