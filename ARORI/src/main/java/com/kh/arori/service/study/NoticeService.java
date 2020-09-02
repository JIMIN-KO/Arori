package com.kh.arori.service.study;

import java.util.List;

import com.kh.arori.entity.study.NoticeDto;

public interface NoticeService {
	
	// 공지 게시글 작성
	public int create(List<String> n_content, String c_no, String n_title);

}
