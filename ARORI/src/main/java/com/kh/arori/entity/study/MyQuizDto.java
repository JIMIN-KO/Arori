package com.kh.arori.entity.study;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class MyQuizDto {

	private int no;
	private int member_no;
	private int q_no;
	private String when;
}
