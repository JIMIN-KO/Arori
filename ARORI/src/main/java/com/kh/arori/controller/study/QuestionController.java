package com.kh.arori.controller.study;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

@Controller
public class QuestionController {
	
	@GetMapping("/classes/{c_no}/quiz/{q_no}/question/create")
	public String create(@PathVariable int c_no, @PathVariable int q_no) {
		return "question/create";
	}
}
