package com.kh.arori.rest.search;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.kh.arori.entity.study.ClassesDto;
import com.kh.arori.entity.study.MCIDto;
import com.kh.arori.service.study.ClassesService;

@RestController
@RequestMapping("/searchAjax")
public class SearchAjaxController {
	
	@Autowired
	private ClassesService classesService;
	
	@RequestMapping("/search")
	public List<ClassesDto> getMcList(@RequestParam String keyword, @RequestParam String searchOption,
			@RequestParam(required = false, defaultValue = "c_when") String col,
			@RequestParam(required = false, defaultValue = "DESC") String order	
			){
		
		Map<String, String> map = new HashMap<String, String>();
		map.put("searchOption", searchOption);
		map.put("keyword", keyword);
		map.put("col", col);
		map.put("order", order);
		
		// List<ClassesDto> list = classesService.searchList(map);
		
		return null;
	}
}
