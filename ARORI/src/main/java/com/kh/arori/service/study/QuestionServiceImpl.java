package com.kh.arori.service.study;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.arori.entity.study.AllQuestionDto;
import com.kh.arori.repository.study.QuestionDao;

@Service
public class QuestionServiceImpl implements QuestionService{
	
	@Autowired
	private QuestionDao questionDao;
	
	@Override
	public int createQuestion(AllQuestionDto allQuestionDto) {
		int question_no = questionDao.getSeq();
		allQuestionDto.setQuestion_no(question_no);
		questionDao.createQuestion(allQuestionDto);
		return question_no;
	}

}
