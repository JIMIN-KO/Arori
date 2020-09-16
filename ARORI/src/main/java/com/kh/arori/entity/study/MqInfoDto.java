package com.kh.arori.entity.study;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class MqInfoDto {
	private int no;
	private int member_no;
	private int q_no;
	private String when;
	private int score;

	private int c_no;
	private String q_title;
	private String q_open;
	private String q_close;
	private int q_runtime;
	private String q_score_open;
	private String q_when;
	private String q_content;
	private int q_state;

}
