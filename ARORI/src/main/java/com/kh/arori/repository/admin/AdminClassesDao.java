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
	public QnaMemberDto getCQ(QnaDto qnaDto);
	// QNA  게시글 c_no + qna_no 단일 조회2
	public QnaMemberDto getCQ2(QnaDto qnaDto);
		
	// QNA  게시글 관리자 수정 
	public int editQnaAdmin(QnaDto qnaDto);
	
//	// QNA  게시글 임시 데이터 저장 
//	public int createTempAdmin(QnaDto qnaDto);
	
	// QNA  게시글 관리자 삭제 
	public int deleteAdmin(QnaDto qnaDto);
	
	
	

}
