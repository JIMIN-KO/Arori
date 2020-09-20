package com.kh.arori.rest.classes;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.kh.arori.entity.study.ClassesDto;
import com.kh.arori.entity.study.SubscribeDto;
import com.kh.arori.repository.study.ClassesDao;
import com.kh.arori.service.study.ClassesService;

@RestController
@RequestMapping("/subAjax")
public class SubAjaxController {

	@Autowired
	private ClassesDao classesDao;
	@Autowired
	private ClassesService classesService;

	@RequestMapping("/subscribe")

	public int sub(Model model, HttpSession session, @RequestBody SubscribeDto subDto) {

		// 클래스 넘버를 이용한 단일조회
		ClassesDto classesDto = classesDao.get(subDto.getC_no());

		classesService.already(subDto);
		
		// c_subscribe에 구독자수 저장
		int c_subscribe = classesDao.countSub(subDto);

		// 해당 변수를 다시 찐 c_subscribe에 저장
		classesDto.setC_subscribe(c_subscribe);
		return c_subscribe;
	}

}
