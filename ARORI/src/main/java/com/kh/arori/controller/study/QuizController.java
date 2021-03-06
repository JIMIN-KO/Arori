package com.kh.arori.controller.study;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kh.arori.entity.member.MemberDto;
import com.kh.arori.entity.study.AllQuestionDto;
import com.kh.arori.entity.study.ClassesDto;
import com.kh.arori.entity.study.QuizDto;
import com.kh.arori.entity.study.ThisQuizDto;
import com.kh.arori.repository.study.ClassesDao;
import com.kh.arori.repository.study.QuestionDao;
import com.kh.arori.repository.study.QuizDao;
import com.kh.arori.service.pagination.PaginationService;
import com.kh.arori.service.study.MyAnswerService;
import com.kh.arori.service.study.QuizService;

@Controller
public class QuizController {

	@Autowired
	private MyAnswerService myAnswerService;

	@Autowired
	private QuizService quizService;

	@Autowired
	private ClassesDao classesDao;

	@Autowired
	private QuizDao quizDao;

	@Autowired
	private QuestionDao questionDao;
	
	@Autowired
	private PaginationService paginationService;

	// 퀴즈 메인
	@GetMapping("/classes/quiz/{c_no}/{pageNo}")
	public String quizmain(@PathVariable int c_no, @PathVariable int pageNo, Model model) {
		// 해당 클래스 조회
		ClassesDto classesDto = classesDao.get(c_no);
		model.addAttribute("classesDto", classesDto);

		// 해당 클래스의 퀴즈별 번호
		int count = quizDao.getSize(c_no);
		int no = paginationService.no(pageNo, count);
		model.addAttribute("no", no);

		// 퀴즈목록
		List<QuizDto> list = quizService.getQuiz(c_no, pageNo);
		model.addAttribute("quizDto", list);

		// 퀴즈 페이지네이션 블록
		List<Integer> block = quizService.getQuizBlock(c_no, pageNo);
		model.addAttribute("block", block);

		// 페이지 시작점
		Map<String, Integer> pagination = paginationService.pagination("c_no", c_no, pageNo);
		model.addAttribute("start", pagination.get("start"));
	
		model.addAttribute("pageNo", pageNo);
		return "quiz/quiz_main";
		
	}

	// 퀴즈 생성 페이지
	@GetMapping("/classes/quiz/create/{c_no}")
	public String create(@PathVariable int c_no, Model model) {
		int q_no = quizService.createQuiz(c_no); // 퀴즈 생성 (임시 저장 여지를 두는 것)

		// 퀴즈 번호 + 클래스 번호 객체화
		QuizDto quizDto = QuizDto.builder().c_no(c_no).q_no(q_no).build();
		// 퀴즈 번호 및 클래스 번호 전달
		model.addAttribute("quizDto", quizDto);

		// 첫 퀘스쳔 번호 생성 후 전달
		int question_no = questionDao.getSeq();
		model.addAttribute("question_no", question_no);

		return "quiz/quiz_create";
	}

	// 퀴즈 생성
	@PostMapping("/classes/quiz/create")
	public String create(@RequestParam List<String> content, @ModelAttribute QuizDto quizDto) {
		String result = quizService.update(content, quizDto);

		return result;
	}

	// 퀴즈 디테일
	@GetMapping("/classes/quiz/detail/{c_no}/{q_no}")
	public String detail(@PathVariable int c_no, @PathVariable int q_no, Model model) {
		QuizDto quizDto = QuizDto.builder().c_no(c_no).q_no(q_no).build();
		// 클래스 조회
		ClassesDto classesDto = classesDao.get(c_no);
		model.addAttribute("classesDto", classesDto);

		// 퀴즈 조회
		quizDto = quizDao.get(quizDto);
		model.addAttribute("quizDto", quizDto);
		
		// 퀘스쳔 존재 조회
		List<AllQuestionDto> list = questionDao.getQuestion(q_no);
		model.addAttribute("questionSize", list.size());
		
		return "quiz/quiz_detail";
	}

	// 퀴즈 삭제
	@GetMapping("/classes/quiz/delete/{c_no}/{q_no}")
	public String delete(@PathVariable int c_no, @PathVariable int q_no) {
		String path = quizService.delete(c_no, q_no);

		return path;
	}

	// 퀴즈 수정
	@GetMapping("classes/quiz/edit/{c_no}/{q_no}")
	public String edit(@PathVariable int c_no, @PathVariable int q_no, Model model, HttpSession session)
			throws Exception {
		MemberDto userinfo = (MemberDto) session.getAttribute("userinfo");

		// QuizDto 불러오기
		QuizDto quizDto = QuizDto.builder().c_no(c_no).q_no(q_no).build();
		quizDto = quizDao.get(quizDto); // 단일 조회
		quizDto = quizService.dateFormat(quizDto); // 해당 객체의 날짜 포맷 수정
		model.addAttribute("quizDto", quizDto);

		// All_QUESTION 불러오기
		List<ThisQuizDto> question = myAnswerService.play(userinfo.getMember_no(), q_no);
		model.addAttribute("thisQuizDto", question);

		// 첫 퀘스쳔 번호 생성 후 전달
		int question_no = questionDao.getSeq();
		model.addAttribute("question_no", question_no);

		return "quiz/quiz_edit";
	}

}
