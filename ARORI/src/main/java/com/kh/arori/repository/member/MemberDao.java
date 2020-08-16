package com.kh.arori.repository.member;

import java.util.List;
import java.util.Map;

import com.kh.arori.entity.AroriMemberDto;
import com.kh.arori.entity.MemberDto;
import com.kh.arori.entity.PasswordQDto;

public interface MemberDao {

	// 회원 시퀀스 발급
	public int getSeq();
	
	// 비밀번호 질문 받아오기
	public List<PasswordQDto> getPasswordQ();
	
	// 회원 단일 조회
	public MemberDto get(String member_id);
	
	// 전체 회원 조회 
	public List<MemberDto> getList();
	
	// 회원 가입 > MEMBER TABLE
	public void join(MemberDto memberDto);
	
	// 아로리 회원 가입
	public void joinArori(AroriMemberDto aroriMemberDto);
	
	// 아로리 회원 상세 정보 가지고 오기 
	public AroriMemberDto getArori(String member_id);
	
	// 로그인 시 로그인 시간 갱신 
	public int loginSuccess(String member_id);
}
