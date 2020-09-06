package com.kh.arori.service.report;

import java.util.List;

import com.kh.arori.entity.ReportDto;

public interface ReportService {

	public void write(ReportDto reportDto);
	
	public List<ReportDto>list();
	
}
