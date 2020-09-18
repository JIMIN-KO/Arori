package com.kh.arori.controller.report;

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
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.arori.entity.member.MemberDto;
import com.kh.arori.entity.member.ReportDto;
import com.kh.arori.repository.member.MemberDao;
import com.kh.arori.repository.report.ReportDao;
import com.kh.arori.service.report.ReportService;

@Controller
@RequestMapping("/report")
public class ReportController {

	@Autowired
	private ReportService reportService;

	@Autowired
	private ReportDao reportDao;

	@Autowired
	private SqlSession sqlSession;

	@Autowired
	private MemberDao memberDao;

// 신고글 작성하기
	@GetMapping("/write")
	public String write(Model model, HttpSession session) {
		MemberDto userinfo = (MemberDto) session.getAttribute("userinfo");
		MemberDto member = memberDao.get(userinfo.getMember_id());
		MemberDto memberno = memberDao.getNo(userinfo.getMember_no());
		model.addAttribute("memberDto", member);
		model.addAttribute("memberDto", memberno);
		System.out.println(userinfo.getMember_id());

		return "report/write";

	}

	@PostMapping("/write")
	public String write(@ModelAttribute ReportDto reportDto) {
		reportService.write(reportDto);
		return "member/myPage";
	}

// 신고글 리스트
	@GetMapping("/list")
	public String list(Model model, @ModelAttribute ReportDto reportDto) {
		List<ReportDto> list = reportDao.list();
		model.addAttribute("list", list);
		int reportCount = reportDao.reportCount(reportDto);
		model.addAttribute("reportCount", reportCount);
		return "report/list";
	}

	// 페이지네이션
	/*
	 * @GetMapping("/list_data")
	 * 
	 * @ResponseBody public List<ReportDto> listData(Model model) { List<ReportDto>
	 * list = sqlSession.selectList("report.list"); return list; }
	 */

	// 신고글 리스트
	@GetMapping("/searchList")
	public String searchList(Model model, @ModelAttribute ReportDto reportDto) {

		model.addAttribute("list", reportService.list());

		int reportCount = reportDao.reportCount(reportDto);
		model.addAttribute("reportCount", reportCount);
		return "report/searchList";

	}

// 신고별 검색
	@PostMapping("/search")
	public String search(@RequestParam String type, @RequestParam String keyword, Model model) {

		Map<String, String> param = new HashMap<>();
		param.put("type", type);
		param.put("keyword", keyword);
		List<ReportDto> list = sqlSession.selectList("report.search", param);
		model.addAttribute("list", list);

		return "report/searchList";

	}

	// 신고글 단일조회
	@GetMapping("/content/{report_no}")
	public String content(@PathVariable(required = false) int report_no, Model model) {

		ReportDto reportDto = reportDao.content(report_no);
		model.addAttribute("reportDto", reportDto);

		return "report/content";

	}

	// 신고글 단일조회
	@PostMapping("/content/{report_no}")
	public String content(@PathVariable(required = false) int report_no) {

		return "redirect:/admin/allList";

	}

	// 신고글 삭제
	@GetMapping("/delete/{report_no}")
	public String memberDelete(@PathVariable int report_no) {
		System.out.println();
		reportDao.delete(report_no);

		return "redirect:/report/list";
	}

}