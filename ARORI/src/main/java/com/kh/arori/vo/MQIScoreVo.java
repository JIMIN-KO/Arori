package com.kh.arori.vo;

import com.kh.arori.entity.study.MqInfoDto;

public class MQIScoreVo extends MqInfoDto {

	private int myScore;
	private int correct;
	private int incorrect;
	private int myPer;
	private int totalPer;

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

	public int getTotalPer() {
		return totalPer;
	}

	public void setTotalPer(int totalPer) {
		this.totalPer = totalPer;
	}

	public MQIScoreVo() {
		super();
	}

}
