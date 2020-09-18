package com.kh.arori.service.admin;

import java.util.List;

import com.kh.arori.entity.study.QnaDto;

public interface AdminClassesService {
	
	// QNA 관리자 리스트
	public List<QnaDto> qnaList();
	
	// QNA 게시글 페이지 네이션 기능
	public List<QnaDto> getP(int pageNo);

}
