package com.kh.arori.repository.study;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

import com.kh.arori.entity.member.MemberDto;
import com.kh.arori.entity.study.ClassesDto;
import com.kh.arori.entity.study.MCIDto;
import com.kh.arori.entity.study.SubscribeDto;

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
		List<ClassesDto> list = sqlSession.selectList("classes, list");
		
		return list;
		}
	
	// 다양한 기준의 정렬
	@Override
	public List<MCIDto> getMCI(Map<String, String> map) {
			
		return sqlSession.selectList("classes.getMCI", map);
	}
	
	// 내가 만든 클래스 목록 조회
	@Override
	public List<ClassesDto> myList(int member_no) {
		List<ClassesDto> list = sqlSession.selectList("classes.myList", member_no);
		return list;
	}
	
	// 수정
	@Override
	public void edit(ClassesDto classesDto) {
		sqlSession.update("classes.edit", classesDto);		
	}


	// 삭제
	@Override
	public void delete(int c_no) {
		sqlSession.delete("classes.delete", c_no);		
	}

	// 검색
	@Override
	public List<MCIDto> searchList(Map<String, String> map) {

		return sqlSession.selectList("classes.search", map);
	}


	// (성헌) 클래스 주인인지 조회
	@Override
	public ClassesDto checkM(ClassesDto classesDto) {

		return sqlSession.selectOne("classes.checkM", classesDto);
	}

	// 구독 시퀀스 발급
	@Override
	public int getsubSeq() {
		int sub_no = sqlSession.selectOne("classes.getsubSeq");
		return sub_no;
	}

	// 구독자 수 카운트
	@Override
	public int countSub(SubscribeDto subDto) {
		return sqlSession.selectOne("classes.countSub", subDto);
	}

	// 구독
	@Override
	public void sub(SubscribeDto subDto) {
		sqlSession.insert("classes.sub", subDto);		
	}

	// 구독 취소
	@Override
	public int delSub(SubscribeDto subDto) {
		return sqlSession.delete("classes.delSub", subDto);
	}

	// 구독 테이블 단일조회
	@Override
	public SubscribeDto checkSub(SubscribeDto subDto) {
		SubscribeDto subInfo = sqlSession.selectOne("classes.checkSub", subDto);
		return subInfo;
	}

	// 구독 후 데이터 갱신
	@Override
	public void subUpdate(ClassesDto classesDto) {
		sqlSession.update("classes.subUpdate", classesDto);
	}

	// 나의 구독 클래스 리스트
	@Override
	public List<MCIDto> mySub(int member_no) {
		List<MCIDto> list = sqlSession.selectList("classes.getSub", member_no);
		return list;
	}

	@Override
	public List<MemberDto> subMe(int c_no) {
		List<MemberDto> list = sqlSession.selectList("classes.subMe", c_no);
		return list;
	}

	@Override
	public List<SubscribeDto> getMySubClass(int member_no) {
		
		return sqlSession.selectList("classes.getMySubClass", member_no);
	}


}

