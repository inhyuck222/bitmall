package com.cafe24.bitmall.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.cafe24.bitmall.vo.CartVo;

@Repository("cartDao")
public class CartDao {
	
	@Autowired
	SqlSession sqlSession;
	
	public boolean insertNewCart(CartVo cart) {
		
		int count = sqlSession.insert("userCart.insertNewCart", cart);
		
		return count == 1;		
	}
	
	public List<Map<String, Object>> selectAllCartByUserNo(Long userNo)	{
		
		List<Map<String, Object>> cartInfoList = sqlSession.selectList("userCart.selectAllCartInfoByUserNo", userNo);
		
		return cartInfoList;
	}
	
	public CartVo selectExistenceCart(CartVo cartVo) {
		CartVo cart = sqlSession.selectOne("userCart.selectExistenceCart", cartVo);
		
		return cart;
	}
	
	public boolean updateExistenceCart(CartVo existenceCart) {
		int count = sqlSession.update("userCart.updateExistenceCart", existenceCart);
		
		return count == 1;
	}
	
	public boolean deleteCartItem(CartVo cart) {
		int count = sqlSession.delete("userCart.deleteCartItemByNo", cart);
		
		return count == 1;
	}

}
