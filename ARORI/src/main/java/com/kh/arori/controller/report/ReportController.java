package com.kh.arori.controller.report;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

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

import com.kh.arori.entity.member.ReportDto;
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

	// 신고글 작성하기
	@GetMapping("/write")
	public String write() {
		return "report/write";

	}

	@PostMapping("/write")
	public String write(@ModelAttribute ReportDto reportDto) {
		reportService.write(reportDto);
		return "redirect:/";
	}

	// 신고글 리스트
	@GetMapping("/list")
	public String list(Model model, @ModelAttribute ReportDto reportDto) {

		model.addAttribute("list", reportService.list());

		int reportCount = reportDao.reportCount(reportDto);
		model.addAttribute("reportCount", reportCount);
		return "report/list";

	}

	// 신고별 검색
	@PostMapping("/search")
	public String search(@RequestParam String type, @RequestParam String keyword, Model model) {

		Map<String, String> param = new HashMap<>();
		param.put("type", type);
		param.put("keyword", keyword);
		List<ReportDto> list = sqlSession.selectList("report.search", param);
		model.addAttribute("list", list);

		return "report/list";

	}

	// 신고글 단일조회
	@GetMapping("/content/{report_no}")
	public String content(@PathVariable(required = false) int report_no, Model model) {

		ReportDto reportDto = reportDao.content(report_no);
		model.addAttribute("reportDto", reportDto);

		return "report/content";

	}

	// 신고글 삭제
	@GetMapping("/delete")
	public String delete() {
		return "report/delete";
	}

	@PostMapping("/delete")
	public String delete(@ModelAttribute ReportDto reportDto) {
		reportService.delete(reportDto);

		return "report/delete";
	}

}
