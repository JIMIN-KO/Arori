package com.kh.arori.entity.study;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data @AllArgsConstructor @NoArgsConstructor @Builder
public class QuizDto {
	private int q_no;
	private int c_no;
	private String q_title;
	private int q_score;
	private String q_open;
	private String q_close;
	private int q_runtime;
	private int q_scoring;
	private String q_score_open;
	private String q_when;
}
