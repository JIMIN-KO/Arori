package com.kh.arori.controller.admin;

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

import com.kh.arori.entity.member.MemberDto;
import com.kh.arori.entity.study.ReadmeDto;
import com.kh.arori.repository.admin.AdminReadmeDao;
import com.kh.arori.service.admin.AdminReadmeService;
import com.kh.arori.service.pagination.PaginationService;

@Controller
@RequestMapping("/admin")
public class AdminReadmeController {

	@Autowired
	private AdminReadmeDao adminReadmeDao;

	@Autowired
	private AdminReadmeService adminReadmeService;

	@Autowired
	private PaginationService paginationService;

	@GetMapping("/readmeList/{pageNo}")
	public String adminReadmeList(@PathVariable int pageNo, @RequestParam(required = false) String col,
			@RequestParam(required = false) String keyword, Model model) {

		// 1. 처음 메인 페이지를 위한 더미 객체 생성
		Map<String, String> map = new HashMap<String, String>();
		map.put("pageNo", String.valueOf(pageNo));
		map.put("col", col);
		map.put("keyword", keyword);
		map.put("start", null);
		map.put("finish", null);

		// 동적으로 변하는 조건에 맞는 게시글 갯수 파악을 위한 리스트 조회
		List<ReadmeDto> thisCount = adminReadmeDao.getP(map);

		// 2. 페이지 네이션이 되어서 한 페이지에 보여야 할 게시글들
		List<ReadmeDto> list = adminReadmeService.getP(map);

		// 3. 리드미 전체 게시글 카운트 -> 화면에 현재 몇개의 게시글이 있는지 확인용
		List<ReadmeDto> listSize = adminReadmeDao.adminReadmeList();
		int readmeCount = listSize.size();

		// 페이지 네이션 > 조건에 따라 게시글 개수가 다르니 현재 검색 혹은 메인 페이지에 있는 게시글만큼 페이지네이션 블록 생성
		List<Integer> block = adminReadmeService.block(thisCount.size(), pageNo);

		int no = paginationService.no(pageNo, thisCount.size());

		// 1) 페이지에 보여야 할 게시글들 list
		model.addAttribute("list", list);
		// 2) 현재 전체 Readme 게시글 수
		model.addAttribute("readmeCount", readmeCount);
		// 3) 메인 페이지 혹은 검색 결과에 따른 페이지네이션 블럭 개수
		model.addAttribute("block", block);
		// 4) 메인 페이지 및 검색 결과에 따른 게시글 개수 (표에서 게시글 번호로 붙을 아이)
		model.addAttribute("no", no);

		return "admin/readme/readme_list";
	}

	// 리드미 게시글 관리자 수정
	@GetMapping("/readmeEditAdmin/{c_no}/{r_no}")
	public String readmeEditAdmin(@PathVariable int c_no, @PathVariable int r_no, Model model) {
		// PathVariable 로 받아온 매개변수 객체화
		ReadmeDto readmeDto = ReadmeDto.builder().c_no(c_no).r_no(r_no).build();

		// 해당 게시글 데이터 조회
		readmeDto = adminReadmeDao.getCR(readmeDto);

		// Model 로 해당 데이터 전송
		model.addAttribute("readmeDto", readmeDto);

		return "admin/readme/edit_readme_admin";
	}

	// 리드미 게시글 수정 기능
	@PostMapping("/readmeEditAdmin")
	public String readmeEditAdmin(@RequestParam List<String> content, @ModelAttribute ReadmeDto readmeDto) {

		// 객체 > Service 에서 수정 후 URL 받아오기
		String result = adminReadmeService.editReadmeAdmin(content, readmeDto);

		return result;
	}

	// 리드미 게시글 관리자 삭제
	@GetMapping("/readmeDeleteAdmin/{c_no}/{r_no}")
	public String readmeDeleteAdmin(@PathVariable int c_no, @PathVariable int r_no, HttpSession session) {
		// 로그인한 회원정보
		MemberDto userinfo = (MemberDto) session.getAttribute("userinfo");
		// PathVariable 객체화
		ReadmeDto readmeDto = ReadmeDto.builder().c_no(c_no).r_no(r_no).build();

		// 삭제 기능
		String result = adminReadmeService.deleteAdmin(readmeDto, userinfo.getMember_auth());

		return result;
	}

	// 리드미 게시글 관리자 상세보기
	@GetMapping("/readmeDetail/{c_no}/{r_no}")
	public String readmeDetail(@PathVariable int c_no, @PathVariable int r_no, Model model) {

		// c_no + r_no 조회
		ReadmeDto readmeDto = ReadmeDto.builder().c_no(c_no).r_no(r_no).build();
		readmeDto = adminReadmeDao.getCR(readmeDto);
		model.addAttribute("readmeDto", readmeDto);

		return "admin/readme/readme_detail";
	}

}
