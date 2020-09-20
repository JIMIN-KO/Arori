package com.kh.arori.controller.report;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

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
	private MemberDao memberDao;

	// 신고 팝업 닫기
	@RequestMapping("/close")
	public String close() {

		return "report/closePage";
	}

	// 신고글 작성하기
	@GetMapping("/write/{member_no}")
	public String write(@PathVariable int member_no, Model model, HttpSession session) {
		MemberDto memberDto = memberDao.getNo(member_no);

		model.addAttribute("memberDto", memberDto);

		return "report/write";

	}

	// 신고글 작성 기능
	@PostMapping("/write")
	public String write(@ModelAttribute ReportDto reportDto) {
		reportService.write(reportDto);
		return "redirect:/report/close?close";
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

		return "redirect:/admin/report_list/1";
	}

}