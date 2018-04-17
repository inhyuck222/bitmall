package com.cafe24.bitmall.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.cafe24.bitmall.vo.OrderVo;

@Repository("orderDao")
public class OrderDao {
	
	@Autowired
	SqlSession sqlSession;
		
	public boolean insertOrder(OrderVo newOrder) {
		int count = sqlSession.insert("userOrder.insertOrder", newOrder);
		
		return count == 1;
	}
	
	public List<OrderVo> selectOrdersByUserNo(Long userNo) {
		List<OrderVo> orderList = sqlSession.selectList("userOrder.selectOrdersByUserNo", userNo);
		
		return orderList;
	}
	
	public OrderVo selectOrderByOrderNo(Long orderNo) {
		OrderVo orderInfo = sqlSession.selectOne("userOrder.selectOrderByOrderNo", orderNo);
		
		return orderInfo;
	}

}
