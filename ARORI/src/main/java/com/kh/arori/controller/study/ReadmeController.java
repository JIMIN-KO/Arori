package com.kh.arori.controller.study;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kh.arori.entity.study.ReadmeDto;
import com.kh.arori.repository.study.ReadmeDao;
import com.kh.arori.service.study.ReadmeService;

@Controller
public class ReadmeController {
	
	@Autowired
	private ReadmeService readmeService;
	
	@Autowired
	private ReadmeDao readmeDao;

	// 클래스 게시판 영역 > Readme / Notice / QNA
	// Readme 페이지 
	@GetMapping("/classes/readme/{c_no}")
	public String readme(@PathVariable String c_no, Model model) {
		ReadmeDto readmeDto = readmeDao.getC(Integer.parseInt(c_no));
		model.addAttribute("readmeDto", readmeDto);
		return "/classes/readme/readme";
	}
	
	// Readme 생성 페이지
	@GetMapping("/classes/readme/create/{c_no}")
	public String readmeEdit(@PathVariable String c_no, Model model) {
		model.addAttribute("c_no", c_no);
		return "/classes/readme/readme_create";
	}
	
	// Read 생성 메소드 
	@PostMapping("classes/readme/create")
	public String readmeCreate(@RequestParam List<String> r_content, @RequestParam String c_no) {
	
		readmeService.create(r_content,c_no);
		
		// 작성 완료되면 readme 페이지로 이동
		return "redirect:/classes/readme/" + c_no;
	}
}
