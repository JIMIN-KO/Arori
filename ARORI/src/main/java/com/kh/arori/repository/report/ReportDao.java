package com.kh.arori.repository.report;

import java.util.List;
import java.util.Map;

import com.kh.arori.entity.member.ReportDto;

public interface ReportDao {
   
   //신고글 작성
   public void write(ReportDto reportDto);

   //신고글 목록
   public List<ReportDto>list();

   //신고글 보기
   public ReportDto content(int report_no);
   
   // 페이지 네이션 
   public List<ReportDto> page(Map<String, String> map);

   //신고글 개수
   public int reportCount();
   
   //블랙리스트
   public List<ReportDto>blacklist();
   
   //신고글 삭제
   public void delete(int report_no);
   
   
}