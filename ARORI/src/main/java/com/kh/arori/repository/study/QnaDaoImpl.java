package com.kh.arori.repository.study;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.arori.entity.study.QnaDto;

@Repository
public class QnaDaoImpl implements QnaDao{
	
	@Autowired
	private SqlSession sqlSession;
	
	// QNA 고유번호 발급
	@Override
	public int getSeg() {
		return sqlSession.selectOne("qna.getSeq");
	}
	
	// QNA 새 글작성
	@Override
	public int create(QnaDto qnaDto) {
		return sqlSession.insert("qna.create", qnaDto);
	}
	
	// QNA 덧글 작성
	
	// QNA 게시글 페이지 네이션
	@Override
	public List<QnaDto> getP(Map<String, String> pagenation) {
		return sqlSession.selectList("qna.getP", pagenation);
	}
	

}
