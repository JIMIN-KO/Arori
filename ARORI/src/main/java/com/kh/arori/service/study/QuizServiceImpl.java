package com.kh.arori.service.study;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.arori.entity.study.QuizDto;
import com.kh.arori.repository.study.QuizDao;

@Service
public class QuizServiceImpl implements QuizService{

	@Autowired
	private QuizDao quizDao;
	
	@Override
	public int createQuiz(QuizDto quizDto) {
		int q_no= quizDao.getSeq();
		quizDto.setQ_no(q_no);
		quizDao.createQuiz(quizDto);
		return q_no;
	}
}
