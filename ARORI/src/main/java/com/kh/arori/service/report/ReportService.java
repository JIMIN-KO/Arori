package com.kh.arori.service.report;

import java.util.List;

import com.kh.arori.entity.member.ReportDto;

public interface ReportService {

	//신고글 작성
	public void write(ReportDto reportDto);
	
	//신고글 리스트
	public List<ReportDto>list();
	
	//신고글 조회
	public ReportDto content(int report_no);
}
