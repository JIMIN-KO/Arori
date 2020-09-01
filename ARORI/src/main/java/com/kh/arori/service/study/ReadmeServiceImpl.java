package com.kh.arori.service.study;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.arori.entity.study.ReadmeDto;
import com.kh.arori.repository.study.ReadmeDao;

@Service
public class ReadmeServiceImpl implements ReadmeService {

	@Autowired
	private ReadmeDao readmeDao;

	//  Readme 생성 
	@Override
	public void create(List<String> r_content, String c_no) {
		// StringBuffer 준비 > 문자열 합치기 위해
		StringBuffer bf = new StringBuffer();
		
		// 파라미터로 받아온 List 만큼 문자열 합치기
		for(String list : r_content) {
			bf.append("'");
			bf.append(list);
			bf.append("',");
		}
		
		// 반복문 완료 후, 마지막 쉼표 제거 
		String content = bf.toString().substring(0, bf.length()-1);
		
		// 파라미터 값 readmeDto 에 합치기 
		ReadmeDto readmeDto = ReadmeDto.builder().r_content(content).c_no(Integer.parseInt(c_no)).build();
		
		// Readme 고유 번호 발급 후 dto 에 합치기 
		readmeDto.setR_no(readmeDao.getSeq());
		
		// 생성 
		readmeDao.create(readmeDto);
	}

}
