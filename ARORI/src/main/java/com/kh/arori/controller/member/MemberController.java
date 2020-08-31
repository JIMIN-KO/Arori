package com.kh.arori.controller.member;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.arori.entity.MemberDto;
import com.kh.arori.interceptor.Member;
import com.kh.arori.repository.member.MemberDao;
import com.kh.arori.service.member.MemberService;

@Controller
@RequestMapping("/member")
public class MemberController {
	
	
	@Autowired
	private MemberService memberService;

	@Autowired
	private MemberDao memberDao;
	
	// 로그아웃
	@Member
	@RequestMapping("/logout")
	public String logout(HttpSession session) {
		session.removeAttribute("userinfo");
		System.out.println(session.getAttribute("userinfo"));
		return "redirect:/";
	}
	
	//회원탈퇴 
		@GetMapping("/delete")
		public String delete(HttpSession session,Model model) {
		MemberDto member = (MemberDto) session.getAttribute("userinfo"); // 로그인한 정보 userinfo를 MemberDto에  담는다. 
		model.addAttribute("member",member);
		return "member/delete";
		}
	
	
	@RequestMapping("/main")
	public String mainPage() {
		return "member/main_member";
	}
	
	//회원탈퇴 하기 
		@PostMapping("/delete")
		public String delete(HttpSession session,@ModelAttribute MemberDto memberDto) {
		memberService.deleteMember(memberDto);
		session.removeAttribute("userinfo");
		return "redirect:/";
	}
	
	
}
