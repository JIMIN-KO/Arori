package com.kh.arori.repository.report;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.arori.entity.member.ReportDto;

@Repository
public class ReportDaoImpl implements ReportDao {

   @Autowired
   private SqlSession sqlSession;

   // 신고글 작성
   @Override
   public void write(ReportDto reportDto) {

      sqlSession.insert("report.write", reportDto);
   }

   // 신고글 목록
   @Override
   public List<ReportDto> list() {
      return sqlSession.selectList("report.list");
   }
   //신고글 상세조회
   @Override
   public ReportDto content(int report_no) {

      return sqlSession.selectOne("report.content", report_no);
   }
   //신고글 삭제
   @Override
   public void delete(int report_no) {
      sqlSession.delete("report.delete", report_no);

   }
   //신고글 페이지네이션
   @Override
   public List<ReportDto> page(Map<String, String> map) {
      return sqlSession.selectList("admin.reportPage", map);
   }

   //신고 카운트
   @Override
   public int reportCount() {
      
      return sqlSession.selectOne("report.reportCount");
   }

   // 블랙리스트
   @Override
   public List<ReportDto> blacklist() {
      return sqlSession.selectList("report.blacklist");
   }

}