package com.kh.arori.repository.study;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.arori.entity.study.QuizDto;

@Repository
public class QuizDaoImpl implements QuizDao{

	@Autowired
	private SqlSession sqlSessioin;
	
	@Override
	public int getSeq() {
		int q_no = sqlSessioin.selectOne("quiz.getSeq");
		return q_no;
	}
	
	// 퀴즈 생성
	@Override
	public void createQuiz(QuizDto quizDto) {
		sqlSessioin.insert("quiz.createQuiz", quizDto);
	}
}
