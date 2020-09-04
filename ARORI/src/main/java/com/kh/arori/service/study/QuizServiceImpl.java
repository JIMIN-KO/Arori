package com.kh.arori.service.study;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.arori.entity.study.QuizDto;
import com.kh.arori.repository.study.QuizDao;

@Service
public class QuizServiceImpl implements QuizService{

	@Autowired
	private QuizDao quizDao;
	
	//퀴즈 생성
	@Override
	public int createQuiz(QuizDto quizDto) {
		int q_no= quizDao.getSeq();
		quizDto.setQ_open(quizDto.getQ_open().replace("T", " ") + ":00");
		quizDto.setQ_close(quizDto.getQ_close().replace("T", " ") + ":00");
		quizDto.setQ_score_open(quizDto.getQ_score_open().replace("T", " ") + ":00");
		quizDto.setQ_no(q_no);
		quizDao.createQuiz(quizDto);
		return q_no;
	}
}
