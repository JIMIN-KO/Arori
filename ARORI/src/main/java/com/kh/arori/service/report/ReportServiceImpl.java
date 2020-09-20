package com.kh.arori.service.report;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.arori.entity.member.ReportDto;
import com.kh.arori.repository.report.ReportDao;
import com.kh.arori.service.pagination.PaginationService;

@Service
public class ReportServiceImpl implements ReportService {

   @Autowired
   ReportDao reportDao;
   
   @Autowired
   private PaginationService paginationService;

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

   
   //페이지네이션
   @Override
   public List<ReportDto> page(Map<String, String> map) {
   
      Map<String, Integer> pagination = paginationService.pagination("report_no", 0, Integer.parseInt(map.get("pageNo")));
      String start = String.valueOf(pagination.get("start"));
      String finish = String.valueOf(pagination.get("finish"));
      map.put("start", start);
      map.put("finish", finish);
      
      List<ReportDto>list = reportDao.page(map);

      return list;
   }

   
   @Override
   public List<Integer> pagination(int thisCount, int pageNo) {
   
      // 페이지 네비게이터 계산
      int count = thisCount;// 해당 클래스의 게시물 개수
      List<Integer> block = paginationService.paginationBlock(0, pageNo, count);
      return block;

   }
   
   @Override
   public List<ReportDto> blacklist() {
      // TODO Auto-generated method stub
      return reportDao.blacklist();
   }

}