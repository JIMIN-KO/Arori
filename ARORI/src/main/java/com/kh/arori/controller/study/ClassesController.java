package com.kh.arori.controller.study;

import javax.servlet.http.HttpSession;

<<<<<<< HEAD
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

import com.kh.arori.entity.MemberDto;
import com.kh.arori.entity.study.ClassesDto;
import com.kh.arori.service.study.ClassesService;

@Controller
public class ClassesController {

	@Autowired
	private ClassesService classesService;

	// 나의 클래스 
	@GetMapping("/classes/myclass")
	public String myclass() {
		return "classes/myclass";
	}
	
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
	public String detail(@PathVariable int c_no, Model model) {
		// 매개변수로 받아온 클래스 번호에 대한 디비 정보를 dao 혹은 service 를 통해서 받아온다.(classesDto 단일조회)
		// 받아온 classesDto 를 model 로 보낸다.
		model.addAttribute("c_no", c_no);
		return "classes/detail";
	}

}
=======
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

import com.kh.arori.entity.MemberDto;
import com.kh.arori.entity.study.ClassesDto;
import com.kh.arori.repository.study.ClassesDao;
import com.kh.arori.service.study.ClassesService;

@Controller
public class ClassesController {

	@Autowired
	private ClassesService classesService;
	
	@Autowired
	private SqlSession sqlSession;
	
	@Autowired
	private ClassesDao classesDao;

	// 나의 클래스 
	@GetMapping("/classes/myclass")
	public String myclass() {
		return "classes/myclass";
	}

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
	public String detail(@PathVariable int c_no, Model model, HttpSession session) {
		// 매개변수로 받아온 클래스 번호에 대한 디비 정보를 dao 혹은 service 를 통해서 받아온다.(classesDto 단일조회)
		// 받아온 classesDto 를 model 로 보낸다.
		model.addAttribute("c_no", c_no);
		// 클래스 넘버를 이용한 단일조회
		ClassesDto classesDto = classesDao.get(c_no);
		model.addAttribute("classesDto", classesDto);
		
		// 회원 넘버를 이용한 단일 조회
		MemberDto memberDto = (MemberDto) session.getAttribute("userinfo");
		
		return "classes/detail";
	}

} 
