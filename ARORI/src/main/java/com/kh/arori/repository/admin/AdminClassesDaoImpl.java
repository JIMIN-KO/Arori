package com.kh.arori.repository.admin;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.arori.entity.study.QnaDto;

@Repository
public class AdminClassesDaoImpl implements AdminClassesDao{
	
	@Autowired
	private SqlSession sqlSession;
	
	//QNA 관리자 리스트
	@Override
	public List<QnaDto> qnaList() {
		return sqlSession.selectList("adminClasses.adminQnaList");
	}
	
	// QNA 페이지 네이션
	@Override
	public List<QnaDto> getP(Map<String, String> pagination) {
		return sqlSession.selectList("qna.getP", pagination);
	}

}
