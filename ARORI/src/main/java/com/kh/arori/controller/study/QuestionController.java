package com.kh.arori.controller.study;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.arori.entity.member.MemberDto;
import com.kh.arori.entity.study.MyAnswerDto;
import com.kh.arori.entity.study.MyQuizDto;
import com.kh.arori.entity.study.QuizDto;
import com.kh.arori.entity.study.ThisQuizDto;
import com.kh.arori.repository.study.MyAnswerDao;
import com.kh.arori.repository.study.QuizDao;
import com.kh.arori.service.study.MyAnswerService;

@Controller
public class QuestionController {
	
	@Autowired
	private QuizDao quizDao;
	
	@Autowired
	private MyAnswerDao myAnswerDao;
	
	@Autowired
	private MyAnswerService myAnswerService;
	
	// 퀴즈 풀기 페이지
	@RequestMapping("/classes/quiz/play/{q_no}")
	public String play(@PathVariable int q_no, Model model, HttpSession session) {
		MemberDto userinfo = (MemberDto) session.getAttribute("userinfo");
		
		QuizDto quizDto = QuizDto.builder().q_no(q_no).build();
		quizDto = quizDao.get(quizDto);
		
		model.addAttribute("quizDto",quizDto);
		model.addAttribute("c_no", quizDto.getC_no());
		
		List<ThisQuizDto> question = myAnswerService.play(userinfo.getMember_no(), q_no);
		
		model.addAttribute("thisQuizDto", question);
		
		return "question/play";
	}
	
	// 퀴즈 풀기 취소 -> 나의 정답 데이터 삭제
	@RequestMapping("/classes/myanswer/delete/{c_no}/{q_no}")
	public String deleteMyanswer(@PathVariable int c_no, @PathVariable int q_no, HttpSession session) {
		MemberDto userinfo = (MemberDto) session.getAttribute("userinfo");
		
		// 로그인 회원 + 해당 퀴즈 번호 -> MyAnswerDto 객체화
		MyAnswerDto myAnswerDto = MyAnswerDto.builder().q_no(q_no).member_no(userinfo.getMember_no()).build();
		MyQuizDto myQuizDto = MyQuizDto.builder().q_no(q_no).member_no(userinfo.getMember_no()).build();
		
		// 해당 회원의 정답 데이터 삭제
		quizDao.deleteMQ(myQuizDto);
		myAnswerDao.deleete(myAnswerDto);
		
		return "redirect:/classes/quiz/" + c_no;
	}
	
}


