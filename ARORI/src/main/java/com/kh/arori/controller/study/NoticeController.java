package com.kh.arori.controller.study;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kh.arori.entity.study.ClassesDto;
import com.kh.arori.entity.study.NoticeDto;
import com.kh.arori.repository.study.ClassesDao;
import com.kh.arori.repository.study.NoticeDao;
import com.kh.arori.service.study.NoticeService;

@Controller
public class NoticeController {

	@Autowired
	private ClassesDao classesDao;
	
	@Autowired
	private NoticeDao noticeDao;

	@Autowired
	private NoticeService noticeService;

	// 공지 게시글 리스트 (공지 게시판)
	@GetMapping("/classes/notice/{c_no}/{pageNo}")
	public String noticeList(@PathVariable String c_no, @PathVariable int pageNo, Model model) {
		// 권한 조회를 위한 해당 클래스 단일 조회
		ClassesDto classes = classesDao.get(Integer.parseInt(c_no));
		// 공지 게시글 불러오기
		List<NoticeDto> list = noticeService.getP(c_no, pageNo);

		// 페이지 네비게이터 계산
		List<Integer> block = noticeService.pagination(Integer.parseInt(c_no), pageNo);

		// VIEW 로 던질 모델 (게시글 / 해당 클래스 정보)
		model.addAttribute("list", list);
		model.addAttribute("classes", classes);
		model.addAttribute("block", block);

		return "classes/notice/notice_list";
	}

	// 공지 게시글 작성 페이지
	@GetMapping("/classes/notice/create/{c_no}")
	public String noticeCreate(@PathVariable String c_no, Model model) {
		model.addAttribute("c_no", c_no);
		return "classes/notice/notice_create";
	}

	// 공지 게시글 작성 기능
	@PostMapping("/classes/notice/create")
	public String noticeCreate(@RequestParam List<String> n_content, @RequestParam String c_no,
			@RequestParam String n_title) {
		noticeService.create(n_content, c_no, n_title);

		for(String a : n_content) {
			System.out.println(a);
		}
		return "redirect:" + c_no + "/1";
	}
	
	// 공지 게시글 수정 페이지 
	@GetMapping("/classes/notice/edit/{c_no}/{n_no}")
	public String noticeEdit(@PathVariable String c_no, @PathVariable String n_no, Model model) {
		// PathVariable 로 받아온 매개변수 객체화 
		NoticeDto oldNotice = NoticeDto.builder().c_no(Integer.parseInt(c_no)).n_no(Integer.parseInt(n_no)).build();
		
		// 해당 게시글 데이터 조회 
		NoticeDto noticeDto = noticeDao.getCN(oldNotice);
		
		// Model 로 해당 데이터 전송 
		model.addAttribute("noticeDto", noticeDto);
		
		return "classes/notice/notice_edit";
	}
	
	// 공지 게시글 수정 기능 
	@PostMapping("/classes/notice/edit")
	public String noticeEdit(@RequestParam List<String> n_content, @RequestParam String c_no, @RequestParam String n_no, @RequestParam String n_title) {
		// RequestParam 으로 받아온 데이터 객체화 
		NoticeDto noticeDto = NoticeDto.builder().c_no(Integer.parseInt(c_no)).n_no(Integer.parseInt(n_no)).n_title(n_title).build();
		
		// 객체 > Service 에서 수정 후 URL 받아오기 
		String result = noticeService.edit(n_content, noticeDto);
		
		return result;
	}
}
