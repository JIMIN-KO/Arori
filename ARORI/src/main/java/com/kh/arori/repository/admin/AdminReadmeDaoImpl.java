package com.kh.arori.repository.admin;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.arori.entity.study.ReadmeDto;

@Repository
public class AdminReadmeDaoImpl implements AdminReadmeDao{
	
	@Autowired
	private SqlSession sqlSession;
	
	//리드미 관리자 리스트
	@Override
	public List<ReadmeDto> adminReadmeList() {
		return sqlSession.selectList("adminReadme.adminReadmeList");
	}
	
	// 리드미 페이지 네이션
	@Override
	public List<ReadmeDto> getP(Map<String, String> pagination) {
		return sqlSession.selectList("adminReadme.getP", pagination);
	}
	
	// 리드미  게시글 c_no + r_no 단일 조회
	@Override
	public ReadmeDto getCR(ReadmeDto readmeDto) {
		return sqlSession.selectOne("adminReadme.getCR", readmeDto);
	}

	
	// 리드미  게시글 관리자 수정
	@Override
	public int editReadmeAdmin(ReadmeDto readmeDto) {
		return sqlSession.update("adminReadme.editReadmeAdmin", readmeDto);
	}
	

	
	// QNA  게시글 관리자 삭제 
	@Override
	public int deleteAdmin(ReadmeDto readmeDto) {
		return sqlSession.delete("adminReadme.deleteAdmin", readmeDto);
	}



}
