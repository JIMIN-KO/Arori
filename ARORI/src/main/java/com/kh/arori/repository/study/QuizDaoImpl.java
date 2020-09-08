package com.kh.arori.repository.study;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.arori.entity.study.MyQuizDto;
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

	// 퀴즈 단일 조회 
	@Override
	public QuizDto get(QuizDto quizDto) {

		return sqlSession.selectOne("quiz.get", quizDto);
	}

	// 퀴즈 수정 / 갱신 
	@Override
	public int update(QuizDto quizDto) {

		return sqlSession.update("quiz.update", quizDto);
	}

	// 퀴즈 삭제
	@Override
	public int delete(QuizDto quizDto) {

		return sqlSession.delete("quiz.delete", quizDto);
	}

	// My Quiz > 고유 번호 발급
	@Override
	public int getSeqMQ() {

		return sqlSession.selectOne("quiz.getSeqMQ");
	}

	// My Quiz > 등록
	@Override
	public void insertMQ(MyQuizDto myQuizDto) {

		sqlSession.insert("quiz.insertMQ", myQuizDto);
	}

	// My Quiz > 내가 푼 퀴즈 리스트 조회
	@Override
	public List<MyQuizDto> getAMQ(MyQuizDto myQuizDto) {

		return sqlSession.selectList("quiz.getAMQ", myQuizDto);
	}

	// My Quiz > 내가 푼 퀴즈인지 여부 확인
	@Override
	public MyQuizDto getMQ(MyQuizDto myQuizDto) {

		return sqlSession.selectOne("quiz.getMQ", myQuizDto);
	}
}
