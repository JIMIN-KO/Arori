package com.kh.arori.service.admin;

import java.util.List;
import java.util.Map;

import com.kh.arori.entity.study.QnaDto;
import com.kh.arori.entity.study.QnaMemberDto;

public interface AdminClassesService {

	// QNA 관리자 리스트
	public List<QnaMemberDto> adminQnaList();

	// QNA 게시글 페이지 네이션 기능
	public List<QnaMemberDto> getP(Map<String, String> map);

	// QNA 게시글 페이지 네이션 블럭
	public List<Integer> block(int thisCount, int pageNo);
	
	// QNA 게시글 수정 기능
	public String editQnaAdmin(List<String> qna_content, QnaDto qnaDto);

	// QNA 게시글 삭제 기능
	public String deleteAdmin(QnaDto qnaDto, int member_auth);
	
}
