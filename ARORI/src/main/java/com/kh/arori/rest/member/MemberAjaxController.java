package com.kh.arori.rest.member;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.kh.arori.entity.MemberDto;
import com.kh.arori.repository.member.MemberDao;

@RestController
@RequestMapping("/memberAjax")
public class MemberAjaxController {

	@Autowired
	private MemberDao memberDao;
	
	@RequestMapping("/checkEmail")
	public boolean checkEmail(@RequestParam String member_id) {
		
		// 1. 파라미터로 소셜 로그인 요청 회원의 이메일 데이터 조회 
		MemberDto member = memberDao.get(member_id);
		
		// 2. 해당 member
		if(member != null) return true;
		
		return false;
	}
}
