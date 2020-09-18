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
	public int no;
	public int member_no;
	public int q_no;
	public String when;
	public int score;

	public int c_no;
	public String q_title;
	public String q_open;
	public String q_close;
	public int q_runtime;
	public String q_when;
	public String q_content;
	public int q_state;

}
