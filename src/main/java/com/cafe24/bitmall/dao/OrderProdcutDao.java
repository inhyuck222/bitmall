package com.cafe24.bitmall.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.cafe24.bitmall.dto.OrderProductInfoDto;

@Repository("orderProductDao")
public class OrderProdcutDao {

	@Autowired
	SqlSession sqlSession;

	public boolean insertOrderProductFromCart(Map<String, Object> cartInfo) {

		// mybatis의 parameter가 map일 경우에 size를 사용하면 map.size()를 호출;;
		cartInfo.put("productSize", cartInfo.get("size"));
		
		int count = sqlSession.insert("userOrderProduct.insertOrderProductFromCart", cartInfo);
		
		return count == 1;
	}
	
	public List<OrderProductInfoDto> selectOrderProductListByOrderNo(Long orderNo) {
		
		List<OrderProductInfoDto> orderProductList = sqlSession.selectList("userOrderProduct.selectOrderProductListByOrderNo", orderNo);
		
		return orderProductList;		
	}
}
