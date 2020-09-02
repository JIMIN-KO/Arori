package com.kh.arori.controller.member;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.apache.ibatis.session.SqlSession;
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

import com.kh.arori.repository.member.MemberDao;
import com.kh.arori.service.member.MemberService;

@Controller
@RequestMapping("/member")
public class MemberController {


	@Autowired
	private MemberService memberService;

	@Autowired
	private MemberDao memberDao;
	


	@Autowired
	SqlSession sqlSession;

	@Autowired
	PasswordEncoder encoder;

	// 로그아웃
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

			return "member/myPage";

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


	// 소셜 + 아로리) 목록조회
	@GetMapping("/resultMap")
	public String resultMap(Model model, Model model2) {
		
		List<MemberDto> result = memberDao.resultMap();
		model.addAttribute("result", result);


		List<MemberDto> result2 = memberDao.resultMap2();
		model.addAttribute("result2", result2);
		
		return "member/resultMap";

	}

	//회원탈퇴 하기 
		@PostMapping("/delete")
		public String delete(HttpSession session,@ModelAttribute MemberDto memberDto) {
		memberService.deleteMember(memberDto);
		session.removeAttribute("userinfo");
		return "redirect:/";
	}
	
}

