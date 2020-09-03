package com.kh.arori.service.study;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kh.arori.entity.study.ReadmeDto;
import com.kh.arori.repository.study.ReadmeDao;
import com.kh.arori.service.toast.ToastService;

@Service
public class ReadmeServiceImpl implements ReadmeService {

	@Autowired
	private ReadmeDao readmeDao;
	
	@Autowired
	private ToastService toastService;

	//  Readme 생성 
	@Override
	@Transactional
	public boolean create(List<String> r_content, String c_no) {
		ReadmeDto readme = readmeDao.getC(Integer.parseInt(c_no));
		
		if(readme != null) {
			return false;
		} else {
			// 파라미터로 받아온 List 만큼 문자열 합치기
			// 반복문 완료 후, 마지막 쉼표 제거 
			String content = toastService.content(r_content);
			
			// 파라미터 값 readmeDto 에 합치기 
			ReadmeDto readmeDto = ReadmeDto.builder().r_content(content).c_no(Integer.parseInt(c_no)).build();
			
			// Readme 고유 번호 발급 후 dto 에 합치기 
			readmeDto.setR_no(readmeDao.getSeq());
			
			// 생성 
			readmeDao.create(readmeDto);
			
			return true;
		}
		
	}

	// Readme 수
	@Override
	public String edit(List<String> r_content, String c_no) {
		String content = toastService.content(r_content);
		
		ReadmeDto readmeDto = ReadmeDto.builder().c_no(Integer.parseInt(c_no)).r_content(content).build();
		int result = readmeDao.edit(readmeDto);
		
		System.out.println("성공결과 : " + result);
		return null;
	}

}
