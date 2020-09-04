package com.kh.arori.repository.study;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.kh.arori.entity.study.ClassesDto;
import com.kh.arori.entity.study.McDto;

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
	// 수정
	@Override
	public void edit(ClassesDto classesDto) {
		sqlSession.update("classes.edit", classesDto);		
	}

	// 나의 클래스 목록 조회
	@Override
	public List<ClassesDto> myList(int member_no) {
		List<ClassesDto> list = sqlSession.selectList("classes.myList", member_no);
		return list;
	}

	// 삭제
	@Override
	public void delete(int c_no) {
		sqlSession.delete("classes.delete", c_no);		
	}

	// 검색
	@Override
	public List<McDto> searchList(String searchOption, String keyword) {
		Map<String, String> map = new HashMap<String, String>();
		map.put("searchOption", searchOption);
		map.put("keyword", keyword);
		return sqlSession.selectList("classes.search", map);
		
	}

	// (성헌) 클래스 주인인지 조회
	@Override
	public ClassesDto checkM(ClassesDto classesDto) {

		return sqlSession.selectOne("classes.checkM", classesDto);
	}

}

