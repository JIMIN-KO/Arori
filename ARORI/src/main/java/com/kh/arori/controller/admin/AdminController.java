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
	
	@GetMapping("/memberList")
	public String memberList() {
		return "admin/memberList";
	}
	
}
