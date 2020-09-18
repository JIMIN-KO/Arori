package com.kh.arori.controller.admin;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.arori.entity.member.AllMemberDto;
import com.kh.arori.entity.member.MemberDto;
import com.kh.arori.entity.study.ClassesDto;
import com.kh.arori.entity.study.QnaDto;
import com.kh.arori.entity.study.QnaMemberDto;
import com.kh.arori.repository.admin.AdminClassesDao;
import com.kh.arori.repository.study.ClassesDao;
import com.kh.arori.repository.study.QnaDao;
import com.kh.arori.service.admin.AdminClassesService;
import com.kh.arori.service.study.QnaService;

@Controller
@RequestMapping("/admin")
public class AdminClassesController {

	@Autowired
	private ClassesDao classesDao;

	@Autowired
	private AdminClassesDao adminClassesDao;

	@Autowired
	private AdminClassesService adminClassesService;

	// QNA 관리자 리스트
	@GetMapping("/qnaList")
	public String adminQnaList(Model model, @ModelAttribute QnaMemberDto qnaMemberDto) {

		List<QnaMemberDto> list = adminClassesService.adminQnaList();
		model.addAttribute("list", list);

//		// 페이지 네비게이터 계산
//		List<Integer> block = adminClassesService.getP(Integer.parseInt(pageNo));
//		
//		model.addAttribute("list", list);
//		model.addAttribute("block", block);
//		
//		for(QnaMemberDto qm : list) {
//			System.out.println(qm.getMember_nick());
//			System.out.println(qm.getQna_content());
//		}

		return "admin/classes/qna_list";
	}

	// QNA 게시글 관리자 수정
//	@GetMapping("/qnaEditAdmin/{c_no}/{qna_no}")
//	public String qnaEditAdmin(@PathVariable String c_no, @PathVariable String qna_no, Model model) {
//
//		// 해당 게시글 데이터 조회
//		QnaDto qnaDto = adminClassesDao.getCQ(qnaDto);
//
//		// Model 로 해당 데이터 전송
//		model.addAttribute("qnaDto", qnaDto);
//
//		return "admin/classes/edit_qna_admin";
//	}

	// QNA 게시글 관리자 삭제
	@GetMapping("/qnaDeleteAdmin/{c_no}/{qna_no}")
	public String qnaDeleteAdmin(@PathVariable int c_no, @PathVariable int qna_no, HttpSession session) {
		// 로그인한 회원정보
		MemberDto userinfo = (MemberDto) session.getAttribute("userinfo");
		// PathVariable 객체화
		QnaDto qnaDto = QnaDto.builder().c_no(c_no).qna_no(qna_no).build();

		// 삭제 기능
		String result = adminClassesService.deleteAdmin(qnaDto, userinfo.getMember_auth());

		return result;
	}

}
