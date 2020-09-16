package com.kh.arori.controller.admin;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/admin")
public class AdminController {

	@GetMapping("/main")
	public String adminPage() {
		return "admin/main_admin";
	}
	
	// 클래스 목록 조회
	
	// 클래스 수정
	// 클래스 삭제
	// 클래스 검색

	
}
