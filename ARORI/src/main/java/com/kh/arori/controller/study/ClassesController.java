package com.kh.arori.controller.study;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.arori.entity.member.MemberDto;
import com.kh.arori.entity.study.ClassesDto;
import com.kh.arori.entity.study.SubscribeDto;
import com.kh.arori.repository.member.MemberDao;
import com.kh.arori.repository.study.ClassesDao;
import com.kh.arori.service.study.ClassesService;


@Controller
public class ClassesController {

	@Autowired
	private ClassesService classesService;

	@Autowired
	private ClassesDao classesDao;
	
	@Autowired
	private MemberDao memberDao;

	// 클래스 생성 페이지 
	@GetMapping("/classes/create")
	public String create() {
		return "classes/create";
	}

	// 클래스 생성 기능 
	@PostMapping("/classes/create")
	public String create(@ModelAttribute ClassesDto classesDto, HttpSession session) {
		// 세션(userinfo) 를 MemberDto 로 받아온다.
		MemberDto memberDto = (MemberDto) session.getAttribute("userinfo");
		classesDto.setMember_no(memberDto.getMember_no());
		int c_no = classesService.createClasses(classesDto);
		return "redirect:detail/" + c_no;
	}

	// 클래스 디테일 페이지
	@GetMapping("/classes/detail/{c_no}")
	public String detail(@PathVariable int c_no, Model model, HttpSession session) {

		model.addAttribute("c_no", c_no);
		// 클래스 넘버를 이용한 단일조회
		ClassesDto classesDto = classesDao.get(c_no);
		model.addAttribute("classesDto", classesDto);
		
		// 멤버넘버를 이용한 단일조회로 memberDto 보내기
		int member_no = classesDto.getMember_no();
		MemberDto memberDto = memberDao.getNo(member_no);
		model.addAttribute("memberDto", memberDto);
		
		return "classes/detail";
	}

	// 클래스 수정 페이지 
	@GetMapping("/classes/edit/{c_no}") // get매핑일때는 정보 필요없엉
	public String edit(@PathVariable String c_no, Model model) {

		// 받아온 c_no로 정보를 조회후 classesDto에 저장
		ClassesDto classesDto = classesDao.get(Integer.parseInt(c_no));
		model.addAttribute("classesDto", classesDto);

		return "classes/edit";
	}

	// 클래스 수정 기능 
	@PostMapping("/classes/edit")
	public String edit(@ModelAttribute ClassesDto classesDto) {
	
		classesDao.edit(classesDto);
		
		return "redirect:detail/" + classesDto.getC_no();
	}
	
	// 클래스 목록
	@RequestMapping("/classes/myclass/{member_no}")
	public String list(@PathVariable int member_no, Model model, HttpSession session, @ModelAttribute ClassesDto classesDto) {
		// member_no 받아내기
		// MemberDto memberDto = (MemberDto) session.getAttribute("userinfo");
		//int member_no = memberDto.getMember_no();

		// 나의 클래스 불러오는 메소드 실행
		List<ClassesDto> list = classesDao.myList(member_no);		
		model.addAttribute("list",list);
		return "classes/myclass";
	}

	// 클래스 삭제
	@GetMapping("/classes/delete/{c_no}")
	public String delete(@PathVariable int c_no, HttpSession session) {
		MemberDto userinfo = (MemberDto) session.getAttribute("userinfo");
		classesDao.delete(c_no);
		return "redirect:/classes/myclass/" + userinfo.getMember_no();
	}
	
	// 구독
	@GetMapping("/classes/subscribe/{c_no}")
	public String sub(@PathVariable int c_no, @PathVariable int member_no,Model model, HttpSession session) {

		SubscribeDto subDto = SubscribeDto.builder().c_no(c_no).member_no(member_no).build();
		// 시퀀스 발급
		int sub_no = classesDao.getsubSeq();	
		subDto.setSub_no(sub_no);
		System.out.println("시퀀스 번호 = "+sub_no);
		// 구독
		classesDao.sub(subDto);
		
		// 클래스 넘버를 이용한 단일조회
		ClassesDto classesDto = classesDao.get(c_no);
		model.addAttribute("classesDto", classesDto);
		
		// 멤버넘버를 이용한 단일조회로 memberDto 보내기
		MemberDto memberDto = memberDao.getNo(member_no);
		model.addAttribute("memberDto", memberDto);
		
		System.out.println("c_no = "+c_no);
		System.out.println("member_no = "+member_no);
		
		return "classes/detail";
	}
	
	// 구독
	@PostMapping("/classes/subscribe")
	public String sub2(Model model, HttpSession session, @ModelAttribute SubscribeDto subDto) {

		// 시퀀스 발급
		int sub_no = classesDao.getsubSeq();	
		subDto.setSub_no(sub_no);
		System.out.println("시퀀스 번호 = "+sub_no);
		System.out.println(subDto.getMember_no());
		System.out.println(subDto.getC_no());
		
		// 구독
		classesDao.sub(subDto);
			
		// 클래스 넘버를 이용한 단일조회
		ClassesDto classesDto = classesDao.get(subDto.getC_no());
		model.addAttribute("classesDto", classesDto);
			
		// 멤버넘버를 이용한 단일조회로 memberDto 보내기
		int member_no = classesDto.getMember_no();
		MemberDto memberDto = memberDao.getNo(member_no);
		model.addAttribute("memberDto", memberDto);
			
		System.out.println("c_no = " + subDto.getC_no());
		System.out.println("member_no = "+member_no);
			
		return "classes/detail";
		}
		
}
