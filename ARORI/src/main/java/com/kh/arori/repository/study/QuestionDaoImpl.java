package com.kh.arori.repository.study;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.arori.entity.study.AllQuestionDto;
import com.kh.arori.entity.study.ExplainDto;
import com.kh.arori.entity.study.MultipleDto;
import com.kh.arori.entity.study.OxDto;
import com.kh.arori.entity.study.This_qDto;

@Repository
public class QuestionDaoImpl implements QuestionDao {

	@Autowired
	private SqlSession sqlSession;

	// 올 퀘스쳔 고유 번호 발급
	@Override
	public int getSeq() {
		int question_no = sqlSession.selectOne("question.getSeq");
		return question_no;
	}

	// OX 정답 고유 번호 발급
	@Override
	public int getSeqOx() {
		int no = sqlSession.selectOne("question.getSeqOx");
		return no;
	}

	// 선다형 정답 고유 번호 발급
	@Override
	public int getSeqMul() {
		int no = sqlSession.selectOne("question.getSeqMul");
		return no;
	}

	// 단답형 정답 고유 번호 발급
	@Override
	public int getSeqEx() {
		int no = sqlSession.selectOne("question.getSeqEx");
		return no;
	}

	// 퀘스천 생성
	@Override
	public void createQuestion(AllQuestionDto allQuestionDto) {
		sqlSession.insert("question.create", allQuestionDto);
	}

	// 퀘스쳔 수정 / 갱신
	@Override
	public int updateAQuestion(AllQuestionDto allQuestionDto) {

		return sqlSession.update("question.update", allQuestionDto);
	}

	// OX 정답 생성
	@Override
	public void createOx(OxDto oxDto) {
		sqlSession.insert("question.createOx", oxDto);
	}

	// 선다형 정답 생성
	@Override
	public void createMul(MultipleDto multipleDto) {
		sqlSession.insert("question.createMul", multipleDto);
	}

	// 단답형 정답 생성
	@Override
	public void createEx(ExplainDto explainDto) {
		sqlSession.insert("question.createEx", explainDto);
	}

	// 퀘스쳔 오작교 시퀀스 번호 발급
	@Override
	public int getSeq2(String table_name) {

		return sqlSession.selectOne("question.getSeq2", table_name);
	}

	// 퀘스쳔 오작교 데이터 삽입
	@Override
	public void insertThis(This_qDto this_qDto) {
		sqlSession.insert("question.insertThis", this_qDto);
	}

	// 퀘스쳔 단일 조회
	@Override
	public AllQuestionDto get(AllQuestionDto allQuestionDto) {

		return sqlSession.selectOne("question.get", allQuestionDto);
	}
}
