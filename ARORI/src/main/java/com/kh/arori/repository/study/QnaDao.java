package com.kh.arori.repository.study;

import java.util.List;
import java.util.Map;

import com.kh.arori.entity.study.NoticeDto;
import com.kh.arori.entity.study.QnaDto;

public interface QnaDao {

	// QNA 고유 번호 발급
	public int getSeg();
	
	// QNA 작성
	public int create(QnaDto qnaDto);
	
	//QNA 게시글 페이지 네이션 기능
	public List<QnaDto> getP(Map<String, String> pagenation);
	
}
