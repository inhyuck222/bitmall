package com.cafe24.bitmall.dao.admin;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.cafe24.bitmall.vo.FaQVo;

@Repository("adminFaQDao")
public class FaQDao {

	@Autowired
	SqlSession sqlSession;
	
	public List<FaQVo> selectAllList() {
		List<FaQVo> list = sqlSession.selectList("adminFaQ.selectAll");
		
		return list;
	}
	
	public boolean insertFaQ(FaQVo newFaQVo) {
		int count = sqlSession.insert("adminFaQ.insertNewFaQ", newFaQVo);
		
		return count == 1;		
	}
	
	public boolean updateFaQ(FaQVo faQVo) {
		int count = sqlSession.insert("adminFaQ.updateFaQ", faQVo);
		
		return count == 1;		
	}
	
	public boolean deleteFaQ(FaQVo faQVo) {
		int count = sqlSession.insert("adminFaQ.deleteFaQ", faQVo);
		
		return count == 1;		
	}
}
