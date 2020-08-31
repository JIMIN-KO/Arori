package com.kh.arori.repository.study;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

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

	@Override
	public ClassesDto get(int c_no) {
		ClassesDto info = sqlSession.selectOne("classes.get", c_no);
		return info;
	}

	@Override
	public List<ClassesDto> getList() {
		List<ClassesDto> list = sqlSession.selectList("classes, getList");
		return list;
	}

}

