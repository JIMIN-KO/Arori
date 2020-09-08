package com.kh.arori.repository.admin;


import com.kh.arori.entity.member.MemberDto;



public interface AdminDao {

	//회원삭제
	
	public void Delete(MemberDto memberDto);
	

}
