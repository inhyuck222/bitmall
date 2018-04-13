package com.cafe24.bitmall.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.cafe24.bitmall.dao.StockDao;
import com.cafe24.bitmall.vo.CartVo;
import com.cafe24.bitmall.vo.StockVo;

@Service("stockService")
public class StockService {
	
	@Autowired
	@Qualifier("stockDao")
	StockDao stockDao;
	
	public List<StockVo> getAllStockByProductNo(Long productNo){
		
		List<StockVo> stockList = stockDao.selectAllStockByProductNo(productNo);
		
		return stockList;
	}
	
	public StockVo getStock(Long stockNo) {
		
		StockVo stock = stockDao.selectStock(stockNo);
		
		return stock;
	}
	
	public boolean updateStockQuantity(StockVo stock) {
		
		boolean result = stockDao.updateStockQuantity(stock);
		
		return result;
	}
	
	public boolean updateStockQuantityFromCart(CartVo cart) {
				
		boolean result = stockDao.updateStockQuantityFromCart(cart);
		
		return result;
	}

}
