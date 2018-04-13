package com.cafe24.bitmall.dao;

import java.util.List;

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
	
}
