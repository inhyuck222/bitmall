package com.cafe24.bitmall.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.cafe24.bitmall.dao.CartDao;
import com.cafe24.bitmall.vo.CartVo;
import com.cafe24.bitmall.vo.ProductVo;
import com.cafe24.bitmall.vo.StockVo;
import com.cafe24.bitmall.vo.UserVo;

@Service("cartService")
public class CartService {

	@Autowired
	@Qualifier("cartDao")
	CartDao cartDao;
	
	public CartVo addNewCart(UserVo authUser, ProductVo product, StockVo stock, Long amount, Long productQuantity) {
		boolean result = false;
		CartVo cartVo = new CartVo();
		cartVo.setAmount(amount);
		cartVo.setProductNo(product.getNo());
		cartVo.setQuantity(productQuantity);
		cartVo.setSize(stock.getSize());
		cartVo.setUserNo(authUser.getNo());
		
		CartVo existenceCart = cartDao.selectExistenceCart(cartVo);
		if(existenceCart != null && existenceCart.getSize().equals(stock.getSize())) {
			existenceCart.setQuantity(existenceCart.getQuantity() + cartVo.getQuantity());
			existenceCart.setAmount(product.getPrice() * existenceCart.getQuantity());
			result = cartDao.updateExistenceCart(existenceCart);
			if(result == false) {
				return null;
			}
			return existenceCart;
		}
		
		result = cartDao.insertNewCart(cartVo);
		if(result == false) {
			cartVo = null;
		}
		
		return cartVo;
	}
	
	public boolean deleteCartItem(CartVo cart) {		
		boolean result = cartDao.deleteCartItem(cart);
		
		return result;
	}
	
	public List<Map<String, Object>> getAllCartByUserNo(UserVo authUser){
		
		List<Map<String, Object>> cartInfoList = cartDao.selectAllCartByUserNo(authUser.getNo());
		
		return cartInfoList;
	}
	
}
