package com.kh.arori.repository.admin;

import java.util.List;
import java.util.Map;

import com.kh.arori.entity.study.QnaDto;

public interface AdminClassesDao {
	
	//QNA 관리자 리스트
	public List<QnaDto> qnaList();
	
	// QNA 페이지 네이션 
	public List<QnaDto> getP(Map<String, String> page);

}
