package com.kh.arori.controller.report;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.arori.entity.member.ReportDto;
import com.kh.arori.service.report.ReportService;

@Controller
@RequestMapping("/report")
public class ReportController {

	@Autowired
	ReportService reportService;

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

	//신고글 리스트
	@GetMapping("/list")
	public String list(Model model) {

		model.addAttribute("list", reportService.list());
		return "report/list";

	}

}
