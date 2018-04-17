package com.cafe24.bitmall.dao.admin;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.cafe24.bitmall.vo.OrderVo;

@Repository("adminOrderDao")
public class OrderDao {
	
	@Autowired
	SqlSession sqlSession;
	
	public List<OrderVo> selectAllOrder() {
		List<OrderVo> orderList = sqlSession.selectList("adminOrder.selectAllOrder");
		
		return orderList;
	}
	
	public OrderVo selectOrderByOrderNo(Long orderNo) {
		OrderVo orderInfo = sqlSession.selectOne("adminOrder.selectOrderByOrderNo", orderNo);
		return orderInfo;
	}
	
	public boolean deleteOrder(Long no) {
		int count = sqlSession.delete("adminOrder.deleteOrder", no);
		return count == 1;
	}

}
