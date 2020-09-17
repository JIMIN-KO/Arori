package com.kh.arori.repository.study;

import java.util.List;

import com.kh.arori.entity.study.MyAnswerDto;

public interface MyAnswerDao {

	// 나의 정답 고유 번호 발급
	public int getSeq();

	// 나의 정답 더미 데이터 삽입
	public void insert(MyAnswerDto myAnswerDto);

	// 나의 정답 갱신 / 수정
	public int update(MyAnswerDto myAnswerDto);

	// 나의 정답 데이터 삭제
	public int deleete(MyAnswerDto myAnswerDto);

	// 나의 정답 불러오기
	public List<MyAnswerDto> get(MyAnswerDto myAnswerDto);

	// 정답만 불러오기
	public List<MyAnswerDto> getCur(MyAnswerDto myAnswerDto);

	// 오답만 불러오기
	public List<MyAnswerDto> getIncur(MyAnswerDto myAnswerDto);

	// 채점을 위한 해당 퀘스쳔 정보 조회
	public MyAnswerDto check(MyAnswerDto myAnswerDto);
	
	// 정답 카운트
	public int getCurCount(MyAnswerDto myAnswerDto);
	
	// 오답 카운트
	public int getInCurCount(MyAnswerDto myAnswerDto);
}
