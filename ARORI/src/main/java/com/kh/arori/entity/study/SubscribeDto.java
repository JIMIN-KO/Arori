package com.kh.arori.entity.study;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor @NoArgsConstructor @Builder @Data
public class SubscribeDto {
	private int sub_no;
	private int member_no;
	private int c_no;
	private String sub_when;	
}
