package com.kh.arori.controller.search;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kh.arori.repository.study.ClassesDao;

@Controller
@RequestMapping("/search")
public class SearchController {
	
	@Autowired
	private ClassesDao classesDao;
	
	// search 메인 페이지
	@GetMapping("main")
	public String searchMain(
			@RequestParam(required = false, defaultValue = "c_when") String col
			) {
		
		//classesDao.getMCI(map)
		
		return "search/main";
	}

}
