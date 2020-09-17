package com.kh.arori.vo;

import java.util.List;

import com.kh.arori.entity.study.ThisQuizDto;

import lombok.AllArgsConstructor;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
public class ThisQuizVo extends ThisQuizDto {

	private List<String> content;
	private String myAnswer;
	private int correct;

	public ThisQuizVo(ThisQuizDto thisQuizDto) {
		this.setQuestion_no(thisQuizDto.getQuestion_no());
		this.setQ_no(thisQuizDto.getQ_no());
		this.setAq_content(thisQuizDto.getAq_content());
		this.setQt_no(thisQuizDto.getQt_no());

		// OX 영역
		this.setO_content(thisQuizDto.getO_content());
		this.setX_content(thisQuizDto.getX_content());
		this.setOx_answer(thisQuizDto.getOx_answer());

		// 선다형 영역
		this.setMultiple_one(thisQuizDto.getMultiple_one());
		this.setMultiple_two(thisQuizDto.getMultiple_two());
		this.setMultiple_three(thisQuizDto.getMultiple_three());
		this.setMultiple_four(thisQuizDto.getMultiple_four());
		this.setMultiple_answer(thisQuizDto.getMultiple_answer());

		// 단답형 영역
		this.setExplain_answer(thisQuizDto.getExplain_answer());
	}

	public List<String> getContent() {
		return content;
	}

	public void setContent(List<String> content) {
		this.content = content;
	}

	public String getMyAnswer() {
		return myAnswer;
	}

	public void setMyAnswer(String myAnswer) {
		this.myAnswer = myAnswer;
	}

	public int getCorrect() {
		return correct;
	}

	public void setCorrect(int correct) {
		this.correct = correct;
	}

}
