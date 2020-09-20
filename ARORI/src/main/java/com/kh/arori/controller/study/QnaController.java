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
import org.springframework.web.bind.annotation.RequestParam;

import com.kh.arori.entity.member.MemberDto;
import com.kh.arori.entity.study.ClassesDto;
import com.kh.arori.entity.study.QnaDto;
import com.kh.arori.entity.study.QnaMemberDto;
import com.kh.arori.repository.study.ClassesDao;
import com.kh.arori.repository.study.QnaDao;
import com.kh.arori.service.pagination.PaginationService;
import com.kh.arori.service.study.QnaService;

@Controller
public class QnaController {

	@Autowired
	private ClassesDao classesDao;

	@Autowired
	private QnaDao qnaDao;

	@Autowired
	private QnaService qnaService;

	@Autowired
	private PaginationService paginationService;

	// QNA작성 페이지 새글
	@GetMapping("/classes/qna/create/{c_no}")
	public String qnaCreate(@PathVariable String c_no, Model model, HttpSession session) {

		// 임시 게시글 insert
		int qna_no = qnaService.create(c_no, c_no);
		MemberDto userinfo = (MemberDto) session.getAttribute("userinfo");

		QnaDto qnaDto = QnaDto.builder().c_no(Integer.parseInt(c_no)).member_no(userinfo.getMember_no()).qna_no(qna_no)
				.build();

		model.addAttribute("qnaDto", qnaDto);

		return "classes/qna/qna_create";
	}

	// QNA 작성 페이지 답글
	@GetMapping("/classes/qna/create_reply/{c_no}/{qna_no}")
	public String qnaCreateReply(@PathVariable int c_no, @PathVariable int qna_no, Model model, HttpSession session) {

		// c_no + qna_no 를 단일 조회
		QnaDto qnaDto = QnaDto.builder().c_no(c_no).qna_no(qna_no).build();
		qnaDto = qnaDao.getCQ(qnaDto);

		// 임시 게시글 insert
		int reply_qna_no = qnaService.createReply(qnaDto);
		qnaDto.setQna_no(reply_qna_no);

		model.addAttribute("qnaDto", qnaDto);
		model.addAttribute("mother_qna_no", qna_no);
		return "classes/qna/qna_create_reply";
	}

	// QNA 게시글 리스트
	@GetMapping("/classes/qna/{c_no}/{pageNo}")
	public String qnaList(@PathVariable int c_no, @PathVariable int pageNo, Model model) {
		// 권한 조회를 위한 해당 클래스 단일 조회
		ClassesDto classes = classesDao.get(c_no);

		// 게시글 불러오기
		List<QnaMemberDto> list = qnaService.getP(c_no, pageNo);

		// 페이지 네비게이터 계산
		List<Integer> block = qnaService.pagination(c_no, pageNo);

		// 임시 저장 데이터 조회
		List<QnaDto> temp = qnaDao.getCT(c_no);
		if (temp != null) {
			model.addAttribute("temp", temp);
		}

		// 해당 클래스의 QNA 별 번호
		List<QnaDto> qnaSize = qnaDao.getC(c_no);
		int count = qnaSize.size();
		int no = paginationService.no(pageNo, count);

		// VIEW 로 던질 모델 (게시글 / 해당 클래스 정보)
		model.addAttribute("list", list);
		model.addAttribute("classes", classes);
		model.addAttribute("block", block);
		model.addAttribute("pageNo", pageNo);
		model.addAttribute("no", no);

		return "classes/qna/qna_list";
	}

	// QNA 게시글 수정 페이지
	@GetMapping("/classes/qna/edit/{c_no}/{qna_no}")
	public String qnaEdit(@PathVariable String c_no, @PathVariable String qna_no, Model model) {
		// PathVariable 로 받아온 매개변수 객체화
		QnaDto oldQna = QnaDto.builder().c_no(Integer.parseInt(c_no)).qna_no(Integer.parseInt(qna_no)).build();

		// 해당 게시글 데이터 조회
		QnaDto qnaDto = qnaDao.getCQ(oldQna);

		List<QnaDto> temp = qnaDao.getTemp(qnaDto);

		if (temp != null) {
			model.addAttribute("temp", temp);
		}

		// Model 로 해당 데이터 전송
		model.addAttribute("qnaDto", qnaDto);

		return "classes/qna/qna_edit";
	}

	// qna 게시글 작성 / 수정 기능
	@PostMapping("/classes/qna/edit")
	public String qnaEdit(@RequestParam List<String> content, @ModelAttribute QnaDto qnaDto) {

		System.out.println(qnaDto.getC_no());
		System.out.println(qnaDto.getQna_no());
		System.out.println(qnaDto.getQna_title());
		System.out.println(qnaDto.getMember_no());
		// 객체 > Service 에서 수정 후 URL 받아오기
		String result = qnaService.edit(content, qnaDto);

		return result;
	}

	// qna 게시글 답글 작성 / 수정 기능
	@PostMapping("/classes/qna/edit_reply")
	public String qnaEditReply(@RequestParam List<String> content, @ModelAttribute QnaDto qnaDto) {
		System.out.println(qnaDto.getC_no());
		System.out.println(qnaDto.getQna_no());
		System.out.println(qnaDto.getQna_title());
		System.out.println(qnaDto.getMember_no());

		// 객체 > Service 에서 수정 후 URL 받아오기
		String result = qnaService.editReply(content, qnaDto);

		return result;
	}

	// QNA 게시글 삭제 기능
	@GetMapping("/classes/qna/delete/{c_no}/{qna_no}")
	public String qnaDelete(@PathVariable int c_no, @PathVariable int qna_no, HttpSession session) {
		// 현재 로그인 된 회원 정보 받아오기
		MemberDto userinfo = (MemberDto) session.getAttribute("userinfo");

		// PathVariable 객체화
		QnaDto qnaDto = QnaDto.builder().c_no(c_no).qna_no(qna_no).build();

		// 삭제 기능 시작
		String result = qnaService.delete(qnaDto, userinfo.getMember_no());

		return result;
	}

}
