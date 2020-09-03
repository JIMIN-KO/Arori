package com.kh.arori.controller.study;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

import com.kh.arori.entity.study.AllQuestionDto;
import com.kh.arori.service.study.QuestionService;

@Controller
public class QuestionController {
	
	@Autowired
	private QuestionService questionService;
	
	@GetMapping("/classes/{c_no}/quiz/{q_no}/question/create")
	public String create(@PathVariable int c_no, @PathVariable int q_no) {
		return "question/create";
	}
	
	//퀘스천 생성
	@PostMapping("/classes/{c_no}/quiz/{q_no}/question/create")
	public String create(@PathVariable int c_no, @PathVariable int q_no, @ModelAttribute AllQuestionDto allQuestionDto) {
		int question_no = questionService.createQuestion(allQuestionDto);
		
		
		return "redirect: /quiz/detail/";
	}
	
	
}


