package com.kh.arori.entity;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class AroriMemberDto {

	private int member_no;
	private String member_pw;
	private String member_email;
	private String member_phone;
	private int member_q;
	private String member_a;
	
	private PasswordQDto passwordQDto;
	
	
	
	
}
