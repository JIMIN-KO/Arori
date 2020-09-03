package com.kh.arori.repository.study;

import com.kh.arori.entity.study.ReadmeDto;

public interface ReadmeDao {

	// Readme 고유 번호 발급 
	public int getSeq();
	
	// Readme 생성 
	public void create(ReadmeDto readmeDto);
	
	// Readme 단일 조회 (r_no)
	public ReadmeDto get(int r_no);
	
	// Readme 단일 조회 (c_no)
	public ReadmeDto getC(int c_no);
	
	// Readme 수정
	public int edit(ReadmeDto readmeDto);
}
