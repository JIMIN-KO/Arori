package com.kh.arori.service.study;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kh.arori.entity.study.QuizDto;
import com.kh.arori.repository.study.QuizDao;
import com.kh.arori.service.toast.ToastService;

@Service
public class QuizServiceImpl implements QuizService {

	@Autowired
	private ToastService toastService;
	
	@Autowired
	private QuizDao quizDao;

	// 퀴즈 생성
	@Override
	@Transactional
	public int createQuiz(int c_no) {
		QuizDto quizDto = QuizDto.builder().c_no(c_no).q_title("이름없는 퀴즈").q_score(0).q_runtime(100).q_scoring(0)
				.build();

		// 퀴즈 시퀀스 번호 발급
		int q_no = quizDao.getSeq();

		quizDto.setQ_no(q_no); // 퀴즈 번호
		quizDao.createQuiz(quizDto); // 퀴즈 생성

		return q_no;
	}

	// 퀴즈 수정 / 갱신
	@Override
	@Transactional
	public String update(List<String> content, QuizDto quizDto) {
		String q_content = toastService.content(content);
		
		quizDto.setQ_content(q_content);
		quizDto.setQ_open(quizDto.getQ_open().replace("T", " ") + ":00"); // 퀴즈 오픈 시간 포맷 수정
		quizDto.setQ_close(quizDto.getQ_close().replace("T", " ") + ":00"); // 퀴즈 클로스 시간 포맷 수정
		quizDto.setQ_score_open(quizDto.getQ_score_open().replace("T", " ") + ":00"); // 점수 오픈 시간 포맷 수정

		int result = quizDao.update(quizDto);
		if (result == 1) {
			return "redirect:/classes/quiz/detail/" + quizDto.getC_no() + "/" + quizDto.getQ_no();
		} else {
			return "redirect:/classes/quiz/detail/" + quizDto.getC_no() + "/" + quizDto.getQ_no() + "?fail";
		}

	}
}
