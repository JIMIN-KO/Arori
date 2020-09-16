
package com.kh.arori.service.report;

import java.util.List;

import com.kh.arori.entity.member.ReportDto;
import com.kh.arori.entity.study.NoticeDto;

public interface ReportService {

	//신고글 작성
	public void write(ReportDto reportDto);
	
	//신고글 리스트
	public List<ReportDto>list();
	
	//신고글 조회
	public ReportDto content(int report_no);
	
	//신고글 삭제
	public void delete(ReportDto reportDto);
	
	// 페이지 네이션 
	public List<ReportDto> page(String report_no, int pageNo);

	// 페이지네이션 개수
	public List<Integer> pagination(int report_no, int pageNo);
	
	//블랙리스트
	public List<ReportDto>blacklist();

}

