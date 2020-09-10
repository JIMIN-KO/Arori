package com.kh.arori.service.study;

import java.util.List;
import java.util.Map;

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
	public List<McDto> searchList(Map<String, String> map);

	// 구독
	public void already(SubscribeDto subDto);
	
	
}
