package com.cafe24.bitmall.dao.admin;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.cafe24.bitmall.vo.UserVo;

@Repository("adminMemberDao")
public class MemberDao {

	@Autowired
	SqlSession sqlSession;
	
	public List<UserVo> selectMemberList() {
		List<UserVo> memberList = sqlSession.selectList("adminMember.selectMemberList");
		
		return memberList;
	}
	
}
