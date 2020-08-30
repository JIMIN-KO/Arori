package com.kh.arori.repository.study;

import com.kh.arori.entity.study.ClassesDto;

public interface ClassesDao {
	
	// 클래스 시퀀스 발급
	public int getSeq();
	// 클래스 생성
	public void createClasses(ClassesDto classesDto);
}
