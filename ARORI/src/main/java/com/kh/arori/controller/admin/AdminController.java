
package com.kh.arori.controller.admin;

import java.sql.Date;
import java.text.DateFormat;
import java.text.SimpleDateFormat;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import com.kh.arori.entity.member.AroriMemberDto;
import com.kh.arori.entity.member.MemberDto;
import com.kh.arori.repository.admin.AdminDao;
import com.kh.arori.repository.member.MemberDao;
import com.kh.arori.service.admin.AdminService;


@Controller
@RequestMapping("/admin")
public class AdminController {

	@Autowired
	private MemberDao memberDao;

	@Autowired
	private AdminService adminService;

	@Autowired
	private SqlSession sqlSession;
	
	@Autowired
	private AdminDao adminDao;

	@GetMapping("/main")
	public String adminPage() {
		return "admin/main_admin";
	}

	// 날짜 변수 타입 매핑
	@InitBinder
	protected void initBinder(WebDataBinder binder) {
		DateFormat dateFormat = new SimpleDateFormat("yyyy-mm-dd");
		binder.registerCustomEditor(Date.class, new CustomDateEditor(dateFormat, true));
		// 관리자가 정지일자 입력할때 년,월,일만 작성해도 가능하도록 설정
	}

	// 소셜 + 아로리) 목록조회
	@GetMapping("/resultMap")
	public String resultMap(Model model, Model model2) {

		
		List<MemberDto> result = memberDao.resultMap();
		model.addAttribute("result", result);

		List<MemberDto> result2 = memberDao.resultMap2();
		model.addAttribute("result2", result2);

		return "admin/resultMap";

	}


	// 소셜+아로리) 아이디 단일조회 (관리자만 가능)

	// 소셜 + 아로리) 상세정보변경
	@GetMapping("/adminUpdate/{member_id}")
	public String adminUpdate(@PathVariable(required = false) String member_id, Model model) {
		// 변수가 없어도 적용가능
	

		
		MemberDto memberDto = memberDao.get(member_id);// 회원 아이디 단일조회해서
		model.addAttribute("memberDto", memberDto); // 페이지로 데이터 전달한다.
		
		

		return "admin/adminUpdate";
	}

	// 소셜 + 아로리) 상세정보변경
	@PostMapping("/adminUpdate/{member_id}")
	public String adminEdit(@ModelAttribute MemberDto memberDto) {

		adminService.adminUpdate(memberDto);

		System.out.println("정보수정 성공");

		return "redirect:/";
	}

	
	// 소셜+아로리) 아우터조인 단일조회 + 클래스 개수 전달
	@GetMapping("/memberProfile/{member_no}")
	public String memberProfile(@PathVariable(required = false) int member_no, Model model, Model model2) {
		
		//클래스 개수 전달
		int count = adminDao.classCount(member_no);
		model.addAttribute("count",count);
		
		MemberDto memberDto = memberDao.memberProfile(member_no);
		model.addAttribute("memberDto", memberDto); // 소셜회원 정보전달

		AroriMemberDto memberDto2 = memberDao.memberProfile2(member_no);
		model.addAttribute("memberDto2", memberDto2); // 아로리회원 정보전달

		return "admin/memberProfile";
	}
	// 회원 프로필 보기

	@PostMapping("/memberProfile/{member_no}")
	public String memberProfile(@PathVariable(required = false) int member_no, @ModelAttribute MemberDto memberDto,
			@ModelAttribute AroriMemberDto aroriMemberDto) {

		adminService.memberProfile(member_no); // 소셜회원정보 get

		adminService.memberProfile2(member_no); // 아로리회원정보 get

		return "/memberProfile/{member_no}";
	}

	// 회원탈퇴 시키기

	@GetMapping("/delete")
	public String memberDelete(@ModelAttribute MemberDto memberDto) {

		adminService.delete(memberDto);

		return "admin/delete";
	}
	

	


}
