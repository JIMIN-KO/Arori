package com.kh.arori.rest.chart;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.kh.arori.entity.admin.ChartDto;
import com.kh.arori.repository.admin.AdminDao;

@RestController
@RequestMapping("/chartAjax")
public class ChartAjaxController {

	@Autowired
	private AdminDao adminDao;
	
	@RequestMapping("/totalChart")
	public List<ChartDto> totalChart(@RequestBody ChartDto chartDto) {

		List<ChartDto> list = adminDao.thisChart(chartDto);

		return list;
	}
}
