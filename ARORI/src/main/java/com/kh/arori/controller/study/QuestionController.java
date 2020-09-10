package com.kh.arori.controller.study;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.arori.entity.member.MemberDto;
import com.kh.arori.entity.study.QuizDto;
import com.kh.arori.entity.study.ThisQuizDto;
import com.kh.arori.repository.study.QuizDao;
import com.kh.arori.service.study.MyAnswerService;

@Controller
public class QuestionController {
	
	@Autowired
	private QuizDao quizDao;
	
	@Autowired
	private MyAnswerService myAnswerService;
	
	@RequestMapping("/classes/quiz/play/{q_no}")
	public String play(@PathVariable int q_no, Model model, HttpSession session) {
		MemberDto userinfo = (MemberDto) session.getAttribute("userinfo");
		
		QuizDto quizDto = QuizDto.builder().q_no(q_no).build();
		quizDto = quizDao.get(quizDto);
		System.out.println(quizDto.getQ_title());
		model.addAttribute("quizDto",quizDto);
		
		List<ThisQuizDto> question = myAnswerService.play(userinfo.getMember_no(), q_no);
		
		model.addAttribute("thisQuizDto", question);
		
		return "question/play";
	}
	
}


