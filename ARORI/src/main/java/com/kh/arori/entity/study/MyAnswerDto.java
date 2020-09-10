package com.kh.arori.entity.study;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class MyAnswerDto {

	private int no;
	private int member_no;
	private int q_no;
	private int question_no;
	private int my_answer;
	private String question_answer;
	private int result;
	
}
