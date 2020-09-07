package com.kh.arori.rest.question;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.kh.arori.entity.study.AllQuestionDto;
import com.kh.arori.entity.study.ExplainDto;
import com.kh.arori.entity.study.MultipleDto;
import com.kh.arori.entity.study.OxDto;
import com.kh.arori.service.study.QuestionService;
import com.kh.arori.vo.OxVo;

@RestController
@RequestMapping("/questionAjax")
public class QuestionAjaxController {
	@Autowired
	private QuestionService questionService;

	// OX 퀘스쳔 생성
	@PostMapping("/create/ox")
	@Transactional
	public int createOX(@ModelAttribute AllQuestionDto allQuestionDto, @ModelAttribute OxDto oxDto,
			@RequestParam List<String> content) {

		int next_aqdto_no = questionService.createQuestion(content, allQuestionDto, oxDto);

		// 다음 문제 번호 리턴
		return next_aqdto_no;
	}

	// 선다형 퀘스쳔 생성
	@PostMapping("/create/multiple")
	@Transactional
	public int createMultiple(@ModelAttribute AllQuestionDto allQuestionDto, @ModelAttribute MultipleDto multipleDto,
			@RequestParam List<String> content) {

		int next_aqdto_no = questionService.createQuestion(content, allQuestionDto, multipleDto);

		return next_aqdto_no;
	}

	// 단답형 퀘스쳔 생성
	@PostMapping("/create/explain")
	@Transactional
	public int createExplain(@ModelAttribute AllQuestionDto allQuestionDto, @ModelAttribute ExplainDto explainDto,
			@RequestParam List<String> content) {
		int next_aqdto_no = questionService.createQuestion(content, allQuestionDto, explainDto);
		return next_aqdto_no;
	}
	
	// OX 퀘스쳔 조회
	@PostMapping("/get/ox")
	public OxVo getOX(@RequestParam int question_no, @RequestParam int q_no){
		
		return null;
	}

}
