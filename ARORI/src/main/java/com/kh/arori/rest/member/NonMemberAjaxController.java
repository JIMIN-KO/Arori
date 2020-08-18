package com.kh.arori.rest.member;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.kh.arori.entity.AroriMemberDto;
import com.kh.arori.entity.MemberDto;
import com.kh.arori.repository.member.MemberDao;
import com.kh.arori.service.member.MemberService;

@RestController
@RequestMapping("/nonMemberAjax")
public class NonMemberAjaxController {

	@Autowired
	private MemberDao memberDao;
	
	@Autowired
	private MemberService memberService;
	
	// 소셜 이메일 회원 조회 
	@RequestMapping("/checkEmail")
	public boolean checkEmail(@RequestParam String member_id) {
		
		// 1. 파라미터로 소셜 로그인 요청 회원의 이메일 데이터 조회 
		MemberDto member = memberDao.get(member_id);
		
		// 2. 해당 member
		if(member != null) return true;
		
		return false;
	}
	
	// 아이디 찾기 
	@PostMapping("/findId")
	public String findId(@ModelAttribute AroriMemberDto aroriMemberDto) {
		System.out.println(aroriMemberDto.getMember_phone());
		MemberDto member = memberDao.findId(aroriMemberDto);
		String member_id = member.getMember_id().substring(0, member.getMember_id().length()-2) + "**";
		return member_id;
	}
	
	// 비밀번호 찾기
	@PostMapping("/findPw")
	public String findPw(@RequestParam String member_id, @RequestParam String member_q, @RequestParam String member_a) throws Exception {
		String member_email = memberService.findPw(member_id, member_q, member_a);
		String email = member_email.substring(0, member_email.indexOf("@")-4) + "****@" + member_email.substring(member_email.indexOf("@")+1,member_email.indexOf("@")+4) + "****";
		
		return email;
	}
}
