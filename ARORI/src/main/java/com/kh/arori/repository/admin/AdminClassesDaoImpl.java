package com.kh.arori.repository.admin;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.arori.entity.study.QnaDto;
import com.kh.arori.entity.study.QnaMemberDto;

@Repository
public class AdminClassesDaoImpl implements AdminClassesDao{
	
	@Autowired
	private SqlSession sqlSession;
	
	//QNA 관리자 리스트
	@Override
	public List<QnaMemberDto> adminQnaList() {
		return sqlSession.selectList("adminClasses.adminQnaList");
	}
	
	// QNA 페이지 네이션
	@Override
	public List<QnaMemberDto> getP(Map<String, String> pagination) {
		return sqlSession.selectList("adminClasses.getP", pagination);
	}
	
	// QNA  게시글 c_no + qna_no 단일 조회
	@Override
	public QnaDto getCQ(QnaDto qnaDto) {
		return sqlSession.selectOne("adminClasses.getCQ", qnaDto);
	}
	
	// QNA  게시글 관리자 수정
	@Override
	public int editAdmin(QnaDto qnaDto) {
		return sqlSession.update("adminClasses.editAdmin", qnaDto);
	}
	
	// QNA  게시글 관리자 삭제 
	@Override
	public int deleteAdmin(QnaDto qnaDto) {
		return sqlSession.delete("adminClasses.deleteAdmin", qnaDto);
	}


}
