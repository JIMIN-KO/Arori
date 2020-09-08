package com.kh.arori.rest.search;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.kh.arori.entity.study.McDto;
import com.kh.arori.service.study.ClassesService;

@RestController
@RequestMapping("/searchAjax")
public class SearchAjaxController {
	
	@Autowired
	private ClassesService classesService;
	
	@RequestMapping("/search")
	public List<McDto> getMcList(@RequestParam String keyword, @RequestParam String searchOption){
		
		List<McDto> list = classesService.searchList(searchOption, keyword);
		
		return list;
	}
}
