package com.kh.arori.service.admin;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import com.kh.arori.entity.study.NoticeDto;

public interface AdminNoticeService {

	// Notice 관리자 리스트
	public List<NoticeDto> adminNoticeList();

	// QNA 게시글 페이지 네이션 기능
	public List<NoticeDto> getP(Map<String, String> map);

	// QNA 게시글 페이지 네이션 블럭
	public List<Integer> block(int thisCount, int pageNo);
	
//	// QNA 게시글 수정 기능
//	public String editNoticeAdmin(List<String> n_content, NoticeDto noticeDto);
//
//	// QNA 게시글 삭제 기능
//	public String deleteAdmin(NoticeDto noticeDto, int member_auth);
	
}
