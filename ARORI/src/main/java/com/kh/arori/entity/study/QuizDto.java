package com.kh.arori.entity.study;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class QuizDto {
	private int q_no;
	private int c_no;
	private String q_title;
	private String q_open;
	private String q_close;
	private int q_runtime;
	private String q_when;
	private String q_content;
	private int q_state;
}
