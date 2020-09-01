package com.kh.arori.controller.study;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

@Controller
public class NoticeController {

	@GetMapping("/classes/notice/{c_no}")
	public String noticeList(@PathVariable String c_no, Model model) {
		model.addAttribute("c_no", c_no);
		return "classes/notice/notice_list";
	}
}
