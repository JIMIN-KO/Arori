package com.kh.arori.service.study;

import java.util.List;

import com.kh.arori.entity.study.AllQuestionDto;

public interface QuestionService {
	
	//퀘스천 생성
	public int createQuestion(List<String> content, AllQuestionDto allQuestionDto);

}
