package com.kh.arori.controller.admin;

import java.sql.Date;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kh.arori.entity.img.This_imgDto;
import com.kh.arori.entity.member.AllMemberDto;
import com.kh.arori.entity.member.AroriMemberDto;
import com.kh.arori.entity.member.MemberDto;
import com.kh.arori.entity.member.ReportDto;
import com.kh.arori.entity.study.ClassesDto;
import com.kh.arori.repository.admin.AdminDao;
import com.kh.arori.repository.member.MemberDao;
import com.kh.arori.repository.report.ReportDao;
import com.kh.arori.service.admin.AdminService;
import com.kh.arori.service.pagination.PaginationService;
import com.kh.arori.service.report.ReportService;
import com.kh.arori.service.today.TodayService;

@Controller
@RequestMapping("/admin")
public class AdminController {

	@Autowired
	private MemberDao memberDao;

	@Autowired
	private AdminService adminService;

	@Autowired
	private SqlSession sqlSession;

	@Autowired
	private AdminDao adminDao;

	@Autowired
	private ReportDao reportDao;

	@Autowired
	private ReportService reportService;

	@Autowired
	PaginationService paginationService;

	@Autowired
	private TodayService todayService;

	@GetMapping("/main")
	public String adminPage(Model model) {

		// 오늘의 아로리
		int[] count = adminService.todayCount();
		model.addAttribute("count", count);

		// 현재 날짜
		String today = todayService.today(-3);

		// 회원 통계
		// 현재로부터 3개월 간의 통계
		Map<String, String[]> memberMap = adminService.thisChart("member", "member_join", today);

		model.addAttribute("memberMap", memberMap);

		// 클래스 통계
		// 현재로부터 3개월 간의 통계
		Map<String, String[]> classesMap = adminService.thisChart("classes", "c_when", today);

		model.addAttribute("classesMap", classesMap);

		return "admin/main_admin";
	}

	@GetMapping("/memberList")
	public String memberList() {
		return "admin/memberList";
	}

	// 날짜 변수 타입 매핑
	@InitBinder
	protected void initBinder(WebDataBinder binder) {
		DateFormat dateFormat = new SimpleDateFormat("yyyy-mm-dd");
		binder.registerCustomEditor(Date.class, new CustomDateEditor(dateFormat, true));
		// 관리자가 정지일자 입력할때 년,월,일만 작성해도 가능하도록 설정
	}

	// 리스트
	@GetMapping("/allList/{pageNo}")
	public String allList(@PathVariable int pageNo, Model model, @ModelAttribute AllMemberDto allMemberDto,
			@ModelAttribute ClassesDto classesDto, @ModelAttribute MemberDto memberDto,
			@RequestParam(required = false) String col, @RequestParam(required = false) String keyword) {
		Map<String, String> map = new HashMap<String, String>();
		map.put("pageNo", String.valueOf(pageNo));
		map.put("col", col);
		map.put("keyword", keyword);
		map.put("start", null);
		map.put("finish", null);

		// 조건에 맞는 게시글 개수 파악을 위한 리스트 조회
		List<AllMemberDto> thisCount = adminDao.page(map);

		// 회원 목록 불러오기
		List<AllMemberDto> list = adminService.page(map);

		// 멤버 인원 조회
		int memberCount = adminService.memberCount();
		model.addAttribute("memberCount", memberCount);

		// 페이지 네이션 조건에 따라 게시글 개수가 다르니 현재 검색 혹은 메인 페이지에 있는 게시글만큼 페이지 네이션 블록 생성
		List<Integer> block = adminService.pagination(thisCount.size(), pageNo);
		// 멤버 게시글 번호
		int index;

		if (col == null && keyword == null) {
			index = thisCount.size();
		} else {
			index = list.size();
		}

		int no = paginationService.no(pageNo, thisCount.size());
		int classCount = adminDao.classCount(classesDto);
		model.addAttribute("classCount", classCount);

		// 페이지 네비게이션에 필요한 뷰젼달
		model.addAttribute("list", list);
		model.addAttribute("block", block);
		model.addAttribute("pageNo", pageNo);
		model.addAttribute("no", no);

		return "admin/allList";

	}

