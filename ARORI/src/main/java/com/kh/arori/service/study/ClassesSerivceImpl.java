package com.kh.arori.service.study;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.arori.entity.study.ClassesDto;
import com.kh.arori.entity.study.McDto;
import com.kh.arori.entity.study.SubscribeDto;
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

	// 클래스 검색 조회
	@Override
	public List<McDto> searchList(String searchOption, String keyword) {
		return classesDao.searchList(searchOption, keyword);
	}
	
	// 구독 
	@Override
	public void sub(SubscribeDto subDto) {
		classesDao.sub(subDto);
	}
	// 구독 취소
	@Override
	public void delSub(SubscribeDto subDto) {
		classesDao.delSub(subDto);
	}
	// 구독자수 카운트
	@Override
	public int countSub(SubscribeDto subDto) {
		return classesDao.countSub(subDto);
	}
	
}
