package com.kh.arori.repository.admin;

import java.util.List;
import java.util.Map;

import com.kh.arori.entity.study.NoticeDto;
import com.kh.arori.entity.study.QnaDto;

public interface AdminNoticeDao {
	
	//Notice 관리자 리스트
	public List<NoticeDto> adminNoticeList();
	
	// Notice 페이지 네이션 
	public List<NoticeDto> getP(Map<String, String> page);
	
	
	// Notice 게시글 c_no + n_no 단일 조회
	public NoticeDto getCN(NoticeDto noticeDto);

	
	// Notice  게시글 관리자 수정 
	public int editNoticeAdmin(NoticeDto noticeDto);
	
	// Notice  게시글 관리자 삭제 
	public int deleteAdmin(NoticeDto noticeDto);
	
	
	

}
