package com.kh.arori.service.study;

import java.util.List;

public interface ReadmeService {

	// Readme 생성
	public boolean create(List<String> r_content, String c_no);
	
	//  Readme 수정
	public String edit(List<String> r_content, String c_no);

}
