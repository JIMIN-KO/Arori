package com.kh.arori.service.admin;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.arori.entity.member.AroriMemberDto;
import com.kh.arori.entity.member.MemberDto;
import com.kh.arori.repository.admin.AdminDao;
import com.kh.arori.repository.member.MemberDao;

@Service
public class AdminServiceImpl implements AdminService {

	@Autowired
	MemberDao memberDao;
	
	@Autowired 
	AdminDao adminDao;

	@Override
	public void adminUpdate(MemberDto memberDto) {
		memberDao.adminUpdate(memberDto);
	}

	// 관리자 -> 변경후 단일조회를 통한 상세정보 조회1
	@Override
	public MemberDto memberProfile(int member_no) {
		MemberDto memberProfile = memberDao.memberProfile(member_no);
		return memberProfile;
	}

	// 관리자 -> 변경후 단일조회를 통한 상세정보 조회2
	@Override
	public AroriMemberDto memberProfile2(int member_no) {
		AroriMemberDto memberProfile2 = memberDao.memberProfile2(member_no);
		return memberProfile2;
	}

	@Override
	public void delete(MemberDto memberDto) {
		memberDao.deleteMember(memberDto);

	}

	@Override
	public int totalCnt() {
		return adminDao.totalCnt();
	}


	
}
