package com.kh.arori.repository.study;

import java.util.List;

import com.kh.arori.entity.study.AllQuestionDto;
import com.kh.arori.entity.study.ExplainDto;
import com.kh.arori.entity.study.MultipleDto;
import com.kh.arori.entity.study.OxDto;
import com.kh.arori.entity.study.ThisQuizDto;
import com.kh.arori.entity.study.This_qDto;

public interface QuestionDao {

	// 퀘스천 시퀀스
	public int getSeq();

	// ox답안 시퀀스
	public int getSeqOx();

	// 선다형 답안 시퀀스
	public int getSeqMul();

	// 단답,서술형 답안 시퀀스
	public int getSeqEx();

	// 퀘스천 생성
	public void createQuestion(AllQuestionDto allQuestionDto);

	// 퀘스쳔 수정 / 갱신
	public int updateAQuestion(AllQuestionDto allQuestionDto);

	// OX 정답 생성
	public void createOx(OxDto oxDto);

	// 선다형 정답 생성
	public void createMul(MultipleDto multipleDto);

	// 단답형 정답 생성
	public void createEx(ExplainDto explainDto);
	
	// 퀘스쳔 오작교 시퀀스 번호 발급 
	public int getSeq2(String table_name);
	
	// 퀘스쳔 오작교 데이터 삽입
	public void insertThis(This_qDto this_qDto);
	
	// 퀘스쳔 단일 조회 
	public AllQuestionDto get(AllQuestionDto allQuestionDto);
	
	// 해당 퀴즈의 퀘스쳔 정보 불러오기 
	public List<AllQuestionDto> getQuestion(int q_no);
	
	// 해당 퀴즈의 퀘스천 정보 + 정답 불러오기 (THIS_QUIZ)
	public List<ThisQuizDto> getTQ(int q_no);
}
