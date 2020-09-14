package com.kh.arori.entity.study;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data @AllArgsConstructor @NoArgsConstructor @Builder
public class AllQuestionDto {
	private int question_no;
	private int q_no;
	private int qt_no;
	private String aq_content;
	private String aq_when;
	
}
