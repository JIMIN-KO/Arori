package com.kh.arori.controller.member;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
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
import com.kh.arori.interceptor.Member;
import com.kh.arori.repository.member.MemberDao;
import com.kh.arori.service.member.MemberService;

@Controller
@RequestMapping("/member")
public class MemberController {
	@Autowired
	MemberDao memberDao;

	@Autowired
	MemberService memberService;

	@Autowired
	SqlSession sqlSession;

	@Autowired
	PasswordEncoder encoder;

	// 로그아웃
	@Member
	@RequestMapping("/logout")
	public String logout(HttpSession session) {
		session.removeAttribute("userinfo");
		System.out.println(session.getAttribute("userinfo"));
		return "redirect:/";
	}

	// 회원정보수정(윤아)
	@GetMapping("/updateArori")
	public String updatearori() {

		return "member/updateArori";
	}

	// 아로리) 회원정보수정(윤아)
	@PostMapping("/updateArori")
	public String updatearori(Model model, @ModelAttribute AroriMemberDto aroriMemberDto, HttpSession session) {

		List<PasswordQDto> memberQ = memberDao.getPasswordQ();
		model.addAttribute("memberQ", memberQ);

		boolean result = memberService.checkPw(aroriMemberDto.getMember_pw());

		if (result) {
			memberService.updateArori(aroriMemberDto);
			return "redirect:/";

		} else {
			return "member/updateArori";
		}
	}

	// 마이페이지(윤아)
	@GetMapping("/myPage")
	public String mypage() {

		return "member/myPage";
	}

	@PostMapping("/myPage")
	public String mypage(@ModelAttribute AroriMemberDto aroriMemberDto, @RequestParam int member_no) {
		AroriMemberDto myPage = memberDao.myInfo(member_no);

		return "member/myPage";
	}

	// 회원 목록 리스트 (윤아)
	@GetMapping("/memberList")
	public String memberList(Model model) {
		List<MemberDto> list = memberDao.getList();
		model.addAttribute("list", list);

		List<AroriMemberDto> aroriList = memberDao.getAroriList();
		model.addAttribute("arorList", aroriList);

		return "member/memberList";

	}

	// 소셜 마이페이지
	@GetMapping("/socialMyPage")
	public String socialMyPage() {
		
		return "member/socialMyPage";
	}
	
	@PostMapping("/socialMyPage")
	public String socialMyPage(@ModelAttribute MemberDto memberDto, @RequestParam int member_no) {
		
		MemberDto socialMyPage = memberDao.SocialInfo(member_no);
		
		return "member/socialMyPage";
	}

	// 소셜회원 정보 수정(윤아)
	@GetMapping("/updateSocial")
	public String updateSocial() {

		return "member/updateSocial";
	}

	@PostMapping("/updateSocial")
	public String updateSocial(@ModelAttribute MemberDto memberDto, HttpSession session) {
		memberService.updateSocial(memberDto);
		return "member/socialMyPage";
	}
	
	@RequestMapping("/main")
	public String mainPage() {
		return "member/main_member";
	}
}
