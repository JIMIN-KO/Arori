package com.kh.arori.service.toast;

import java.util.List;

import org.springframework.stereotype.Service;

@Service
public class ToastServiceImpl implements ToastService {

	// 토스트 에디터 내용 String 으로 합치기 
	@Override
	public String content(List<String> content) {
		// StringBuffer 준비 > 문자열 합치기 위해
		StringBuffer bf = new StringBuffer();

		// 파라미터로 받아온 List 만큼 문자열 합치기
		for (String list : content) {
			bf.append("'");
			bf.append(list);
			bf.append("',");
		}

		// 반복문 완료 후, 마지막 쉼표 제거
		return bf.toString().substring(0, bf.length() - 1);
	}

}
