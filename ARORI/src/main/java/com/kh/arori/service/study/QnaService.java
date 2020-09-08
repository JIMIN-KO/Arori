package com.kh.arori.service.study;

import java.util.List;

import com.kh.arori.entity.study.QnaDto;

public interface QnaService {

	// QNA 작성
	public int create(List<String> qna_content, String c_no, String qna_title, String member_no);
	
	// QNA 게시글 페이지 네이션 기능
	public List<QnaDto> getP(String c_no, int pageNo);
}
