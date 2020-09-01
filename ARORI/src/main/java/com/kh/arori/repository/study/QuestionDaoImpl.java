package com.kh.arori.repository.study;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.arori.entity.study.AllQuestionDto;

@Repository
public class QuestionDaoImpl implements QuestionDao{
	
	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public int getSeq() {
		int question_no = sqlSession.selectOne("question.getSeq");
		return question_no;
	}
	@Override
	public int getSeqAq() {
		int qt_no = sqlSession.selectOne("question.getSeqAq");
		return qt_no;
	}
	@Override
	public int getSeqOx() {
		int no = sqlSession.selectOne("question.getSeqOx");
		return no;
	}
	@Override
	public int getSeqMul() {
		int no = sqlSession.selectOne("question.getSeqMul");
		return no;
	}
	@Override
	public int getSeqEx() {
		int no = sqlSession.selectOne("question.getSeqEx");
		return no;
	}
	
	
	@Override
	public void createQuestion(AllQuestionDto allQuestionDto) {
		sqlSession.insert("question.createQuestion", allQuestionDto);
	}
}
