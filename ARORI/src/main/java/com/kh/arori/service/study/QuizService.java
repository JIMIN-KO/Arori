package com.kh.arori.service.study;

import com.kh.arori.entity.study.QuizDto;

public interface QuizService {
	
	//퀴즈 생성
	public int createQuiz(QuizDto quizDto);
	
}
