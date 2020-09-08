package com.kh.arori.entity.study;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class ThisQuizDto {

// ALL_QUESTION 영역 
	private int question_no;
	private int q_no;
	private String aq_content;
	private int qt_no;
	
//	OX 영역 
	private String o_content;
	private String x_content;
	private String ox_answer;

//	선다형 영역
	private String multiple_one;
	private String multiple_two;
	private String multiple_three;
	private String multiple_four;
	private String multiple_answer;
	
//	단답형 영역 
	private String explain_answer;
}
