package com.kh.arori.rest.search;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.kh.arori.entity.study.ClassesDto;
import com.kh.arori.entity.study.MCIDto;
import com.kh.arori.repository.study.ClassesDao;
import com.kh.arori.service.study.ClassesService;

@RestController
@RequestMapping("/searchAjax")
public class SearchAjaxController {
	
	@Autowired
	private ClassesDao classesDao;
	
	@RequestMapping("/search")
	public List<MCIDto> getMcList(@RequestParam String keyword, @RequestParam String searchOption,
			@RequestParam(required = false, defaultValue = "c_when") String col, Model model
			){
		String order = "DESC";
		boolean isOld = col.equals("c_when_old");
		if(isOld) {
			col = "c_when";
			order = "ASC";
		}
		
		Map<String, String> map = new HashMap<String, String>();
		map.put("searchOption", searchOption);
		map.put("keyword", keyword);
		map.put("col", col);
		map.put("order", order);
	
		List<MCIDto> list = classesDao.searchList(map);
		
		for(MCIDto dto : list) {
			System.out.println(dto.getC_title());
			System.out.println(dto.getMember_nick());
		}
		model.addAttribute("MCIDto", list);
		return list;
	}
}
