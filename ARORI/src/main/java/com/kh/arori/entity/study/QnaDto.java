package com.kh.arori.entity.study;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class QnaDto {

	public int qna_no;
	public int c_no;
	public int member_no;
	public String qna_title;
	public String qna_content;
	public String qna_when;
	public int super_no;
	public int group_no;
	public int depth;
	public int qna_state;
}
