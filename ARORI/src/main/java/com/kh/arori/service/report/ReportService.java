
package com.kh.arori.service.report;

import java.util.List;
import java.util.Map;

import com.kh.arori.entity.member.ReportDto;

public interface ReportService {

   //신고글 작성
   public void write(ReportDto reportDto);
   
   //신고글 리스트
   public List<ReportDto>list();
   
   //신고글 조회
   public ReportDto content(int report_no);
   
   // 페이지 네이션 
   public List<ReportDto> page(Map<String, String> map);

   // 페이지네이션 개수
   public List<Integer> pagination(int thisCount, int pageNo);
   
   //블랙리스트
   public List<ReportDto>blacklist();

}
