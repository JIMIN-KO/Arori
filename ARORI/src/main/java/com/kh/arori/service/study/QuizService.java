package com.kh.arori.service.study;

import java.util.List;

import com.kh.arori.entity.study.QuizDto;

public interface QuizService {
	
	//퀴즈 생성
	public int createQuiz(int c_no);
	
	// 퀴즈 수정 / 갱신
	public String update(List<String> content, QuizDto quizDto);
	
}
