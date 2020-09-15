package com.kh.arori.repository.study;

import java.util.List;
import java.util.Map;

import com.kh.arori.entity.study.MyQuizDto;
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

	// 해당 퀴즈에 대한 오작교 데이터 가지고 오기
	public List<Map<String, Integer>> getThis_q(int q_no);

	// My Quiz > 고유 번호 발급
	public int getSeqMQ();

	// My Quiz > 등록
	public void insertMQ(MyQuizDto myQuizDto);

	// My Quiz > 삭제
	public int deleteMQ(MyQuizDto myQuizDto);

	// My Quiz > 내가 푼 퀴즈 리스트 조회
	public List<MyQuizDto> getAMQ(MyQuizDto myQuizDto);

	// My Quiz > 내가 푼 퀴즈인지 여부 확인
	public MyQuizDto getMQ(MyQuizDto myQuizDto);
	
	// My Quiz > 내 가 푼 퀴즈 점수 업데이트
	public int updateMQ(MyQuizDto myQuizDto);
}
