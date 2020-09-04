package com.kh.arori.controller.study;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

import com.kh.arori.entity.study.QuizDto;
import com.kh.arori.repository.study.QuizDao;
import com.kh.arori.service.study.QuizService;

@Controller
public class QuizController {

		@Autowired
		private QuizService quizService;
		
		@Autowired
		private QuizDao quizDao;
		
		//퀴즈 메인
		@GetMapping("/classes/{c_no}/quiz")
		public String quizmain(@PathVariable int c_no, Model model) {
			//퀴즈목록
			List<QuizDto> list = quizDao.getList(c_no);
			System.out.println("list : " + list);
			model.addAttribute("list",list);
			return "quiz/quizmain";
		}
		
		// 퀴즈 생성 페이지 
		@GetMapping("/classes/{c_no}/quiz/create")
		public String create(@PathVariable int c_no) {
			return "quiz/create";
		}
		
		//퀴즈 생성
		@PostMapping("/classes/{c_no}/quiz/create")
		public String create(@PathVariable int c_no, @ModelAttribute QuizDto quizDto) {		
			int q_no = quizService.createQuiz(quizDto);
			return "redirect:/classes/{c_no}/quiz/detail/" + q_no;
		}
		
		//퀴즈 디테일
		@GetMapping("/classes/{c_no}/quiz/detail/{q_no}")
		public String detail(@PathVariable int c_no,@PathVariable int q_no, Model model) {
			model.addAttribute("q_no",q_no);
			return "quiz/detail";
		}

}
