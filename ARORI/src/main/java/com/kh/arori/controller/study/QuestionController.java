package com.kh.arori.controller.study;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;

import com.kh.arori.entity.study.AllQuestionDto;

@Controller
public class QuestionController {
	
	//퀘스천 생성
	@GetMapping("/classes/{c_no}/quiz/{q_no}/question/create")
	public String create(@PathVariable int c_no, @PathVariable int q_no, @ModelAttribute AllQuestionDto allQuestionDto) {
		return "question/create";
	}
}
