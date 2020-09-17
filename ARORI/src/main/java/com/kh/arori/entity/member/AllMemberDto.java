package com.kh.arori.entity.member;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data @AllArgsConstructor @NoArgsConstructor @Builder
public class AllMemberDto {
	
	private int member_no; //번호
	private String member_pw; //패스워드
	private String member_email; //email
	private String member_phone; //핸드폰
	private int member_q; //질문
	private String member_a; //답변
	private String member_id; //아이디
	private String member_nick; //닉네임
	private String member_state; //회원구분
	private String member_join; //가입일시
	private String member_login; //로그인
	private String report_state; // 정상 / 일시 정지 / 영구 정지 
	private String suspension; //상태
	private String member_auth; //회원 권한

}
