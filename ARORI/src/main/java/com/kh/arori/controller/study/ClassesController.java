package com.kh.arori.controller.study;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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

import com.kh.arori.entity.img.This_imgDto;
import com.kh.arori.entity.member.MemberDto;
import com.kh.arori.entity.study.ClassesDto;
import com.kh.arori.repository.img.ImgDao;
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
	
	@Autowired
	private ImgDao imgDao;
	
	// 클래스 생성 페이지 
	@GetMapping("/classes/create")
	public String create() {		
		
		return "classes/create";
	}

	// 클래스 생성 기능 
	@PostMapping("/classes/create")
	public String create(@ModelAttribute ClassesDto classesDto,HttpSession session) {
	
		// 세션(userinfo) 를 MemberDto 로 받아온다.
		MemberDto memberDto = (MemberDto) session.getAttribute("userinfo");
		classesDto.setMember_no(memberDto.getMember_no());
		int c_no = classesService.createClasses(classesDto);
		System.out.println("c_no = "+c_no);
		return "redirect:readme/" + c_no;
	}

	// 클래스 디테일 페이지
	@GetMapping("/classes/detail/{c_no}/{img_no}")
	public String detail(@PathVariable int c_no, @PathVariable int img_no, Model model, HttpSession session) {

		model.addAttribute("c_no", c_no);
		// 클래스 넘버를 이용한 단일조회
		ClassesDto classesDto = classesDao.get(c_no);
		model.addAttribute("classesDto", classesDto);
		
		// 멤버넘버를 이용한 단일조회로 memberDto 보내기
		int member_no = classesDto.getMember_no();
		MemberDto memberDto = memberDao.getNo(member_no);
		model.addAttribute("memberDto", memberDto);
		
		// 이미지 번호 던지기 
		model.addAttribute("img_no", img_no);
		
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
	public String edit(@ModelAttribute ClassesDto classesDto, int member_no) {
	
		classesDao.edit(classesDto);
		
		//return "redirect:detail/" + classesDto.getC_no();
		
		return "redirect:myclass/"+member_no;
	}
	
//	// 클래스 목록
//	@RequestMapping("/classes/myclass/{member_no}")
//	public String list(@PathVariable int member_no, Model model, HttpSession session, @ModelAttribute ClassesDto classesDto) {
//		// member_no 받아내기
//		// MemberDto memberDto = (MemberDto) session.getAttribute("userinfo");
//		//int member_no = memberDto.getMember_no();
//
//		// 나의 클래스 불러오는 메소드 실행
//		List<ClassesDto> list = classesDao.myList(member_no);		
//		model.addAttribute("list",list);
//		return "classes/myclass";
//	}
	
	// 마이클래스 페이지 
	@RequestMapping("/classes/myclass/{member_no}")
	public String list(@PathVariable String member_no, Model model, HttpSession session, @ModelAttribute ClassesDto classesDto,
			@RequestParam(required = false, defaultValue = "c_when") String col,
			@RequestParam(required = false, defaultValue = "DESC") String order
			) {
		// member_no 받아내기
		// MemberDto memberDto = (MemberDto) session.getAttribute("userinfo");
		//int member_no = memberDto.getMember_no();
		// /arori/classes/myclass/1?col=c_no&order=asc

		Map<String, String> map = new HashMap<>();
		map.put("key", "member_no");
		map.put("value",member_no);
		map.put("col", col);
		map.put("order", order);
		
		boolean isNew = col.equals("c_when_new");
		if(isNew) {
			col="c_when";
			order="DESC";
		} else {
			col="c_when";
			order="ASC";
		}	
		
		List<ClassesDto> list = classesDao.getLlist2(map);
		List<ClassesDto> list2 = new ArrayList<ClassesDto>();
		for(int i = 0; i < list.size(); i++) {
			This_imgDto this_imgDto = This_imgDto.builder().this_no(list.get(i).getC_no()).table_name("classes").build();
			List<This_imgDto> img_list = imgDao.get2(this_imgDto);
			
			ClassesDto classes = list.get(i);
			if(!img_list.isEmpty()) {
				 classes.setImg_no(img_list.get(i).getAi_no());
			}

			list2.add(classes);
		}
		
		model.addAttribute("classesDto", list2);
		
		return "classes/myclass";
	}
	
	// 다양한 기준의 정렬 목록

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
		
		return "classes/detail";
	}
	
	// 구독 목록
	@RequestMapping("/classes/mySub/{member_no}")
	public String mySub(@PathVariable int member_no, Model model, HttpSession session, @ModelAttribute ClassesDto classesDto) {

		// userinfo에서 현재 로그인한 계정의 no를 csDto에 저장
		MemberDto memberDto = (MemberDto)session.getAttribute("userinfo");
		int user_no = memberDto.getMember_no();	
		System.out.println("member_no = "+user_no);
		classesDto.setMember_no(user_no);
		// 구독한 목록 호출
		List<ClassesDto> list = classesDao.mySub(member_no);
		model.addAttribute("classesDto", list);
		
		return "classes/mySub";
	}
	
	@RequestMapping("/classes/img/setting")
	public String imgCreate() {
		return "classes/img_create";
	}
	
}
