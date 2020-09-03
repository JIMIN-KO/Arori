package com.kh.arori.controller.admin;

import java.sql.Date;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.List;

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

import com.kh.arori.entity.MemberDto;
import com.kh.arori.repository.member.MemberDao;
import com.kh.arori.service.admin.AdminService;

@Controller
@RequestMapping("/admin")
public class AdminController {

	@Autowired
	private MemberDao memberDao;

	@Autowired
	private AdminService adminService;

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

	// 소셜 + 아로리) 상세정보변경
	@GetMapping("/adminUpdate/{member_id}")
	public String adminUpdate(@PathVariable(required = false) String member_id, Model model) {
							// 변수가 없어도 적용가능

		MemberDto memberDto = memberDao.get(member_id);// 아이디 단일조회해서
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
}
