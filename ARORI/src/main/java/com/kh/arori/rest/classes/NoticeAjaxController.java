package com.kh.arori.rest.classes;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.kh.arori.entity.study.NoticeDto;
import com.kh.arori.service.study.NoticeService;

@RestController
@RequestMapping("/noticeAjax")
public class NoticeAjaxController {

	@Autowired
	private NoticeService noticeService;
	
	@RequestMapping("/list")
	public List<NoticeDto> noticeList() {
		List<NoticeDto> list = noticeService.getP("1", "1", "10");
		
		return list;
	}
}
