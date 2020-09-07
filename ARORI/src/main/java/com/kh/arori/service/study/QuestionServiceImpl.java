package com.kh.arori.service.study;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.arori.entity.study.AllQuestionDto;
import com.kh.arori.repository.study.QuestionDao;
import com.kh.arori.service.toast.ToastService;

@Service
public class QuestionServiceImpl implements QuestionService{
	
	@Autowired
	private ToastService toastService;
	
	@Autowired
	private QuestionDao questionDao;
	
	@Override
	public int createQuestion(List<String> content, AllQuestionDto allQuestionDto) {

		return 0;
	}

}
