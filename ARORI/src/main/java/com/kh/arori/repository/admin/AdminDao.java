package com.kh.arori.repository.admin;


import com.kh.arori.entity.member.MemberDto;




public interface AdminDao {

	//회원삭제
	
	public void Delete(MemberDto memberDto);
	
	//회원1명당 클래스 개수조회
	
	public int classCount(int member_no);
	
	//페이지네이션 회원 카운트
	public int totalCnt();
}
