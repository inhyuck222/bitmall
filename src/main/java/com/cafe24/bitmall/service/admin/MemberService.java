package com.cafe24.bitmall.service.admin;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.cafe24.bitmall.dao.admin.MemberDao;
import com.cafe24.bitmall.vo.UserVo;

@Service("adminMemberService")
public class MemberService {
	
	@Autowired
	@Qualifier("adminMemberDao")
	MemberDao memberDao;
	
	public List<UserVo> getMemberList() {
		List<UserVo> memberList = memberDao.selectMemberList();
		
		return memberList;
	}

}
