package com.kh.arori.repository.report;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.arori.entity.member.ReportDto;

@Repository
public class ReportDaoImpl implements ReportDao {

	@Autowired
	private SqlSession sqlSession;

	//신고글 작성
	@Override
	public void write(ReportDto reportDto) {

		sqlSession.insert("report.write", reportDto);
	}

	// 신고글 목록
	@Override
	public List<ReportDto> list() {
		return sqlSession.selectList("report.list");
	}

	@Override
	public ReportDto content(int report_no) {
		
		return sqlSession.selectOne("report.content",report_no);
	}

	@Override
	public void delete(int report_no) {
		sqlSession.delete("report.delete",report_no);
		
	}

}
