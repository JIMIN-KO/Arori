package com.kh.arori.controller.study;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kh.arori.entity.study.NoticeDto;
import com.kh.arori.service.study.NoticeService;

@Controller
public class NoticeController {

	@Autowired
	private NoticeService noticeService;
	
	// 공지 게시글 리스트 (공지 게시판)
	@GetMapping("/classes/notice/{c_no}")
	public String noticeList(@PathVariable String c_no, Model model) {
		model.addAttribute("c_no", c_no);
		return "classes/notice/notice_list";
	}
	
	// 공지 게시글 작성 페이지 
	@GetMapping("classes/notice/create/{c_no}")
	public String noticeCreate(@PathVariable String c_no, Model model) {
		model.addAttribute("c_no", c_no);
		return "classes/notice/notice_create";
	}
	
	
	// 공지 게시글 작성 기능 
	@PostMapping("classes/notice/create")
	public String noticeCreate(@RequestParam List<String> n_content, @RequestParam String c_no, @RequestParam String n_title) {
		noticeService.create(n_content, c_no, n_title);
		return "redirect:notice/" + c_no;
	}
}
