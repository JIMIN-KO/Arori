package com.kh.arori.entity;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class MemberDto {

	private int member_no;
	private String member_id;
	private String member_nick;
	private String member_state;
	private String member_join;
	private String member_login;
}
