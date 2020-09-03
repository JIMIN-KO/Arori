package com.kh.arori.controller.study;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.print.attribute.HashAttributeSet;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kh.arori.entity.MemberDto;
import com.kh.arori.entity.study.ClassesDto;
import com.kh.arori.entity.study.McDto;
import com.kh.arori.repository.study.ClassesDao;
import com.kh.arori.service.study.ClassesService;

@Controller
public class ClassesController {

	@Autowired
	private ClassesService classesService;

	@Autowired
	private ClassesDao classesDao;

//	// 나의 클래스
//	@RequestMapping ("/classes/myclass")
//	public String myclass() {
//		return "classes/myclass";
//	}

	@GetMapping("/classes/create")
	public String create() {
		return "classes/create";
	}

	// 클래스 생성
	@PostMapping("/classes/create")
	public String create(@ModelAttribute ClassesDto classesDto, HttpSession session) {
		// 세션(userinfo) 를 MemberDto 로 받아온다.
		MemberDto memberDto = (MemberDto) session.getAttribute("userinfo");
		classesDto.setMember_no(memberDto.getMember_no());
		int c_no = classesService.createClasses(classesDto);
		return "redirect:detail/" + c_no; // == http:/localhost:8080/arori/classes/classDetail/클래스 번호
	}

	// 내가 만든 클래스 디테일 페이지
	@GetMapping("/classes/detail/{c_no}")
	public String detail(@PathVariable String c_no, Model model, HttpSession session) {
		// 매개변수로 받아온 클래스 번호에 대한 디비 정보를 dao 혹은 service 를 통해서 받아온다.(classesDto 단일조회)
		// 받아온 classesDto 를 model 로 보낸다.
		// 클래스 넘버를 이용한 단일조회
		ClassesDto classesDto = classesDao.get(Integer.parseInt(c_no));
		model.addAttribute("c_no", c_no);
		model.addAttribute("classesDto", classesDto);

		return "classes/detail";
	}

	// 클래스 수정
	@GetMapping("/classes/edit/{c_no}") // get매핑일때는 정보 필요없엉
	public String edit(@PathVariable String c_no, Model model) {

		// 받아온 c_no로 정보를 조회후 classesDto에 저장
		ClassesDto classesDto = classesDao.get(Integer.parseInt(c_no));
		model.addAttribute("classesDto", classesDto);

		return "classes/edit";
	}

	@PostMapping("/classes/edit")
	public String edit(@ModelAttribute ClassesDto classesDto) {
	
		classesDao.edit(classesDto);
		
		return "redirect:detail/" + classesDto.getC_no();
	}
	
	// 나의 클래스 목록
	@RequestMapping("/classes/myclass")
	public String list(Model model, HttpSession session, @ModelAttribute ClassesDto classesDto) {

		// member_no 받아내기
		MemberDto memberDto = (MemberDto) session.getAttribute("userinfo");
		int member_no = memberDto.getMember_no();

		// 나의 클래스 불러오는 메소드 실행
		List<ClassesDto> list = classesDao.myList(member_no);		
		model.addAttribute("list",list);
		
		return "classes/myclass";
	}
	
	// 클래스 삭제
	@GetMapping("/classes/delete/{c_no}")
	public String delete(@PathVariable int c_no) {

		classesDao.delete(c_no);
		return "redirect:/classes/myclass";
	}
}
