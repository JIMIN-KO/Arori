package com.kh.arori.controller.study;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kh.arori.entity.member.MemberDto;
import com.kh.arori.entity.study.ClassesDto;
import com.kh.arori.entity.study.ReadmeDto;
import com.kh.arori.repository.study.ClassesDao;
import com.kh.arori.repository.study.ReadmeDao;
import com.kh.arori.service.study.ReadmeService;

@Controller
public class ReadmeController {

	@Autowired
	private ReadmeService readmeService;

	@Autowired
	private ClassesDao classesDao;
	
	@Autowired
	private ReadmeDao readmeDao;

	// 클래스 게시판 영역 > Readme / Notice / QNA
	// Readme 페이지
	@GetMapping("/classes/readme/{c_no}")
	public String readme(@PathVariable String c_no, Model model) {
		ClassesDto classesDto = classesDao.get(Integer.parseInt(c_no));
		model.addAttribute("classesDto", classesDto);
		
		ReadmeDto readmeDto = readmeDao.getC(Integer.parseInt(c_no));
		model.addAttribute("readmeDto", readmeDto);
		return "/classes/readme/readme";
	}

	// Readme 생성 페이지
	@GetMapping("/classes/readme/create/{c_no}")
	public String readmeCreate(@PathVariable String c_no, Model model) {
		ReadmeDto readme = readmeDao.getC(Integer.parseInt(c_no));

		if (readme != null) {
			return "redirect:/classes/readme/" + c_no + "?fail";
		} else {
			model.addAttribute("c_no", c_no);
			return "/classes/readme/readme_create";
		}
	}

	// Read 생성 메소드
	@PostMapping("/classes/readme/create")
	public String readmeCreate(@RequestParam List<String> r_content, @RequestParam String c_no) {

		boolean condition = readmeService.create(r_content, c_no);
		if (condition) {
			// 작성 완료되면 readme 페이지로 이동
			return "redirect:/classes/readme/" + c_no;
		} else {
			return "redirect:/classes/readme/" + c_no + "?fail";
		}
	}

	// Readme 수정 페이지
	@GetMapping("/classes/readme/edit/{c_no}")
	public String readmeEdit(@PathVariable String c_no, Model model) {
		// 수정 내용 View 로 내보내기 위한 단일 조회
		ReadmeDto readmeDto = readmeDao.getC(Integer.parseInt(c_no));
		model.addAttribute("readmeDto", readmeDto);
		return "classes/readme/readme_edit";
	}

	// Readme 수정 메소드
	@PostMapping("/classes/readme/edit")
	public String readmeEdit(@RequestParam List<String> r_content, @RequestParam String c_no) {
		// 수정
		String result = readmeService.edit(r_content, c_no);

		return result;
	}

	// Readme 삭제 메소드
	@RequestMapping("/classes/readme/delete/{c_no}")
	public String readmeDelete(@PathVariable String c_no, HttpSession session) {
		// 세션에서 로그인 정보 가지고 오기 
		MemberDto userinfo = (MemberDto) session.getAttribute("userinfo");
		// 삭제 후 경로 반환 
		String result = readmeService.delete(userinfo.getMember_no(), c_no);

		return result;
	}
}
