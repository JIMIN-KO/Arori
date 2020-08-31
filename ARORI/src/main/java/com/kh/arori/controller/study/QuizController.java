package com.kh.arori.controller.study;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.support.SessionStatus;

import com.kh.arori.entity.MemberDto;
import com.kh.arori.entity.study.QuizDto;
import com.kh.arori.service.study.QuizService;

@Controller
public class QuizController {

		@Autowired
		private QuizService quizService;
		
		@GetMapping("/classes/{c_no}/quiz/create")
		public String create(@PathVariable int c_no) {
			return "quiz/create";
		}
		
		@PostMapping("/classes/{c_no}/quiz/create")
		public String create(@PathVariable int c_no, @ModelAttribute QuizDto quizDto) {		
			int q_no = quizService.createQuiz(quizDto);
			return "redirect:/classes/{c_no}/quiz/detail/" +q_no;
		}
		
//		@GetMapping("/classes/{c_no}/quiz/detail/{q_no}")
//		public String detail(@PathVariable int c_no,@PathVariable int q_no) {
//			
//			return "classes/{c_no}/quiz/detail";
//		}
		
		
}
