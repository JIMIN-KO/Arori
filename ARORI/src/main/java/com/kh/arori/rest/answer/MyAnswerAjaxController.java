package com.kh.arori.rest.answer;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.kh.arori.entity.study.MyAnswerDto;
import com.kh.arori.repository.study.MyAnswerDao;

@RestController
@RequestMapping("/answerAjax")
public class MyAnswerAjaxController {
	
	@Autowired
	private MyAnswerDao myAnswerDao;
	
	@PostMapping("/update")
	@Transactional
	public String updateAnswer(@ModelAttribute MyAnswerDto myAnswerDto) {
		// 받아온 데이터 갱신하기 
		// 1. 회원의 입력값이 정답인지 아닌지 비교
		
//		if(myAnswer.equals(questionAnswer)) {
//			myAnswerDto.setResult(1);
//		} else {
//			myAnswerDto.setResult(0);
//		}
		myAnswerDto.setResult(0);
		System.out.println(myAnswerDto.getMy_answer());
		myAnswerDao.update(myAnswerDto);
		
		return "성공!";
	}

}
