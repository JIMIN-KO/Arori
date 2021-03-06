package com.kh.arori.entity.study;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data @AllArgsConstructor @NoArgsConstructor @Builder
public class ClassesDto {
	private int c_no;
	private int member_no;
	private String c_title;

	private int c_subscribe;
	private String c_when;
	private String c_info;
	private int img_no;
}

