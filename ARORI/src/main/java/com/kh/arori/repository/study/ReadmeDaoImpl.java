package com.kh.arori.repository.study;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.arori.entity.study.ReadmeDto;

@Repository
public class ReadmeDaoImpl implements ReadmeDao {

	@Autowired
	private SqlSession sqlSession;
	
	// Readme 고유 번호 발급 
	@Override
	public int getSeq() {
		
		return sqlSession.selectOne("readme.getSeq");
	}

	// Readme 생성 
	@Override
	public void create(ReadmeDto readmeDto) {

		sqlSession.insert("readme.create", readmeDto);
	}

	// Readme 단일 조회 (r_no)
	@Override
	public ReadmeDto get(int r_no) {

		return sqlSession.selectOne("readme.get", r_no);
	}

	// Readme 단일 조회 (c_no)
	@Override
	public ReadmeDto getC(int c_no) {
		
		return sqlSession.selectOne("readme.getC", c_no);
	}

	// Readme 수정 
	@Override
	public int edit(ReadmeDto readmeDto) {

		return sqlSession.update("readme.edit", readmeDto);
	}

	// Readme 삭제 
	@Override
	public int delete(String c_no) {

		return sqlSession.delete("readme.delete", c_no);
	}

}
