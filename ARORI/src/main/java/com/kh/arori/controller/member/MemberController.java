package com.kh.arori.controller.member;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.arori.interceptor.Member;

@Controller
@RequestMapping("/member")
public class MemberController {
	
	// 로그아웃
	@Member
	@RequestMapping("/logout")
	public String logout(HttpSession session) {
		session.removeAttribute("userinfo");
		return "redirect:/";
	}
}
