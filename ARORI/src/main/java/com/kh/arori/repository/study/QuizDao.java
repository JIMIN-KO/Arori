package com.kh.arori.repository.study;

import com.kh.arori.entity.study.QuizDto;

public interface QuizDao {
	// 퀴즈 시퀀스
	public int getSeq();
		
	// 퀴즈 생성
	public void createQuiz(QuizDto quizDto);
}
