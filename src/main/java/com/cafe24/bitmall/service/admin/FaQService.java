package com.cafe24.bitmall.service.admin;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.cafe24.bitmall.dao.admin.FaQDao;
import com.cafe24.bitmall.vo.FaQVo;

@Service("adminFaQService")
public class FaQService {
	
	@Autowired
	@Qualifier("adminFaQDao")
	FaQDao faqDao;
	
	public List<FaQVo> getAllFaQList() {
		List<FaQVo> faqList = faqDao.selectAllList();
		
		return faqList;
	}
	
	public FaQVo addNewFaQ(FaQVo newFaQVo) {
		boolean result = faqDao.insertFaQ(newFaQVo);
		
		if(result == false || newFaQVo.getNo() == null) {
			return null;
		}
		
		return newFaQVo;		
	}
	
	public boolean updateFaQ(FaQVo faQVo) {
		boolean result = faqDao.updateFaQ(faQVo);
		
		return result;		
	}
	
	public boolean deleteFaQ(FaQVo faQVo) {
		boolean result = faqDao.deleteFaQ(faQVo);
		
		return result;		
	}

}
