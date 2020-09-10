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

		return sqlSession.selectOne("myAnswer.getSeq");
	}

	// 나의 정답 더미 데이터 삽입
	@Override
	public void insert(MyAnswerDto myAnswerDto) {
		sqlSession.insert("myAnswer.insert", myAnswerDto);
		
	}

	// 나의 정답 갱신 / 수정
	@Override
	public int update(MyAnswerDto myAnswerDto) {

		return sqlSession.update("myAnswer.update", myAnswerDto);
	}

	// 나의 정답 조회 > 퀴즈 번호 
	@Override
	public List<MyAnswerDto> get(MyAnswerDto myAnswerDto) {

		return sqlSession.selectList("myAnswer.get", myAnswerDto);
	}

	// 나의 정답만 조회 > 퀴즈 번호
	@Override
	public List<MyAnswerDto> getCur(MyAnswerDto myAnswerDto) {

		return sqlSession.selectList("myAnswer.getCur", myAnswerDto);
	}

	// 나의 오답만 조회 > 퀴즈 번호
	@Override
	public List<MyAnswerDto> getIncur(MyAnswerDto myAnswerDto) {

		return sqlSession.selectList("myAnswer.getInCur", myAnswerDto);
	}

}
