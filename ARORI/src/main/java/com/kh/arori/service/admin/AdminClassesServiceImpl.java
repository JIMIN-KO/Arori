package com.kh.arori.service.admin;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.arori.entity.study.QnaDto;
import com.kh.arori.repository.admin.AdminClassesDao;

@Service
public class AdminClassesServiceImpl implements AdminClassesService{
	
	@Autowired
	AdminClassesDao adminClassesDao;
	
	@Override
	public List<QnaDto> qnaList() {
		return adminClassesDao.qnaList();
	}
	
	// QNA 게시글 페이지 네이션 기능
	@Override
	public List<QnaDto> getP(int pageNo) {

		int pageSize = 20; // 한 페이지 넘버 당 게시글 개수 -> 10개
		int finish = pageNo * pageSize; // 해당 페이지 번호의 마지막 번호
		int start = finish - (pageSize - 1);

		Map<String, String> pagination = new HashMap<String, String>();
		pagination.put("start", String.valueOf(start));
		pagination.put("finish", String.valueOf(finish));

		List<QnaDto> list = adminClassesDao.getP(pagination);

		return list;
	}

}
