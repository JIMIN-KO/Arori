package com.kh.arori.repository.study;

import com.kh.arori.entity.study.ClassesDto;
import com.kh.arori.entity.study.McDto;
import com.kh.arori.entity.study.SubscribeDto;

import java.util.List;
import java.util.Map;

public interface ClassesDao {

	// 클래스 시퀀스 발급
	public int getSeq();

	// 클래스 생성
	public void createClasses(ClassesDto classesDto);

	// 단일 조회
	public ClassesDto get(int c_no);

	// 클래스 목록 조회
	List<ClassesDto> getList();

	// 다양한 정렬의 목록
	List<ClassesDto> getLlist2(Map<String, String> map);

	// 나의 클래스 조회
	List<ClassesDto> myList(int member_no);

	// 클래스 정보 수정
	public void edit(ClassesDto classesDto);

	// 클래스 삭제
	public void delete(int c_no);

	// 검색 기능
	public List<McDto> searchList(Map<String, String> map);

	// (성헌) 클래스 주인인지 조회
	public ClassesDto checkM(ClassesDto classesDto);

	// 구독 테이블 시퀀스 발급
	public int getsubSeq();

	// 구독 테이블 단일조회
	public SubscribeDto checkSub(SubscribeDto subDto);

	// 구독
	public void sub(SubscribeDto subDto);

	// 구독자 수 카운트
	public int countSub(SubscribeDto subDto);

	// 구독 취소
	public void delSub(SubscribeDto subDto);

	// 구독수 업데이트
	public void subUpdate(ClassesDto classesDto);

	// 구독 목록 조회
	List<ClassesDto> mySub(int member_no);
}
