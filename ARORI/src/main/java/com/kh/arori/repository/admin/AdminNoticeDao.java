package com.kh.arori.repository.admin;

import java.util.List;
import java.util.Map;

import com.kh.arori.entity.study.NoticeDto;
import com.kh.arori.entity.study.QnaDto;
import com.kh.arori.entity.study.QnaMemberDto;

public interface AdminNoticeDao {
	
	//QNA 관리자 리스트
	public List<NoticeDto> adminNoticeList();
	
	// QNA 페이지 네이션 
	public List<NoticeDto> getP(Map<String, String> page);
	
	
	// QNA  게시글 c_no + n_no 단일 조회
	public NoticeDto getCN(NoticeDto noticeDto);

	
//	// QNA  게시글 관리자 수정 
//	public int editQnaAdmin(QnaDto qnaDto);
//	
//	// QNA  게시글 관리자 삭제 
//	public int deleteAdmin(QnaDto qnaDto);
//	
	
	

}
