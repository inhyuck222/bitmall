package com.cafe24.bitmall.service.admin;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.cafe24.bitmall.dao.admin.StockDao;
import com.cafe24.bitmall.vo.ProductVo;
import com.cafe24.bitmall.vo.StockVo;

@Service("adminStockService")
public class StockService {
	
	@Autowired
	@Qualifier("adminStockDao")
	StockDao stockDao;
	
	public boolean insertStock(ProductVo product, String[] size, Long[] quantity) {
		boolean result = false;
		Long productNo = product.getNo();
		for(int i=0;i<size.length;i++) {
			
			StockVo stock = new StockVo();			
			stock.setProductNo(productNo);
			stock.setQuantity(quantity[i]);
			stock.setSize(size[i]);
			
			result = stockDao.insertStock(stock);
			if(result == false) {
				return false;
			}
		}
		
		return result;		
	}
	
	public boolean deleteAllByProductNo(ProductVo productForDelete) {
		boolean result = stockDao.deleteAllByProductNo(productForDelete);
		
		return result;
	}

}
