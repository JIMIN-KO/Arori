package com.kh.arori.service.study;

import java.util.List;

import com.kh.arori.entity.study.MyAnswerDto;
import com.kh.arori.entity.study.ThisQuizDto;

public interface MyAnswerService {

	// 퀴즈 풀기
	public List<ThisQuizDto> play(int member_no, int q_no);
	
	// 퀴즈에 새로운 퀘스쳔으로 인해 회원 답안에 해당 퀘스쳔의 답안지가 없을 때
	public void newAnswer(MyAnswerDto myAnswerDto);
}
