package com.kh.arori.service.study;

import java.util.List;

import com.kh.arori.entity.study.AllQuestionDto;
import com.kh.arori.entity.study.ExplainDto;
import com.kh.arori.entity.study.MultipleDto;
import com.kh.arori.entity.study.OxDto;

public interface QuestionService {
	
	// OX 퀘스쳔 생성
	public int createQuestion(List<String> content, AllQuestionDto allQuestionDto, OxDto oxDto);
	
	// 선다형 퀘스쳔 생성
	public int createQuestion(List<String> content, AllQuestionDto allQuestionDto, MultipleDto multipleDto);
	
	// 단답형 퀘스쳔 생성
	public int createQuestion(List<String> content, AllQuestionDto allQuestionDto, ExplainDto explainDto);

}
