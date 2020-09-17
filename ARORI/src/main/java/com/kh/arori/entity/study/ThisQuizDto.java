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
	public int question_no;
	public int q_no;
	public String aq_content;
	public int qt_no;
	
//	OX 영역 
	public String o_content;
	public String x_content;
	public String ox_answer;

//	선다형 영역
	public String multiple_one;
	public String multiple_two;
	public String multiple_three;
	public String multiple_four;
	public String multiple_answer;
	
//	단답형 영역 
	public String explain_answer;
}
