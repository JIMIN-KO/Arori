package com.kh.arori.service.admin;

import java.util.List;
import java.util.Map;

import com.kh.arori.entity.img.This_imgDto;
import com.kh.arori.entity.member.AllMemberDto;
import com.kh.arori.entity.member.AroriMemberDto;
import com.kh.arori.entity.study.ClassesDto;

public interface AdminService {


	   //회원상세정보변경
	   public void adminUpdate(AllMemberDto allMemberDto);
	   
	   //변경후 단일조회를 통한 상세정보 조회1
	   public AllMemberDto memberProfile(int member_no);
	   
	   //차트 연습
	   public List<ClassesDto>getIncome();
	   
	   //회원 + 회원이미지
	   public This_imgDto getImage(int member_no);
	   
	   //아로리 총 멤버리스트
	   public List<AllMemberDto>allList();
	   
	   //아로리 총 인원
	   public int aroriCount(AroriMemberDto aroriMemberDto);
	   
	   //멤버 총 인원
	   public int memberCount();
	   
	   // 페이지 네이션 
	   public List<AllMemberDto> page(Map<String, String> map);

	   // 페이지네이션 개수
	   public List<Integer> pagination(int thisCount, int pageNo);
	   
	// 오늘의 카운트(지민)
	public int[] todayCount();

	// 테이블 별 수 변화 현황(지민)
	public Map<String, String[]> thisChart(String table_name, String col, String today);

}
