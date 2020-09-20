package com.kh.arori.service.study;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.arori.entity.study.ClassesDto;
import com.kh.arori.entity.study.MCIDto;
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

	// 클래스 검색 정렬 조회
	@Override
	public List<MCIDto> searchList(String keyword, String searchOption, String col, String order) {
		
		Map<String, String> map = new HashMap<String, String>();
		map.put("searchOption", searchOption);
		map.put("keyword", keyword);
		map.put("col", col);
		map.put("order", order);
		
		return classesDao.searchList(map);
	}
	
	// 구독 
	public void already(SubscribeDto subDto) {
		// 클래스 넘버를 이용한 단일조회
		ClassesDto classesDto = classesDao.get(subDto.getC_no());
		
		// 해당 member_no와 c_no로 데이터 조회 
		SubscribeDto already = classesDao.checkSub(subDto);

		if (already != null) { // subDto에 데이터가 있으면(이미 구독 돼 있다면)

			// 삭제(구독자수 -1)
			classesDao.delSub(subDto);

		} else { // subDto에 데이터가 없으면(구독이 안 되어 있다면)
			// 시퀀스 발급
			int sub_no = classesDao.getsubSeq();
			subDto.setSub_no(sub_no);

			// 구독 (구독자수+1)
			classesDao.sub(subDto);

		}
		// c_subscribe(구독자수) 새로 갱신
		classesDao.subUpdate(classesDto);
		// 갱신된 classesDto 단일조회해서 classesDto 넘기기
		classesDto = classesDao.get(subDto.getC_no());
	}

	
}
