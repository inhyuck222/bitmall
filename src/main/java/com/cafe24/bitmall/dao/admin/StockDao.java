package com.cafe24.bitmall.dao.admin;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.cafe24.bitmall.vo.ProductVo;
import com.cafe24.bitmall.vo.StockVo;

@Repository("adminStockDao")
public class StockDao {

	@Autowired
	SqlSession sqlSession;
	
	public boolean insertStock(StockVo stock) {
		
		int count = sqlSession.insert("adminStock.insertStock", stock);
		
		return count == 1;
	}
	
	public boolean deleteAllByProductNo(ProductVo productForDelete) {
		int count = sqlSession.delete("adminStock.deleteAllByProductNo", productForDelete);
		
		return count != 0;
	}
		
}
