package com.kh.arori.service.report;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.arori.entity.member.ReportDto;
import com.kh.arori.repository.report.ReportDao;

@Service
public class ReportServiceImpl implements ReportService {

	@Autowired
	ReportDao reportDao;

	@Override
	public void write(ReportDto reportDto) {
		reportDao.write(reportDto);
	}

	@Override
	public List<ReportDto> list() {
		return reportDao.list();
	}

}
