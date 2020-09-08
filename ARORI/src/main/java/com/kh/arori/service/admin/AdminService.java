package com.kh.arori.service.admin;

import java.util.List;

import com.kh.arori.entity.AroriMemberDto;
import com.kh.arori.entity.MemberDto;

public interface AdminService {

	//회원상세정보변경
	public void adminUpdate(MemberDto memberDto);
	
	//변경후 단일조회를 통한 상세정보 조회1
	public MemberDto memberProfile(int member_no);
	
	//변경후 단일조회를 통한 상세정보 조회2
	public AroriMemberDto memberProfile2(int member_no);
	
	//회원삭제
	public void delete(MemberDto memberDto);
	

}
