package com.cafe24.bitmall.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.cafe24.bitmall.vo.CartVo;
import com.cafe24.bitmall.vo.StockVo;

@Repository("stockDao")
public class StockDao {

	@Autowired
	SqlSession sqlSession;
	
	public List<StockVo> selectAllStockByProductNo(Long productNo) {
		
		List<StockVo> stockList = sqlSession.selectList("userStock.selectAllByProductNo", productNo);
		
		return stockList;
	}
	
	public StockVo selectStock(Long stockNo) {
		
		StockVo stock = sqlSession.selectOne("userStock.selectByStockNo", stockNo);
		
		return stock;		
	}
	
	public boolean updateStockQuantity(StockVo stock) {
		
		int count = sqlSession.update("userStock.updateStockQuantity", stock);
		
		return count == 1;
	}
	
	public boolean updateStockQuantityFromCart(CartVo cart) {
		
		int count = sqlSession.update("userStock.updateStockQuantityFromCart", cart);
		
		return count == 1;
	}
	
	public boolean updateStockQuantityFromCartForUpdating(StockVo stock) {
		
		int count = sqlSession.update("userStock.updateStockQuantityFromCartForUpdating", stock);
		
		return count == 1;
	}
	
	public StockVo selectStockByProductNoAndSize(Long productNo, String size) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("productNo", productNo);
		map.put("productSize", size);
		StockVo stock = sqlSession.selectOne("userStock.selectStockByProductNoAndSize", map);
		return stock;
	}
	
}
