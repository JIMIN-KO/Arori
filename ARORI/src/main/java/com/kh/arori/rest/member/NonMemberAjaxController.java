package com.kh.arori.rest.member;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.kh.arori.entity.member.AroriMemberDto;
import com.kh.arori.entity.member.MemberDto;
import com.kh.arori.repository.member.MemberDao;
import com.kh.arori.service.member.MemberService;

@RestController
@RequestMapping("/nonMemberAjax")
public class NonMemberAjaxController {

	@Autowired
	private MemberDao memberDao;

	@Autowired
	private MemberService memberService;

	// 아로리 회원 로그인
	   @PostMapping("/loginSuccess")
	   public MemberDto loginSuccess(@RequestParam String member_id, @RequestParam String member_pw,
	        HttpSession session) {

	      MemberDto member = memberService.aroriLogin(member_id, member_pw);

	      if (member.getReport_state().equals("정상")) {
//	         System.out.println("member : " + member.getReport_state());
	         if (member != null) {
	            session.setAttribute("userinfo", member);
	            return member;
	         } else {
	           
	        	 return null;

	         }
	      }
	      return null;
	   }

	   // 소셜 이메일 회원 조회
	   @RequestMapping("/checkEmail")
	   public boolean checkEmail(@RequestParam String member_id) {
	      System.out.println(member_id);
	      // 1. 파라미터로 소셜 로그인 요청 회원의 이메일 데이터 조회
	      MemberDto member = memberDao.get(member_id);

	      // 2. 해당 member
	      if (member != null)
	         return true;

	      return false;
	   }

	// 아이디 찾기
	@RequestMapping(value = "/findId", method = RequestMethod.POST, produces = "text/plain;charset=UTF-8")
	public String findId(@ModelAttribute AroriMemberDto aroriMemberDto) {
		MemberDto member = memberDao.findId(aroriMemberDto);

		String member_id = "정보를 찾을 수 없습니다. 다시 입력해주세요.";

		if (member != null) {
			member_id = member.getMember_id().substring(0, member.getMember_id().length() - 2) + "**";
		}
		System.out.println(member_id);
		return member_id;
	}

	// 비밀번호 찾기
	@RequestMapping(value = "/findPw", method = RequestMethod.POST, produces = "text/plain;charset=UTF-8")
	public String findPw(@RequestParam String member_id, @RequestParam String member_q, @RequestParam String member_a)
			throws Exception {
		String member_email = memberService.findPw(member_id, member_q, member_a);

		String email = "정보를 찾을 수 없습니다. 다시 입력해주세요.";

		if (member_email != null) {
//			email = member_email.substring(0, member_email.indexOf("@")-4) + "****@" + member_email.substring(member_email.indexOf("@")+1,member_email.indexOf("@")+4) + "****";
			email = "회원님의 이메일로 임시 비밀번호를 발급했습니다.";
		}
		System.out.println(email);
		return email;
	}

	// 회원가입시 아이디 중복검사용
	// 인터페이스랑 구현체랑 메소드 이름 맞추세요

	// 아까 오류는 메이븐 업데이트 하니까 해결 됐습니다 감사하니다.

	@GetMapping("/checkOverlap")
	public MemberDto checkOverlap(@RequestParam String member_id) {
		MemberDto memberDto = memberDao.checkOverlap(member_id);
		return memberDto;
	}

	// 회원가입시 메일 중복검사용
	@GetMapping("/checkOverlapMail")
	public MemberDto checkOverlapMail(@RequestParam String member_email) {
		MemberDto memberDto = memberDao.checkOverlapMail(member_email);
		return memberDto;
	}

	// 회원가입시 닉네임 중복검사용
	@GetMapping("/checkOverlapNick")
	public MemberDto checkOverlapNick(@RequestParam String member_nick) {
		MemberDto memberDto = memberDao.checkOverlapNick(member_nick);
		return memberDto;
	}

	// 회원가입시 핸드폰 중복검사
	@GetMapping("/checkOverlapPhone")
	public MemberDto checkOverlapPhone(@RequestParam String member_phone) {
		MemberDto memberDto = memberDao.checkOverlapPhone(member_phone);
		return memberDto;
	}

}
