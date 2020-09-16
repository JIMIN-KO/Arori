package com.kh.arori.repository.study;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.arori.entity.study.AllQuestionDto;
import com.kh.arori.entity.study.ExplainDto;
import com.kh.arori.entity.study.MultipleDto;
import com.kh.arori.entity.study.OxDto;
import com.kh.arori.entity.study.ThisQuizDto;
import com.kh.arori.entity.study.This_qDto;

@Repository
public class QuestionDaoImpl implements QuestionDao {

	@Autowired
	private SqlSession sqlSession;

	// ALL_QUESTION
	// 올 퀘스쳔 고유 번호 발급
	@Override
	public int getSeq() {
		int question_no = sqlSession.selectOne("question.getSeq");
		return question_no;
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
	
	// 퀘스쳔 삭제
	@Override
	public int deleteQuestion(AllQuestionDto allQuestionDto) {

		return sqlSession.delete("question.delete", allQuestionDto);
	}

	// 퀘스쳔 단일 조회
	@Override
	public AllQuestionDto get(AllQuestionDto allQuestionDto) {

		return sqlSession.selectOne("question.get", allQuestionDto);
	}

	// 해당 퀴즈의 퀘스쳔 정보 가지고 오기
	@Override
	public List<AllQuestionDto> getQuestion(int q_no) {

		return sqlSession.selectList("question.getQuestion", q_no);
	}

	// ALL_QUESTION + 유형 별 정답 테이블 
	// 해당 퀴즈의 퀘스쳔 정보 + 정답 가지고 오기
	@Override
	public List<ThisQuizDto> getTQ(int q_no) {

		return sqlSession.selectList("question.getTQ", q_no);
	}

	// ALL_QUESTION <-> 정답 테이블 오작교
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
	
	// 퀴즈 수정을 위한 THIS_Q 테이블 조회
	@Override
	public int getAnswerNo(int question_no) {

		return sqlSession.selectOne("question.getAnswerNo", question_no);
	}

	// OX
	// OX 정답 고유 번호 발급
	@Override
	public int getSeqOx() {
		int no = sqlSession.selectOne("question.getSeqOx");
		return no;
	}

	// OX 정답 생성
	@Override
	public void createOx(OxDto oxDto) {
		sqlSession.insert("question.createOx", oxDto);
	}

	// OX 정답 수정
	@Override
	public int updateOx(OxDto oxDto) {

		return sqlSession.update("question.updateOx", oxDto);
	}

	// OX 정답 삭제
	@Override
	public int deleteOx(OxDto oxDto) {

		return sqlSession.delete("question.deleteOx", oxDto);
	}

	// 선다형
	// 선다형 정답 고유 번호 발급
	@Override
	public int getSeqMul() {
		int no = sqlSession.selectOne("question.getSeqMul");
		return no;
	}

	// 선다형 정답 생성
	@Override
	public void createMul(MultipleDto multipleDto) {
		sqlSession.insert("question.createMul", multipleDto);
	}

	// 선다형 정답 수정
	@Override
	public int updateMul(MultipleDto multipleDto) {

		return sqlSession.update("question.updateMul", multipleDto);
	}

	// 선다형 정답 삭제
	@Override
	public int deleteMul(MultipleDto multipleDto) {

		return sqlSession.delete("question.deleteMul", multipleDto);
	}

	// 단답형
	// 단답형 정답 고유 번호 발급
	@Override
	public int getSeqEx() {
		int no = sqlSession.selectOne("question.getSeqEx");
		return no;
	}

	// 단답형 정답 생성
	@Override
	public void createEx(ExplainDto explainDto) {
		sqlSession.insert("question.createEx", explainDto);
	}

	// 단답형 정답 수정
	@Override
	public int updateEx(ExplainDto explainDto) {

		return sqlSession.update("question.updateEx", explainDto);
	}

	// 단답형 정답 삭제
	@Override
	public int deleteEx(ExplainDto explainDto) {

		return sqlSession.delete("question.deleteEx", explainDto);
	}

	// 정답 통합 삭제
	@Override
	public int deleteAnswer(This_qDto this_qDto) {

		return sqlSession.delete("question.deleteAnswer", this_qDto);
	}
}
