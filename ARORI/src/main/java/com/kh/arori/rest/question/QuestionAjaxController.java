package com.kh.arori.rest.question;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.kh.arori.entity.study.AllQuestionDto;
import com.kh.arori.entity.study.OxDto;
import com.kh.arori.entity.study.This_qDto;
import com.kh.arori.repository.study.QuestionDao;
import com.kh.arori.service.study.QuestionService;
import com.kh.arori.service.toast.ToastService;

@RestController
@RequestMapping("/questionAjax")
public class QuestionAjaxController {
	@Autowired
	private QuestionService questionService;

	@Autowired
	private ToastService toastService;

	@Autowired
	private QuestionDao questionDao;

	// OX 문제 생성
	@PostMapping("/createOXQ")
	@Transactional
	public int createAllQ(@ModelAttribute AllQuestionDto allQuestionDto, @ModelAttribute OxDto oxDto,
			@RequestParam List<String> content) {

		// 1. All_Question 테이블 데이터 업데이트(수정 / 갱신)
		// 1-1. List 타입 content String 병합
		String aq_content = toastService.content(content);
		allQuestionDto.setAq_content(aq_content);
		allQuestionDto.setQt_no(1);

		// 1-2. 수정된 디티오 업데이트(수정 / 갱신)
		AllQuestionDto check = questionDao.get(allQuestionDto);

		if(check != null) {			
			questionDao.updateAQuestion(allQuestionDto);
		} else {			
			questionDao.createQuestion(allQuestionDto);
		}
		
		// 2. OX 정답 테이블 데이터 삽입
		// 2-1. 정답 테이블 시퀀스 번호 발급
		int ox_no = questionDao.getSeqOx();
		oxDto.setNo(ox_no);
		
		// 2-2. OX 정답 Dto 데이터 베이스에 삽입
		questionDao.createOx(oxDto);

		// 3. This_Q 테이블 오작교 연결
		// 3-1. This_Q 의 고유번호 발급
		int this_q_no = questionDao.getSeq2("OX");
		// 3-2. This_Q dto > 위의 데이터를 객체화해서 만든다.
		This_qDto this_qDto = This_qDto.builder().no(this_q_no).question_no(allQuestionDto.getQuestion_no())
				.this_no(ox_no).table_name("OX").build();

		// 3-3. This_Q 데이터 삽입
		questionDao.insertThis(this_qDto);

		// 4. 다음 퀘스쳔을 위한 데이터 생성
		// 4-1. 다음 퀘수쳔 고유 번호 발급
		int next_aqdto_no = questionDao.getSeq();
		
		// 다음 문제 번호 리턴
		return next_aqdto_no;
	}

}
