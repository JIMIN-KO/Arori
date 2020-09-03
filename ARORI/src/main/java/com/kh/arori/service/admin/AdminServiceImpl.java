package com.kh.arori.service.admin;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.arori.entity.MemberDto;
import com.kh.arori.repository.member.MemberDao;

@Service
public class AdminServiceImpl implements AdminService {

	@Autowired MemberDao memberDao;
	
	
	@Override
	public void adminUpdate(MemberDto memberDto) {
		memberDao.adminUpdate(memberDto);
	}

}
