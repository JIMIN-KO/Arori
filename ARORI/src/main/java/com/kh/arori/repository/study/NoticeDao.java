package com.kh.arori.repository.study;

import java.util.List;

import com.kh.arori.entity.study.NoticeDto;

public interface NoticeDao {
	
	// 공지 게시글 고유 번호 발급
	public int getSeq();
	
	// 공지 게시글 작성
	public int create(NoticeDto noticeDto);
	
	// 공지 게시글 단일 조회 (n_no)
	public NoticeDto get(int n_no);
	
	// 클래스 별 공지 게시글 조회 (c_no)
	public List<NoticeDto> getC(int c_no);
}
