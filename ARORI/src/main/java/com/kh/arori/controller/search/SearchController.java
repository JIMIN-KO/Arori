package com.kh.arori.controller.search;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.arori.entity.study.MCIDto;
import com.kh.arori.service.study.ClassesService;

@Controller
@RequestMapping("/search")
public class SearchController {

	@Autowired
	private ClassesService classesService;

	// search 메인 페이지

	@GetMapping("main")
	public String search(Model model) {

		String keyword = null;
		String searchOption = null;
		String col = "c_when";
		String order = "DESC";

		List<MCIDto> list = classesService.searchList(keyword, searchOption, col, order);

		model.addAttribute("MCIDto", list);

		return "search/main";
	}

}
