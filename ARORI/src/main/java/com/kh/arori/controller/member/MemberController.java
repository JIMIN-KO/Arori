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

import com.kh.arori.entity.member.AroriMemberDto;
import com.kh.arori.entity.member.MemberDto;
import com.kh.arori.entity.member.PasswordQDto;
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
	@RequestMapping("/logout")
	public String logout(HttpSession session) {
		session.removeAttribute("userinfo");
		System.out.println(session.getAttribute("userinfo"));
		return "redirect:/";
	}

	// 회원정보수정(윤아)-김은성 고침
	@GetMapping("/updateArori")
	public String updatearori(Model model, HttpSession session) {
		MemberDto userinfo = (MemberDto) session.getAttribute("userinfo"); // 로그인한 정보를 세션 userinfo에 담는다.
		MemberDto member = memberDao.get(userinfo.getMember_id());
		model.addAttribute("memberDto", member);
		AroriMemberDto aroriMemberDto = memberDao.getArori(userinfo.getMember_id());
		model.addAttribute("aroriMemberDto", aroriMemberDto);
		List<PasswordQDto> passwordQ = memberDao.getPasswordQ();
		model.addAttribute("passwordQ", passwordQ);
		return "member/updateArori";
	}

	// 아로리) 회원정보수정(윤아)
	@PostMapping("/updateArori")
	public String updatearori(@ModelAttribute MemberDto memberDto, @ModelAttribute AroriMemberDto aroriMemberDto,
			HttpSession session) {
		MemberDto userinfo = (MemberDto) session.getAttribute("userinfo");
		memberDto.setMember_no(userinfo.getMember_no());
		aroriMemberDto.setMember_no(userinfo.getMember_no());
		memberService.updateinfo(memberDto, aroriMemberDto);

		return "redirect:myPage";

	}

	// 마이페이지 이동(윤아)
	@GetMapping("/myPage")
	public String mypage(HttpSession session, Model model) {
		// 세션에서 userinfo 정보를 받아온다
		MemberDto userinfo = (MemberDto) session.getAttribute("userinfo"); // 로그인한 정보를 세션 userinfo에 담는다.

		// 정보 갱신을 위한 단일 조회 > 마이 페이지에서 세션으로 정보 띄워주면 갱신 불편, 속도 느려짐 + 보안 문제
		MemberDto member = memberDao.get(userinfo.getMember_id());
		model.addAttribute("memberDto", member);

		// 만약에 userinfo 의 member_state 가 ARORI 일 경우 myPage_arori.jsp 띄우기
		if (userinfo.getMember_state().equals("ARORI")) {
			// 아로리 회원 정보 단일 조회 후 모델로 jsp 로 보내기
			AroriMemberDto aroriMemberDto = memberDao.getArori(userinfo.getMember_id());
			model.addAttribute("aroriMemberDto", aroriMemberDto);
			return "member/myPage_arori";
		} else {
			// 아닐 경우 myPage_social.jsp 띄우기
			return "member/myPage_social";
		}
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

	// 소셜회원 정보 수정-이동 (윤아)
	@GetMapping("/updateSocial")
	public String updateSocial(Model model, HttpSession session) {
		MemberDto userinfo = (MemberDto) session.getAttribute("userinfo"); 
		MemberDto member = memberDao.get(userinfo.getMember_id());
		model.addAttribute("memberDto", member);
		
		return "member/updateSocial";
	}

	//소셜회원 정보 수정 - 수정 
	@PostMapping("/updateSocial")
	public String updateSocial(@ModelAttribute MemberDto memberDto,HttpSession session) {
		MemberDto userinfo = (MemberDto) session.getAttribute("userinfo");
		memberDto.setMember_no(userinfo.getMember_no());
		memberService.updateSocial(memberDto);
		return "redirect:myPage";
	}

	// 회원탈퇴-이동
	@GetMapping("/delete")
	public String delete(HttpSession session, Model model) {
		MemberDto member = (MemberDto) session.getAttribute("userinfo"); // 로그인한 정보 userinfo를 MemberDto에 담는다.
		model.addAttribute("member", member);
		return "member/delete";
	}

	

	// 회원탈퇴 -탈퇴
	@PostMapping("/delete")
	public String delete(HttpSession session, @ModelAttribute MemberDto memberDto) {
		memberService.deleteMember(memberDto);
		session.removeAttribute("userinfo");
		return "redirect:/";
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
	
	//비밀번호 변경페이지 
	@GetMapping("/changePW")
	public String pwChange(HttpSession session, Model model) {
		MemberDto member = (MemberDto) session.getAttribute("userinfo"); // 로그인한 정보 userinfo를 MemberDto에 담는다.
		model.addAttribute("memberDto", member);
		return "member/changePW";
		
	} 
	//비밀번호변경 
	@PostMapping("/changePW")
	public String pwChange(@ModelAttribute AroriMemberDto aroriMemberDto,HttpSession session) {
	
		MemberDto userinfo = (MemberDto) session.getAttribute("userinfo");		
		aroriMemberDto.setMember_no(userinfo.getMember_no());
		memberService.changeAroriPW(aroriMemberDto);
		return "redirect:myPage";
		
	}
	
	

}
