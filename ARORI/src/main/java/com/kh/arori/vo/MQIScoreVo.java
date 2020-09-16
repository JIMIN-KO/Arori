package com.kh.arori.vo;

import com.kh.arori.entity.study.MqInfoDto;

import lombok.AllArgsConstructor;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
public class MQIScoreVo extends MqInfoDto {

	public MQIScoreVo(MqInfoDto info) {
		this.setNo(info.getC_no());
		this.setMember_no(info.getMember_no());
		this.setQ_no(info.getQ_no());
		this.setWhen(info.getWhen());
		this.setScore(info.getScore());

		this.setC_no(info.getC_no());
		this.setQ_title(info.getQ_title());
		this.setQ_open(info.getQ_open());
		this.setQ_close(info.getQ_close());
		this.setQ_runtime(info.getQ_runtime());
		this.setQ_score_open(info.getQ_score_open());
		this.setQ_when(info.getQ_when());
		this.setQ_content(info.getQ_content());
		this.setQ_state(info.getQ_state());
	}

	private int myScore;
	private int correct;
	private int incorrect;
	private int myPer;
	private int totalScore;
	private int totalQuestion;

	public int getMyScore() {
		return myScore;
	}

	public void setMyScore(int myScore) {
		this.myScore = myScore;
	}

	public int getCorrect() {
		return correct;
	}

	public void setCorrect(int correct) {
		this.correct = correct;
	}

	public int getIncorrect() {
		return incorrect;
	}

	public void setIncorrect(int incorrect) {
		this.incorrect = incorrect;
	}

	public int getMyPer() {
		return myPer;
	}

	public void setMyPer(int myPer) {
		this.myPer = myPer;
	}

	public int getTotalScore() {
		return totalScore;
	}

	public void setTotalScore(int totalScore) {
		this.totalScore = totalScore;
	}

	public int getTotalQuestion() {
		return totalQuestion;
	}

	public void setTotalQuestion(int totalQuestion) {
		this.totalQuestion = totalQuestion;
	}
}
