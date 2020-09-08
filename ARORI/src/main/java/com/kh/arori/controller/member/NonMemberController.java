package com.kh.arori.controller.member;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kh.arori.entity.member.AroriMemberDto;
import com.kh.arori.entity.member.MemberDto;
import com.kh.arori.entity.member.PasswordQDto;
import com.kh.arori.repository.member.MemberDao;
import com.kh.arori.service.member.MemberService;

@Controller
public class NonMemberController {

	@Autowired
	private MemberService memberService;

	@Autowired
	private MemberDao memberDao;
	
	
	// 소셜 로그인 
	@GetMapping("/loginSuccess")
	public String loginSuccess(@ModelAttribute MemberDto memberDto, HttpSession session) {
		
		MemberDto member = memberService.loginSuccess(memberDto.getMember_id());

		if (member != null) {
			session.setAttribute("userinfo", member);
			return "redirect:member/main";
		}
		
		return "redirect:/?loginFail";
	}
	
//	// 아로리 회원 로그인 
//	@PostMapping("/loginSuccess")
//	public String loginSuccess(@RequestParam String member_id, @RequestParam String member_pw, HttpSession session) {
//		
//		MemberDto member = memberService.aroriLogin(member_id, member_pw);
//
//		if (member != null) {
//			session.setAttribute("userinfo", member);
//			return "redirect:member/main";
//		}
//
//		return "redirect:/?loginFail";
//	}

	// 아로리 회원 가입 페이지 
	@GetMapping("/joinArori")
	public String joinArori(Model model) {
		List<PasswordQDto> passwordQ = memberDao.getPasswordQ();
		model.addAttribute("passwordQ", passwordQ);
		return "member/joinArori";
	}
	
	// 아로리 회원 가입 
	@PostMapping("/joinArori")
	public String join(@ModelAttribute MemberDto memberDto, @ModelAttribute AroriMemberDto aroriMemberDto) {
		memberService.join(memberDto, aroriMemberDto);
		return "redirect:/";
	}

	// 소셜 회원 가입 
	@GetMapping("/joinSocial")
	public String joinSocial(@RequestParam String emailPath, @ModelAttribute MemberDto memberDto) {
		System.out.println("Controller");
		memberService.join(emailPath, memberDto);
		return "redirect:/";
	}
	
	// 아이디 / 비밀번호 찾기 페이지
	@GetMapping("/find")
	public String find(Model model) {
		List<PasswordQDto> passwordQ = memberDao.getPasswordQ();
		model.addAttribute("passwordQ", passwordQ);
		
		return "member/find";
	}

}
