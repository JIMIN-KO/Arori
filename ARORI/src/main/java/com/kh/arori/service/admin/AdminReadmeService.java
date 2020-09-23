package com.kh.arori.service.admin;

import java.util.List;
import java.util.Map;

import com.kh.arori.entity.study.ReadmeDto;

public interface AdminReadmeService {

	// 리드미 관리자 리스트
	public List<ReadmeDto> adminReadmeList();

	// 리드미 게시글 페이지 네이션 기능
	public List<ReadmeDto> getP(Map<String, String> map);

	// 리드미 게시글 페이지 네이션 블럭
	public List<Integer> block(int thisCount, int pageNo);
	
	// 리드미 게시글 수정 기능
	public String editReadmeAdmin(List<String> r_content, ReadmeDto readmeDto);

	// 리드미 게시글 삭제 기능
	public String deleteAdmin(ReadmeDto ReadmeDto, int member_auth);
	
}
