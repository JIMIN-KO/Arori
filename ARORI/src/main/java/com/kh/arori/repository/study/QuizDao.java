package com.kh.arori.repository.study;

import java.util.List;

import com.kh.arori.entity.study.QuizDto;

public interface QuizDao {
	// 퀴즈 시퀀스
	public int getSeq();
		
	// 퀴즈 생성
	public void createQuiz(QuizDto quizDto);
	
	//퀴즈 목록
	public List<QuizDto> getList(int c_no);
}
