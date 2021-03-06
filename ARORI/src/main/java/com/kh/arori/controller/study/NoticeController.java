package com.kh.arori.controller.study;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kh.arori.entity.member.MemberDto;
import com.kh.arori.entity.study.ClassesDto;
import com.kh.arori.entity.study.NoticeDto;
import com.kh.arori.repository.study.ClassesDao;
import com.kh.arori.repository.study.NoticeDao;
import com.kh.arori.service.pagination.PaginationService;
import com.kh.arori.service.study.NoticeService;

@Controller
public class NoticeController {

	@Autowired
	private ClassesDao classesDao;

	@Autowired
	private NoticeDao noticeDao;

	@Autowired
	private NoticeService noticeService;

	@Autowired
	private PaginationService paginationService;

	// 공지 게시글 리스트 (공지 게시판)
	@GetMapping("/classes/notice/{c_no}/{pageNo}")
	public String noticeList(@PathVariable String c_no, @PathVariable int pageNo, Model model) {
		// 권한 조회를 위한 해당 클래스 단일 조회
		ClassesDto classes = classesDao.get(Integer.parseInt(c_no));
		// 공지 게시글 불러오기
		List<NoticeDto> list = noticeService.getP(c_no, pageNo);

		// 페이지 네비게이터 계산
		List<Integer> block = noticeService.pagination(Integer.parseInt(c_no), pageNo);


		// 임시 저장 데이터 조회
		List<NoticeDto> temp = noticeDao.getCT(Integer.parseInt(c_no));
		if (temp != null) {
			model.addAttribute("temp", temp);
		}

		// 페이지 네이션 계산 정보
		Map<String, Integer> pagination = paginationService.pagination("c_no", Integer.parseInt(c_no), pageNo);
		
		// 게시글 번호
		int count = noticeDao.count(Integer.parseInt(c_no));
		int no = paginationService.no(pageNo, count);
		
		// VIEW 로 던질 모델 (게시글 / 해당 클래스 정보)
		model.addAttribute("list", list);
		model.addAttribute("classes", classes);
		model.addAttribute("block", block);
		model.addAttribute("start", pagination.get("start"));
		model.addAttribute("pageNo", pageNo);
		model.addAttribute("no", no);

		return "classes/notice/notice_list";
	}

	// 공지 게시글 작성 페이지
	@GetMapping("/classes/notice/create/{c_no}")
	public String noticeCreate(@PathVariable String c_no, Model model) {

		// 작성 페이지를 들어오면 해당 게시글 데이터 INSERT
		int n_no = noticeService.create(c_no);

		// 매개변수 c_no 와 더미 데이터 생성 시 발급받은 고유 번호 객체화
		NoticeDto noticeDto = NoticeDto.builder().c_no(Integer.parseInt(c_no)).n_no(n_no).build();

		// 해당 jsp 파일로 전달
		model.addAttribute("noticeDto", noticeDto);

		return "classes/notice/notice_create";
	}

	// 공지 게시글 수정 페이지
	@GetMapping("/classes/notice/edit/{c_no}/{n_no}")
	public String noticeEdit(@PathVariable String c_no, @PathVariable String n_no, Model model) {
		// PathVariable 로 받아온 매개변수 객체화
		NoticeDto oldNotice = NoticeDto.builder().c_no(Integer.parseInt(c_no)).n_no(Integer.parseInt(n_no)).build();

		// 해당 게시글 데이터 조회
		NoticeDto noticeDto = noticeDao.getCN(oldNotice);

		List<NoticeDto> temp = noticeDao.getTemp(noticeDto);
		if (temp != null) {
			model.addAttribute("temp", temp);
		}

		// Model 로 해당 데이터 전송
		model.addAttribute("noticeDto", noticeDto);

		return "classes/notice/notice_edit";
	}

	// 공지 게시글 작성 / 수정 기능
	@PostMapping("/classes/notice/edit")
	public String noticeEdit(@RequestParam List<String> n_content, @RequestParam String c_no, @RequestParam String n_no,
			@RequestParam String n_title, @RequestParam String n_state) {
		// RequestParam 으로 받아온 데이터 객체화
		NoticeDto noticeDto = NoticeDto.builder().c_no(Integer.parseInt(c_no)).n_no(Integer.parseInt(n_no))
				.n_title(n_title).n_state(Integer.parseInt(n_state)).build();

		// 객체 > Service 에서 수정 후 URL 받아오기
		String result = noticeService.edit(n_content, noticeDto);

		return result;
	}

	// 공지 게시글 삭제 기능
	@GetMapping("/classes/notice/delete/{c_no}/{n_no}")
	public String noticeDelete(@PathVariable int c_no, @PathVariable int n_no, HttpSession session) {
		// 현재 로그인 된 회원 정보 받아오기
		MemberDto userinfo = (MemberDto) session.getAttribute("userinfo");

		// PathVariable 객체화
		NoticeDto noticeDto = NoticeDto.builder().c_no(c_no).n_no(n_no).build();

		// 삭제 기능 시작
		String result = noticeService.delete(noticeDto, userinfo.getMember_no());

		return result;
	}

	// 공지 게시글 수정 중 임시 저장
	@PostMapping("/classes/notice/temp")
	public String noticeTemp(@RequestParam List<String> n_content, @RequestParam String c_no, @RequestParam String n_no,
			@RequestParam String n_title, @RequestParam String n_state) {
		// 매개변수 데이터 객체화
		NoticeDto noticeDto = NoticeDto.builder().c_no(Integer.parseInt(c_no)).n_no(Integer.parseInt(n_no))
				.n_title(n_title).n_state(Integer.parseInt(n_state)).build();

		// 임시 저장 후 공지 게시판으로 이동
		String result = noticeService.createTemp(n_content, noticeDto);
		return result;
	}
}