package com.kh.arori.repository.study;

import java.util.List;
import java.util.Map;

import com.kh.arori.entity.study.QnaDto;

public interface QnaDao {

	// QNA 고유 번호 발급
	public int getSeg();
	
	// QNA 작성
	public int create(QnaDto qnaDto);
	
	// QNA 답글 작성
	public int createReply(QnaDto qnaDto);
	
	// QNA  게시글 단일 조회 (qna_no)
	public QnaDto get(int qna_no);

	// 클래스 별 공지 게시글 조회 (c_no)
	public List<QnaDto> getC(int c_no);

	// QNA  게시글 페이지 네이션 기능
	public List<QnaDto> getP(Map<String, String> page);

	// 해당 클래스 공지 게시글 개수 조회
	public int count(int c_no);

	// QNA  게시글 c_no + qna_no 단일 조회
	public QnaDto getCQ(QnaDto qnaDto);
		
	// QNA  게시글 수정 
	public int edit(QnaDto qnaDto);
	// QNA  게시글 수정 
	public int editReply(QnaDto qnaDto);
		
	// QNA  게시글 삭제 
	public int delete(QnaDto qnaDto);
	
	// QNA  게시글 임시 데이터 저장 
	public int createTemp(QnaDto qnaDto);
		
	// QNA  게시글 임시 데이터 조회 
	public List<QnaDto> getTemp(QnaDto qnaDto);
		
	// QNA  게시글 임시 데이터 삭제 
	public int deleteTemp(QnaDto qnaDto);
	
	// QNA  게시글 작성 중 임시 저장 게시글 전체 조회 
	public List<QnaDto> getCT(int c_no);
	
}
