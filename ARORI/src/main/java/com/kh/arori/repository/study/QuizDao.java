package com.kh.arori.repository.study;

import java.util.List;

import com.kh.arori.entity.study.QuizDto;

public interface QuizDao {
	// 퀴즈 시퀀스
	public int getSeq();

	// 퀴즈 생성
	public void createQuiz(QuizDto quizDto);

	// 퀴즈 목록
	public List<QuizDto> getList(int c_no);

	// 퀴즈 단일 조회
	public QuizDto get(QuizDto quizDto);
	// 퀴즈 수정 / 갱신
	public int update(QuizDto quizDto);
	// 퀴즈 삭제
	public int delete(QuizDto quizDto);
}
