package com.kh.arori.entity.study;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data @AllArgsConstructor @NoArgsConstructor @Builder
public class MultipleDto {
	private int no;
	private String multiple_one;
	private String multiple_two;
	private String multiple_three;
	private String multiple_four;
	private String multiple_answer;
}
