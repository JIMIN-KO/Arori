package com.kh.arori.controller.admin;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
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
import com.kh.arori.entity.study.QnaDto;
import com.kh.arori.entity.study.QnaMemberDto;
import com.kh.arori.repository.admin.AdminClassesDao;
import com.kh.arori.service.admin.AdminClassesService;
import com.kh.arori.service.pagination.PaginationService;

@Controller
@RequestMapping("/admin")
public class AdminClassesController {

	@Autowired
	private AdminClassesDao adminClassesDao;

	@Autowired
	private AdminClassesService adminClassesService;

	@Autowired
	private SqlSession sqlSession;

	@Autowired
	private PaginationService paginationService;

	// QNA 관리자 리스트
	@GetMapping("/qnaList/{pageNo}")
	public String adminQnaList(@PathVariable int pageNo, @RequestParam(required = false) String col,
			@RequestParam(required = false) String keyword, Model model) {

		// 1. 처음 메인 페이지를 위한 더미 객체 생성
		Map<String, String> map = new HashMap<String, String>();
		map.put("pageNo", String.valueOf(pageNo));
		map.put("col", col);
		map.put("keyword", keyword);
		map.put("start", null);
		map.put("finish", null);

		// 동적으로 변하는 조건에 맞는 게시글 갯수 파악을 위한 리스트 조회
		List<QnaMemberDto> thisCount = adminClassesDao.getP(map);

		// 2. 페이지 네이션이 되어서 한 페이지에 보여야 할 게시글들
		List<QnaMemberDto> list = adminClassesService.getP(map);

		// 3. QNA 전체 게시글 카운트 -> 화면에 현재 몇개의 게시글이 있는지 확인용
		List<QnaMemberDto> listSize = adminClassesDao.adminQnaList();
		int qnaCount = listSize.size();

		// 페이지 네이션 > 조건에 따라 게시글 개수가 다르니 현재 검색 혹은 메인 페이지에 있는 게시글만큼 페이지네이션 블록 생성
		List<Integer> block = adminClassesService.block(thisCount.size(), pageNo);

		int no = paginationService.no(pageNo, thisCount.size());

		// 1) 페이지에 보여야 할 게시글들 list
		model.addAttribute("list", list);
		// 2) 현재 전체 QNA 게시글 수
		model.addAttribute("qnaCount", qnaCount);
		// 3) 메인 페이지 혹은 검색 결과에 따른 페이지네이션 블럭 개수
		model.addAttribute("block", block);
		// 4) 메인 페이지 및 검색 결과에 따른 게시글 개수 (표에서 게시글 번호로 붙을 아이)
		model.addAttribute("no", no);

		return "admin/classes/qna_list";
	}

	// QNA 게시글 관리자 수정
	@GetMapping("/qnaEditAdmin/{c_no}/{qna_no}")
	public String qnaEditAdmin(@PathVariable int c_no, @PathVariable int qna_no, Model model) {
		// PathVariable 로 받아온 매개변수 객체화
//		QnaDto oldQna = QnaDto.builder().c_no(Integer.parseInt(c_no)).qna_no(Integer.parseInt(qna_no)).build();
		QnaDto qnaDto = QnaDto.builder().c_no(c_no).qna_no(qna_no).build();

		// 해당 게시글 데이터 조회
		QnaMemberDto qnaMemberDto = adminClassesDao.getCQ(qnaDto);

		// Model 로 해당 데이터 전송
		model.addAttribute("qnaDto", qnaMemberDto);

		return "admin/classes/edit_qna_admin";
	}

	// 큐앤에이 게시글 수정 기능
	@PostMapping("/qnaEditAdmin")
	public String qnaEditAdmin(@RequestParam List<String> content, @ModelAttribute QnaDto qnaDto) {

		// 객체 > Service 에서 수정 후 URL 받아오기
		String result = adminClassesService.editQnaAdmin(content, qnaDto);

		return result;
	}

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

	// QNA 리스트 검색
	@PostMapping("/searchQna")
	public String search(@RequestParam String type, @RequestParam String keyword, Model model) {

		Map<String, String> param = new HashMap<>();
		param.put("type", type);
		param.put("keyword", keyword);

		List<QnaMemberDto> list = sqlSession.selectList("adminClasses.searchQna", param);
		model.addAttribute("list", list);

		return "admin/classes/qna_list";
	}

	@RequestMapping("/unionQna")
	public String unionQna(@RequestParam(required = false) String type, @RequestParam(required = false) String keyword,
			Model model) {

		Map<String, Object> map = new HashMap<>();
		map.put("type", type);
		map.put("keyword", keyword);

		List<QnaMemberDto> list = sqlSession.selectList("adminClasses.unionQnaList", map);
		model.addAttribute("list", list);

		return "admin/classes/qna_list";
	}

	// QNA 게시글 관리자 상세보기
	@GetMapping("/qnaDetail/{c_no}/{qna_no}")
	public String qnaDetail(@PathVariable int c_no, @PathVariable int qna_no, Model model) {

		// c_no + qna_no 조회
		QnaDto qnaDto = QnaMemberDto.builder().c_no(c_no).qna_no(qna_no).build();
		QnaMemberDto qnaMemberDto = adminClassesDao.getCQ2(qnaDto);
		model.addAttribute("qnaMemberDto", qnaMemberDto);

		return "admin/classes/qna_detail";
	}

}
