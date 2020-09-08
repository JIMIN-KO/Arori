package com.kh.arori.vo;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class OxVo {
	
	private int q_no;
	private int question_no;
	private String o_content;
	private String x_content;
	private String ox_answer;

}
