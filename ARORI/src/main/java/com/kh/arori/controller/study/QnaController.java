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
import com.kh.arori.repository.study.ClassesDao;
import com.kh.arori.repository.study.QnaDao;
import com.kh.arori.service.study.QnaService;

@Controller
public class QnaController {
	
	@Autowired
	private ClassesDao classesDao;
	
	@Autowired
	private QnaDao qnaDao;
	
	@Autowired
	private QnaService qnaService;

	//QNA작성 페이지 새글
	@GetMapping("/classes/qna/create/{c_no}")
	public String qnaCreate(@PathVariable String c_no, Model model) {
		model.addAttribute("c_no",c_no);
		return "classes/qna/qna_create";
	}	
	// QNA 작성 새글
	@PostMapping("/classes/qna/create")
	public String qnaCreate(@RequestParam List<String> qna_content, @RequestParam String c_no, 
			@RequestParam String qna_title, @RequestParam String member_no) {
		qnaService.create(qna_content, c_no, qna_title, member_no);
		return "redirect:" + c_no + "/1";
	}
	
	// QNA 작성 페이지 답글
	@GetMapping("/classes/qna/create_reply/{c_no}/{qna_no}")
	public String qnaCreateReply(@PathVariable int c_no, @PathVariable int qna_no, Model model) {
		model.addAttribute("c_no",c_no);
		model.addAttribute("qna_no", qna_no);
		// c_no + qna_no 를 단일 조회 
		QnaDto qnaDto = 	QnaDto.builder().c_no(c_no).qna_no(qna_no).build();
		qnaDto = qnaDao.getCQ(qnaDto);
		// 단일 조회 한 dto를 모델 어트리부트로 넘겨서 제이에스피에서 연산 후 컨트롤러로 던져주기?
		model.addAttribute("qnaDto", qnaDto);
		return "classes/qna/qna_create_reply";
	}
	// QNA 작성 답글
		@PostMapping("/classes/qna/create_reply")
		public String qnaCreateReply(@RequestParam List<String> content, @ModelAttribute QnaDto qnaDto) {
			qnaService.createReply(content, qnaDto);
			return "redirect:" +qnaDto.getC_no()+ "/1";
		}
	
	
	// QNA 게시글 리스트
	@GetMapping("/classes/qna/{c_no}/{pageNo}")
	public String qnaList(@PathVariable String c_no, @PathVariable int pageNo, Model model) {
		// 권한 조회를 위한 해당 클래스 단일 조회
		ClassesDto classes = classesDao.get(Integer.parseInt(c_no));
		
		// 공지 게시글 불러오기
		List<QnaDto> list = qnaService.getP(c_no, pageNo);

		// 페이지 네비게이터 계산
		List<Integer> block = qnaService.pagination(Integer.parseInt(c_no), pageNo);

		// 임시 저장 데이터 조회
		List<QnaDto> temp = qnaDao.getCT(Integer.parseInt(c_no));
		if(temp != null) {
			model.addAttribute("temp", temp);
		}

		// VIEW 로 던질 모델 (게시글 / 해당 클래스 정보)
		model.addAttribute("list", list);
		model.addAttribute("classes", classes);
		model.addAttribute("block", block);

		return "classes/qna/qna_list";
	}


	//  QNA 게시글 수정 페이지
	@GetMapping("/classes/qna/edit/{c_no}/{qna_no}")
	public String qnaEdit(@PathVariable String c_no, @PathVariable String qna_no, Model model) {
		// PathVariable 로 받아온 매개변수 객체화
		QnaDto oldQna = QnaDto.builder().c_no(Integer.parseInt(c_no)).qna_no(Integer.parseInt(qna_no)).build();

		// 해당 게시글 데이터 조회
		QnaDto qnaDto = qnaDao.getCQ(oldQna);
		
		List<QnaDto> temp = qnaDao.getTemp(qnaDto);
		if(temp != null) {
			model.addAttribute("temp", temp);
		}

		// Model 로 해당 데이터 전송
		model.addAttribute("qnaDto", qnaDto);

		return "classes/qna/qna_edit";
	}

	// QNA 게시글 작성 / 수정 기능
	@PostMapping("/classes/qna/edit")
	public String qnaEdit(@RequestParam List<String> qna_content, @RequestParam String c_no, @RequestParam String qna_no,
			@RequestParam String qna_title, @RequestParam String qna_state) {
		// RequestParam 으로 받아온 데이터 객체화
		QnaDto qnaDto = QnaDto.builder().c_no(Integer.parseInt(c_no)).qna_no(Integer.parseInt(qna_no))
				.qna_title(qna_title).qna_state(Integer.parseInt(qna_state)).build();

		// 객체 > Service 에서 수정 후 URL 받아오기
		String result = qnaService.edit(qna_content, qnaDto);

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
	
	//  QNA 게시글 수정 중 임시 저장 
	@PostMapping("/classes/qna/temp")
	public String qnaTemp(@RequestParam List<String> qna_content, @RequestParam String c_no, @RequestParam String qna_no,
			@RequestParam String qna_title, @RequestParam String qna_state) {
		// 매개변수 데이터 객체화 
		QnaDto qnaDto = QnaDto.builder().c_no(Integer.parseInt(c_no)).qna_no(Integer.parseInt(qna_no))
				.qna_title(qna_title).qna_state(Integer.parseInt(qna_state)).build();
		
		// 임시 저장 후  QNA 게시판으로 이동 
		String result = qnaService.createTemp(qna_content, qnaDto);
		return result;
	}
	
}
