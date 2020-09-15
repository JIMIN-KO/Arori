package com.kh.arori.rest.answer;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.kh.arori.entity.study.MyAnswerDto;
import com.kh.arori.repository.study.MyAnswerDao;
import com.kh.arori.service.study.MyAnswerService;

@RestController
@RequestMapping("/answerAjax")
public class MyAnswerAjaxController {

	@Autowired
	private MyAnswerService myAnswerService;
	
	@Autowired
	private MyAnswerDao myAnswerDao;

	@PostMapping("/update")
	@Transactional
	public void updateAnswer(@RequestBody MyAnswerDto myAnswerDto) {
		// 받아온 데이터 갱신하기
		// 회원의 입력값이 정답인지 아닌지 비교
		MyAnswerDto check = myAnswerDao.check(myAnswerDto);

		// 나의 정답 테이블에 새로 추가된 퀘스쳔 정보가 없으면 새로운 더미 데이터 추가
		if (check == null) {
			myAnswerService.newAnswer(myAnswerDto);
		}
		
		// 추가된 더미 데이터 재조회
		check = myAnswerDao.check(myAnswerDto);

		// (한번이라도 풀었던 경력이 있다면)
		// 입력한 정답과 기존의 더미 데이터 정답과 비교
		if (check.getQuestion_answer().equals(myAnswerDto.getMy_answer())) {
			myAnswerDto.setResult(1);
		}

		// 정답 확인 후 나의 정답 테이블의 해당 퀘스쳔 정보 수정
		myAnswerDao.update(myAnswerDto);
		
		// 현재 맞춘 개수만큼 점수 책정 후 My_Quiz 점수 갱신
		myAnswerService.updateMyQuiz(myAnswerDto);

	}

}
