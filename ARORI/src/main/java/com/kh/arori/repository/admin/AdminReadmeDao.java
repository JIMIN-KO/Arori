package com.kh.arori.repository.admin;

import java.util.List;
import java.util.Map;

import com.kh.arori.entity.study.ReadmeDto;

public interface AdminReadmeDao {
	
	//리드미 관리자 리스트
	public List<ReadmeDto> adminReadmeList();
	
	// 리드미 페이지 네이션 
	public List<ReadmeDto> getP(Map<String, String> page);
	
	
	// 리드미 게시글 c_no + r_no 단일 조회
	public ReadmeDto getCR(ReadmeDto readmeDto);

	
	// 리드미  게시글 관리자 수정 
	public int editReadmeAdmin(ReadmeDto readmeDto);
	
	// 리드미  게시글 관리자 삭제 
	public int deleteAdmin(ReadmeDto readmeDto);
	
	
	

}
