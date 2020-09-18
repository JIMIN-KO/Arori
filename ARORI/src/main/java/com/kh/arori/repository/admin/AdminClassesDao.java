package com.kh.arori.repository.admin;

import java.util.List;
import java.util.Map;

import com.kh.arori.entity.study.QnaDto;
import com.kh.arori.entity.study.QnaMemberDto;

public interface AdminClassesDao {
	
	//QNA 관리자 리스트
	public List<QnaMemberDto> adminQnaList();
	
	// QNA 페이지 네이션 
	public List<QnaMemberDto> getP(Map<String, String> page);
	
	// QNA  게시글 c_no + qna_no 단일 조회
	public QnaDto getCQ(QnaDto qnaDto);
		
	// QNA  게시글 관리자 수정 
	public int editAdmin(QnaDto qnaDto);
	
	// QNA  게시글 관리자 삭제 
	public int deleteAdmin(QnaDto qnaDto);

}
