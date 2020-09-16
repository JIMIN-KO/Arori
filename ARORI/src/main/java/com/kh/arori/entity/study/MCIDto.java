package com.kh.arori.entity.study;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class MCIDto {
	// CLASSES
	private int c_no;
	private int member_no;
	private String c_title;
	private String c_info;
	private String c_when;
	private int c_subscribe;
	private int c_public;
	
	// MEMBER
	private String member_nick;
	
	// CLASSES_IMG
	private int ai_no;
}
