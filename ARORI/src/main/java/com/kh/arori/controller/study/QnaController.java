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
import com.kh.arori.entity.study.QnaDto;
import com.kh.arori.repository.study.ClassesDao;
import com.kh.arori.repository.study.QnaDao;
import com.kh.arori.service.study.QnaService;

@Controller
public class QnaController {
	
	@Autowired
	private ClassesDao classesDao;
	
	@Autowired
	private QnaDao qnaDao;
	
	@Autowired
	private QnaService qnaService;

	//QNA작성 페이지 새글
	@GetMapping("/classes/qna/create/{c_no}")
	public String qnaCreate(@PathVariable String c_no, Model model) {
		model.addAttribute("c_no",c_no);
		return "classes/qna/qna_create";
	}	
	// QNA 작성 새글
	@PostMapping("/classes/qna/create")
	public String qnaCreate(@RequestParam List<String> qna_content, @RequestParam String c_no, 
			@RequestParam String qna_title, @RequestParam String member_no) {
		qnaService.create(qna_content, c_no, qna_title, member_no);
		return "redirect:" + c_no + "/8";
	}
	
	
	// QNA 작성 페이지 덧글
	//@GetMapping(/classes/qna/create/{c_no}/{qna_no})
	
	
	
	// QNA 게시글 리스트
//		@GetMapping("/classes/qna/{c_no}/{pageNo}")
//		public String qnaList(@PathVariable String c_no, @PathVariable int pageNo, Model model) {
//			// 권한 조회를 위한 해당 클래스 단일 조회
//			ClassesDto classes = classesDao.get(Integer.parseInt(c_no));
//			// 공지 게시글 불러오기
//			List<QnaDto> list = qnaService.getP(c_no, pageNo);
//
//			// 페이지 네비게이터 계산
//			List<Integer> block = qnaService.pagination(Integer.parseInt(c_no), pageNo);
//
//			// VIEW 로 던질 모델 (게시글 / 해당 클래스 정보)
//			model.addAttribute("list", list);
//			model.addAttribute("classes", classes);
//			model.addAttribute("block", block);
//
//			return "classes/qna/notice_list";
//		}
	
}
