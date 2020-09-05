package com.kh.arori.service.study;

import java.util.List;

import com.kh.arori.entity.study.NoticeDto;

public interface NoticeService {

	// 공지 게시글 작성
	public int create(String c_no);

	// 공지 게시글 페이지 네이션 기능
	public List<NoticeDto> getP(String c_no, int pageNo);

	// 페이지네이션 계산 코드
	public List<Integer> pagination(int c_no, int pageNo);
	
	// 공지 게시글 수정 기능 
	public String edit(List<String> n_content, NoticeDto noticeDto);
	
	//  공지 게시글 삭제 기능 
	public String delete(NoticeDto noticeDto, int member_no);
	
	// 공지 게시글 임시 데이터 저장
	public String createTemp(List<String> n_content, NoticeDto noticeDto);
}
