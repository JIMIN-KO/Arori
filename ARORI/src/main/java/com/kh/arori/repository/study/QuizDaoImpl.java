package com.kh.arori.repository.study;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.arori.entity.study.QuizDto;

@Repository
public class QuizDaoImpl implements QuizDao{

	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public int getSeq() {
		int q_no = sqlSession.selectOne("quiz.getSeq");
		return q_no;
	}
	
	// 퀴즈 생성
	@Override
	public void createQuiz(QuizDto quizDto) {
		sqlSession.insert("quiz.createQuiz", quizDto);
	}
	
	//퀴즈 리스트
	@Override
	public List<QuizDto> getList(int c_no) {
		List<QuizDto> list = sqlSession.selectList("quiz.getList", c_no);
		return list;
	}
}