	// 소셜 + 아로리) 상세정보변경
	@GetMapping("/adminUpdate/{member_id}")
	public String adminUpdate(@PathVariable(required = false) String member_id, Model model) {
		// 변수가 없어도 적용가능

		AllMemberDto allMemberDto = memberDao.allGet(member_id);// 회원 아이디 단일조회해서
		model.addAttribute("allMemberDto", allMemberDto); // 페이지로 데이터 전달한다.

		return "admin/adminUpdate";
	}

	// 소셜 + 아로리) 상세정보변경
	@PostMapping("/adminUpdate/{member_id}")
	public String adminUpdate(@ModelAttribute AllMemberDto allMemberDto) {

		adminService.adminUpdate(allMemberDto);

		System.out.println("정보수정 성공");

		return "admin/allList";
	}

	// 소셜+아로리) 아우터조인 단일조회 + 클래스 개수 전달
	@GetMapping("/memberProfile/{member_no}")
	public String memberProfile(@PathVariable(required = false) int member_no, Model model, Model model2) {

		// 클래스 개수 전달
		int count = adminDao.classCount(member_no);
		model.addAttribute("count", count);

		// 회원 이미지 보이도록
		This_imgDto this_imgDto = adminDao.getImage(member_no);
		model.addAttribute("this_imgDto", this_imgDto);

		AllMemberDto allMemberDto = memberDao.memberProfile(member_no);
		model.addAttribute("allMemberDto", allMemberDto); // 소셜회원
		// 아로리회원 정보전달

		return "admin/memberProfile";
	}

	// 회원 프로필 보기
	@PostMapping("/memberProfile/{member_no}")
	public String memberProfile(@PathVariable(required = false) int member_no, @ModelAttribute MemberDto memberDto,
			@ModelAttribute AroriMemberDto aroriMemberDto, @ModelAttribute This_imgDto this_imgDto) {

		adminService.getImage(member_no); // 멤버 이미지 불러오기

		adminService.memberProfile(member_no); // 소셜회원정보 get

		return "/memberProfile/{member_no}";
	}

	// 회원탈퇴 시키기
	@GetMapping("/delete/{member_no}")
	public String memberDelete(@PathVariable int member_no) {
		System.out.println();
		adminDao.delete(member_no);

		return "redirect:/admin/allList";
	}

	// 신고글 리스트
	@GetMapping("/report_list/{pageNo}")
	public String list(@PathVariable int pageNo, Model model, @ModelAttribute ReportDto reportDto,
			@RequestParam(required = false) String col, @RequestParam(required = false) String keyword) {

		Map<String, String> map = new HashMap<String, String>();
		map.put("pageNo", String.valueOf(pageNo));
		map.put("col", col);
		map.put("keyword", keyword);
		map.put("start", null);
		map.put("finish", null);

		// 조건에 맞는 게시글 개수 파악을 위한 리스트 조회
		List<ReportDto> thisCount = reportDao.page(map);

		// 신고글 목록 불러오기
		List<ReportDto> list = reportService.page(map);

		// 신고글 개수 조회 (관리자가 보기위한)
		int reportCount = reportDao.reportCount();
		model.addAttribute("reportCount", reportCount);

		// 페이지네이션
		List<Integer> block = reportService.pagination(thisCount.size(), pageNo);

		// 신고 게시글 번호

		int index;

		if (col == null && keyword == null) {
			index = thisCount.size();
		} else {
			index = list.size();
		}

		int no = paginationService.no(pageNo, thisCount.size());

		// 페이지 네비게이션에 필요한 뷰젼달
		model.addAttribute("list", list);
		model.addAttribute("block", block);
		model.addAttribute("pageNo", pageNo);
		model.addAttribute("no", no);

		return "admin/report_list";
	}

}
