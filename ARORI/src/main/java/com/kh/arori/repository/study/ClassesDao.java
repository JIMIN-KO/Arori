package com.kh.arori.repository.study;

import com.kh.arori.entity.study.ClassesDto;
import com.kh.arori.entity.study.McDto;

import java.util.List;

public interface ClassesDao {

	// 클래스 시퀀스 발급
	public int getSeq();
	// 클래스 생성
	public void createClasses(ClassesDto classesDto);
	// 단일 조회
	ClassesDto get(int c_no);
	// 클래스 목록 조회
	List<ClassesDto> getList();
	// 클래스 정보 수정
	public void edit(ClassesDto classesDto);
	// 나의 클래스 조회
	List<ClassesDto> myList(int member_no);
	// 클래스 삭제
	public void delete(int c_no);
	// 검색 기능
	public List<McDto> searchList(String searchOption, String keyword);
	
}
