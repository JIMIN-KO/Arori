package com.kh.arori.repository.admin;


import java.util.List;

import com.kh.arori.entity.img.This_imgDto;
import com.kh.arori.entity.member.AroriMemberDto;
import com.kh.arori.entity.member.MemberDto;
import com.kh.arori.entity.member.ReportDto;
import com.kh.arori.entity.study.ClassesDto;


public interface AdminDao {

	
	//회원삭제
	public void Delete(MemberDto memberDto);
	
	//회원1명당 클래스 개수조회
	public int classCount(int member_no);
	
	//페이지네이션 회원 카운트
	public int totalCnt();
	
	//클래스목록(차트)
	public List<ClassesDto>getIncome();
	
	//회원+회원이미지 불러오기
	public This_imgDto getImage(int member_no);
	
	//클래스 총 개수
	public int classCount(ClassesDto classesDto);
	
	//멤버 총 개수
	public int memberCount(MemberDto memberDto);

	//비밀번호 확인
	public int checkPw(AroriMemberDto aroriMemberDto);
	
}
