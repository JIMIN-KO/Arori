package com.kh.arori.service.study;

import java.util.List;

import com.kh.arori.entity.study.QuizDto;

public interface QuizService {
	
	//퀴즈 생성
	public int createQuiz(int c_no);
	
	// 퀴즈 수정 / 갱신
	public String update(List<String> content, QuizDto quizDto);
	
	// 퀴즈 및 해당 퀘스쳔 정보 삭제
	public String delete(int c_no, int q_no);
	
	// 퀴즈 날짜 형식 변환
	public QuizDto dateFormat(QuizDto quizDto) throws Exception;
	
	// 퀴즈 페이지 네이션
	public List<QuizDto> getQuiz(int c_no, int pageNo);
	
	// 퀴즈 페이지 네이션 블럭
	public List<Integer> getQuizBlock(int c_no, int pageNo);
	
}
