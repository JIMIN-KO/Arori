package com.kh.arori.repository.study;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.arori.entity.study.MyAnswerDto;

@Repository
public class MyAnswerDaoImpl implements MyAnswerDao {

	@Autowired
	private SqlSession sqlSession;

	// 나의 정답 고유 번호 발급
	@Override
	public int getSeq() {

		return sqlSession.selectOne("answer.getSeq");
	}

	// 나의 정답 더미 데이터 삽입
	@Override
	public void insert(MyAnswerDto myAnswerDto) {
		sqlSession.insert("answer.insert", myAnswerDto);

	}

	// 나의 정답 갱신 / 수정
	@Override
	public int update(MyAnswerDto myAnswerDto) {

		return sqlSession.update("answer.update", myAnswerDto);
	}

	// 나의 정답 데이터 삭제
	@Override
	public int deleete(MyAnswerDto myAnswerDto) {

		return sqlSession.delete("answer.delete", myAnswerDto);
	}

	// 나의 정답 조회 > 퀴즈 번호
	@Override
	public List<MyAnswerDto> get(MyAnswerDto myAnswerDto) {

		return sqlSession.selectList("answer.get", myAnswerDto);
	}

	// 나의 정답만 조회 > 퀴즈 번호
	@Override
	public List<MyAnswerDto> getCur(MyAnswerDto myAnswerDto) {

		return sqlSession.selectList("answer.getCur", myAnswerDto);
	}

	// 나의 오답만 조회 > 퀴즈 번호
	@Override
	public List<MyAnswerDto> getIncur(MyAnswerDto myAnswerDto) {

		return sqlSession.selectList("answer.getInCur", myAnswerDto);
	}

	// 채점을 위한 해당 퀘스쳔 정보 조회
	@Override
	public MyAnswerDto check(MyAnswerDto myAnswerDto) {

		return sqlSession.selectOne("answer.check", myAnswerDto);
	}

	
	// 나의 정답 카운트 
	@Override
	public int getCurCount(MyAnswerDto myAnswerDto) {

		return sqlSession.selectOne("answer.getCurCount", myAnswerDto);
	}

	
	// 나의 오답 카운트
	@Override
	public int getInCurCount(MyAnswerDto myAnswerDto) {

		return sqlSession.selectOne("answer.getInCurCount", myAnswerDto);
	}

}
