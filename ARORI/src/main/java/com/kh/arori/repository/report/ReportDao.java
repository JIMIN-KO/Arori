package com.kh.arori.repository.report;

import java.util.List;

import com.kh.arori.entity.ReportDto;

public interface ReportDao {
	
	//신고글 작성
	public void write(ReportDto reportDto);

	//신고글 목록
	public List<ReportDto>list();
}
