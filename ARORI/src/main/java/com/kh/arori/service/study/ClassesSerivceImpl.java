package com.kh.arori.service.study;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.arori.entity.study.ClassesDto;
import com.kh.arori.entity.study.McDto;
import com.kh.arori.repository.study.ClassesDao;

@Service
public class ClassesSerivceImpl implements ClassesService {

	@Autowired
	private ClassesDao classesDao;
	
	// 클래스 생성(classDao에 클래스 번호 전달)
	@Override
	public int createClasses(ClassesDto classesDto) {
		int c_no=classesDao.getSeq();
		classesDto.setC_no(c_no);
		classesDao.createClasses(classesDto);
		return c_no;
	}

	@Override
	public List<McDto> searchList(String searchOption, String keyword) {
		return classesDao.searchList(searchOption, keyword);
	}
	
}