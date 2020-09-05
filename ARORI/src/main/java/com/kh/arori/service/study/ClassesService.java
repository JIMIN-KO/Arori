package com.kh.arori.service.study;

import java.util.List;

import com.kh.arori.entity.study.ClassesDto;
import com.kh.arori.entity.study.McDto;
import com.kh.arori.entity.study.SubscribeDto;

public interface ClassesService {
	
	// 클래스 추가
	public int createClasses(ClassesDto classesDto);
	
	// 시간 표현식 
//	public String get_time();
//	public String get_day();
//	public String get_autotime();
	
	// 검색 목록 조회
	public List<McDto> searchList(String searchOption, String keyword);
	
	// 구독
	public void sub(SubscribeDto subDto);
	// 구독 취소
	public void delSub(SubscribeDto subDto);
	// 구독자수 카운트
	public int countSub(SubscribeDto subDto);
}
