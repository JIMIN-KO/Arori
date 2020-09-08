package com.kh.arori.vo;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class MultipleVo {

	private int q_no;
	private int question_no;
	private String multiple_one;
	private String multiple_two;
	private String multiple_three;
	private String multiple_four;
	private String multiple_answer;
	
}
