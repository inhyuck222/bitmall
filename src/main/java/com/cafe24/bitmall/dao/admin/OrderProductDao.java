package com.cafe24.bitmall.dao.admin;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.cafe24.bitmall.dto.OrderProductInfoDto;

@Repository("adminOrderProductDao")
public class OrderProductDao {
	
	@Autowired
	SqlSession sqlSession;
	
	public List<OrderProductInfoDto> selectOrderProductListByOrderNo(Long orderNo) {
		List<OrderProductInfoDto> orderProductList = sqlSession.selectList("adminOrderProduct.selectOrderProductListByOrderNo", orderNo);
		
		return orderProductList;
	}
	
	public boolean deleteOrderProduct(Long orderProductNo) {
		int count = sqlSession.delete("adminOrderProduct.deleteOrderProduct", orderProductNo);
		
		return count == 1;
	}

}
