package com.kh.arori.repository.report;

import java.util.List;
import java.util.Map;

import com.kh.arori.entity.member.ReportDto;
import com.kh.arori.entity.study.NoticeDto;

public interface ReportDao {
	
	//신고글 작성
	public void write(ReportDto reportDto);

	//신고글 목록
	public List<ReportDto>list();

	//신고글 보기
	public ReportDto content(int report_no);
	
	//신고글 삭제
	public void delete(ReportDto reportDto);
	
	// 페이지 네이션 
	public List<ReportDto> page(Map<String, String> page);

	// 페이지네이션 게시글 개수 조회
	public int count(int report_no);

	//신고글 개수
	public int reportCount(ReportDto reportDto);
}
