package com.kh.arori.repository.study;

import com.kh.arori.entity.study.AllQuestionDto;

public interface QuestionDao {

	// 퀘스천 시퀀스
	public int getSeq();

	// 쿼스천 타입 시퀀스
	public int getSeqAq();

	// ox답안 시퀀스
	public int getSeqOx();

	// 선다형 답안 시퀀스
	public int getSeqMul();

	// 단답,서술형 답안 시퀀스
	public int getSeqEx();

	// 퀘스천 생성
	public void createQuestion(AllQuestionDto allQuestionDto);

}
