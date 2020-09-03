package com.kh.arori.repository.study;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.arori.entity.study.ClassesDto;

@Repository
public class ClassesDaoImpl implements ClassesDao {

	@Autowired
	private SqlSession sqlSession;

	// 시퀀스 생성
	@Override
	public int getSeq() {
		int c_no = sqlSession.selectOne("classes.getSeq");
		return c_no;
	}

	// 클래스 생성(DB에 삽입)
	@Override
	public void createClasses(ClassesDto classesDto) {
		sqlSession.insert("classes.createClasses", classesDto);
	}

	// 단일 조회
	@Override
	public ClassesDto get(int c_no) {
		ClassesDto info = sqlSession.selectOne("classes.get", c_no);
		return info;
	}
	
	// 클래스 목록 조회
	@Override
	public List<ClassesDto> getList() {
		List<ClassesDto> list = sqlSession.selectList("classes, getList");
		return list;
	}

	// (성헌) 클래스 주인인지 조회
	@Override
	public ClassesDto checkM(ClassesDto classesDto) {

		return sqlSession.selectOne("classes.checkM", classesDto);
	}

}