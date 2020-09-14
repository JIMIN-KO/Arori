package com.kh.arori.service.admin;

import java.util.List;

import com.kh.arori.entity.img.This_imgDto;
import com.kh.arori.entity.member.AroriMemberDto;
import com.kh.arori.entity.member.MemberDto;
import com.kh.arori.entity.study.ClassesDto;



public interface AdminService {

	//회원상세정보변경
	public void adminUpdate(MemberDto memberDto);
	
	//변경후 단일조회를 통한 상세정보 조회1
	public MemberDto memberProfile(int member_no);
	
	//변경후 단일조회를 통한 상세정보 조회2
	public AroriMemberDto memberProfile2(int member_no);
	
	//회원삭제
	public void delete(MemberDto memberDto);
	

	public List<ClassesDto>getIncome();
	
	//회원 + 회원이미지
	public This_imgDto getImage(int member_no);
	
	//비밀번호 확인
	//비밀번호 확인
	public int checkPw(AroriMemberDto aroriMemberDto);
}