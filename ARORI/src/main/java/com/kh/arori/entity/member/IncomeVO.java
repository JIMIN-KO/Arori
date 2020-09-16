package com.kh.arori.entity.member;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data @AllArgsConstructor @NoArgsConstructor @Builder
public class IncomeVO {
	
	private int c_no;
	private int member_no;
	private String c_title;
	private int c_public;
	private int c_subscribe;
	private String c_when;
	private String c_info;
}
