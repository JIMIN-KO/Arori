package com.kh.arori.service.member;

import com.kh.arori.entity.AroriMemberDto;
import com.kh.arori.entity.MemberDto;

public interface MemberService {

	// 시퀀스 발급 메소드
	public int getSeq();

	// 회원 가입
	public void join(String emailPath, MemberDto memberDto);

	// 아로리 회원 가입
	public void join(MemberDto memberDto, AroriMemberDto aroriMemberDto);

	// 아로리 회원 로그인
	public MemberDto aroriLogin(String member_id, String member_pw);

	// 로그인 갱신
	public MemberDto loginSuccess(String member_id);

	// 아로리) 비밀번호 찾기 > 이메일 보내기
	public String findPw(String member_id, String member_q, String member_a) throws Exception;

	// 아로리) 임시 비밀번호 발급
	public String temporaryPw();
	
	//아로리) 정보수정
	public void updateArori(AroriMemberDto aroriMemberDto);
	
	//소셜회원) 정보수정
	public void updateSocial(MemberDto memberDto);
	
	//아로리)비밀번호조회
	public boolean checkPw(String member_pw);
	


	//회원탈퇴 
	public void deleteMember(MemberDto memberDto);

}
