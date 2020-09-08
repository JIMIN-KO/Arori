package com.kh.arori.repository.img;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.arori.entity.img.All_imgDto;
import com.kh.arori.entity.img.This_imgDto;

@Repository
public class ImgDaoImpl implements ImgDao {

	@Autowired
	private SqlSession sqlSession;

	// 이미지 고유 번호 발급
	@Override
	public int getSeq() {

		return sqlSession.selectOne("img.getSeq");
	}

	// 모든 이미지 테이블 번호 발급 -> 테스트 중!
	@Override
	public int getSeq_all(String table_name) {

		return sqlSession.selectOne("img.getSeq_all", table_name);
	}

	// 이미지 통합 테이블 데이터 추가 (ALL_IMG)
	@Override
	public void insert(All_imgDto all_imgDto) {

		sqlSession.selectOne("img.insert", all_imgDto);
	}

	// 이미지 오작교 테이블 데이터 추가 (테이블 이름_IMG)
	@Override
	public void insert2(This_imgDto this_imgDto) {

		sqlSession.selectOne("img.insert2", this_imgDto);
	}

	// 통합 이미지 테이블 데이터 조회
	@Override
	public All_imgDto get(This_imgDto this_imgDto) {

		return sqlSession.selectOne("img.get", this_imgDto);
	}
	
	// 오작교 테이블  THIS_NO 조회 
	@Override
	public List<This_imgDto> get2(This_imgDto this_imgDto) {

		return sqlSession.selectList("img.get2", this_imgDto);
	}

	// 이미지 통합 테이블 삭제
	@Override
	public void delete(All_imgDto all_imgDto) {
		sqlSession.delete("img.delete", all_imgDto);
	}

	// 오작교 테이블 데이터 삭제
	@Override
	public void delete2(This_imgDto this_imgDto) {
		sqlSession.delete("img.delete2", this_imgDto);
	}

}
