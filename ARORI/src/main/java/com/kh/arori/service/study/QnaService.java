package com.kh.arori.service.study;

import java.util.List;

import com.kh.arori.entity.study.QnaDto;

public interface QnaService {

	// QNA 작성
	public int create(List<String> qna_content, String c_no, String qna_title, String member_no);
	
	public int createReply(List<String> content, QnaDto qnaDto);
	
	// QNA 게시글 페이지 네이션 기능
	public List<QnaDto> getP(String c_no, int pageNo);
	
	// 페이지네이션 계산 코드
	public List<Integer> pagination(int c_no, int pageNo);
		
	// QNA 게시글 수정 기능 
	public String edit(List<String> qna_content, QnaDto qnaDto);
		
	//  QNA 게시글 삭제 기능 
	public String delete(QnaDto qnaDto, int member_no);
	
	// QNA 게시글 임시 데이터 저장
	public String createTemp(List<String> qna_content, QnaDto qnaDto);
}
