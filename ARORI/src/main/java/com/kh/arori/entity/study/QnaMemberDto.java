package com.kh.arori.entity.study;

import lombok.AllArgsConstructor;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
public class QnaMemberDto extends QnaDto {
	private String member_nick;

	public String getMember_nick() {
		return member_nick;
	}

	public void setMember_nick(String member_nick) {
		this.member_nick = member_nick;
	}
	
}
