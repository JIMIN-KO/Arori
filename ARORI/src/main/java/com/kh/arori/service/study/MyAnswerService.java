package com.kh.arori.service.study;

import java.util.List;

import com.kh.arori.entity.study.ThisQuizDto;

public interface MyAnswerService {

	// 퀴즈 풀기
	public List<ThisQuizDto> play(int member_no, int q_no);
}
