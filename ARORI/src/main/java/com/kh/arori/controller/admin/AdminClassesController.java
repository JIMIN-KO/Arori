package com.kh.arori.controller.admin;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.arori.entity.member.AllMemberDto;
import com.kh.arori.entity.study.ClassesDto;
import com.kh.arori.entity.study.QnaDto;
import com.kh.arori.repository.study.ClassesDao;
import com.kh.arori.repository.study.QnaDao;
import com.kh.arori.service.admin.AdminClassesService;
import com.kh.arori.service.study.QnaService;

@Controller
@RequestMapping("/admin")
public class AdminClassesController {
	
	@Autowired
	private ClassesDao classesDao;

	@Autowired
	private QnaDao qnaDao;

	@Autowired
	private AdminClassesService adminClassesService;
	
	// QNA 관리자 리스트 
	@GetMapping("/qnaList")
	public String qnaList(Model model, @ModelAttribute QnaDto qnaDto, @ModelAttribute ClassesDto classesDto,
			@ModelAttribute AllMemberDto allMemberDto) {
		
		List<QnaDto> list =  adminClassesService.qnaList();
		model.addAttribute("list", list);
		

//		// 페이지 네비게이터 계산
//		List<Integer> block = adminClassesService.getP(Integer.parseInt(pageNo));
//		
//		model.addAttribute("list", list);
//		model.addAttribute("block", block);
		
		return "admin/classes/qna_list";
	}

	

}
