package com.kh.arori.service.report;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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

	@Override
	public ReportDto content(int report_no) {

		return reportDao.content(report_no);
	}

	@Override
	public void delete(ReportDto reportDto) {
		reportDao.delete(reportDto);

	}

	@Override
	public List<ReportDto> page(String report_no, int pageNo) {
		int pageSize = 10; // 한 페이지 넘버 당 게시글 개수 -> 10개
		int finish = pageNo * pageSize; // 해당 페이지 번호의 마지막 번호
		int start = finish - (pageSize - 1);

		Map<String, String> pagination = new HashMap<String, String>();
		pagination.put("report_no", report_no);
		pagination.put("start", String.valueOf(start));
		pagination.put("finish", String.valueOf(finish));

		List<ReportDto> list = reportDao.page(pagination);

		return list;
	}

	@Override
	public List<Integer> pagination(int report_no, int pageNo) {
		// TODO Auto-generated method stub
		// 페이지 네비게이터 계산
		int pageSize = 10; // 한 페이지에 보여질 게시글 개수 -> 10개
		int blockSize = 10; // 페이지네이션 블럭 개수 -> 10개
		int startBlock = (pageNo - 1) / blockSize * blockSize + 1; // 블럭 리스트 첫 번째 블럭 번호
		int finishBlock = startBlock + blockSize - 1; // 블럭 리스트 마지막 블럭 번호
		int count = reportDao.count(report_no); // 해당 클래스의 게시물 개수
		int blockCount = (count + pageSize - 1) / pageSize; // 해당 클래스의 총 블럭 개수

		// 만약 blockCount 가 finishBlock 보다 작다면 (ex. 10 > 2)
		if (finishBlock > blockCount)
			finishBlock = blockCount;

		// startBlock ~ finishBlock 만큼 반복 후 배열 객체화
		List<Integer> block = new ArrayList<Integer>();

		for (int i = startBlock; i <= finishBlock; i++) {
			block.add(i);
		}
		return block;

	}

	@Override
	public List<ReportDto> blacklist() {
		// TODO Auto-generated method stub
		return reportDao.blacklist();
	}

}
