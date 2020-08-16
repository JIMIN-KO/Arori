package com.kh.arori.controller.member;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kh.arori.entity.AroriMemberDto;
import com.kh.arori.entity.MemberDto;
import com.kh.arori.entity.PasswordQDto;
import com.kh.arori.interceptor.Auth;
import com.kh.arori.repository.member.MemberDao;
import com.kh.arori.service.member.MemberService;

@Controller
@RequestMapping("/member")
public class MemberController {

	@Autowired
	private MemberService memberService;

	@Autowired
	private MemberDao memberDao;

	// 기본 로그인 페이지 
	@GetMapping("/login")
	public String login() {
		return "member/login";
	}
	
	// 소셜 로그인 
	@GetMapping("/loginSuccess")
	public String loginSuccess(@ModelAttribute MemberDto memberDto, HttpSession session) {
		MemberDto member = memberService.loginSuccess(memberDto.getMember_id());

		String path = "redirect:/?loginFail";

		if (member != null) {
			session.setAttribute("userinfo", member);
			path = "redirect:/";
		}
		return path;
	}
	
	// 아로리 회원 로그인 
	@PostMapping("/loginSuccess")
	public String loginSuccess(@RequestParam String member_id, @RequestParam String member_pw, HttpSession session) {
		MemberDto member = memberService.aroriLogin(member_id, member_pw);
		
		String path = "redirect:/?loginFail";

		if (member != null) {
			session.setAttribute("userinfo", member);
			path = "redirect:/";
		}

		return path;
	}

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
		memberService.join(emailPath, memberDto);
		return "redirect:/";
	}
	
	// 로그아웃 
	@Auth
	@RequestMapping("/logout")
	public String logout(HttpSession session) {
		session.removeAttribute("userinfo");
		return "redirect:/";
	}
	
	// 아이디 / 비밀번호 찾기 페이지 
	@GetMapping("/find")
	public String find(Model model) {
		List<PasswordQDto> passwordQ = memberDao.getPasswordQ();
		model.addAttribute("passwordQ", passwordQ);
		
		return "member/find";
	}
	
	// 아이디 / 비밀번호 찾기 결과 페이지 
	@GetMapping("/findResult")
	public String findResult() {
		return "member/findResult";
	}
	
	// 아이디 찾기 
	@PostMapping("/findId")
	public String findId(@ModelAttribute AroriMemberDto aroriMemberDto, HttpSession session) {
		MemberDto member = memberDao.findId(aroriMemberDto);
		session.setAttribute("findId", member);
		return "redirect:findResult";
	}
	
	// 비밀번호 찾기
	@PostMapping("/findPw")
	public String findPw(@RequestParam String member_id, @RequestParam String member_q, @RequestParam String member_a, HttpSession session) throws Exception {
		String member_email = memberService.findPw(member_id, member_q, member_a);
		member_email = member_email.substring(0, member_email.indexOf("@"));
		session.setAttribute("findPw", member_email);
		return "redirect:findResult";
	}

}
