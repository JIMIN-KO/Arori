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

	private int qna_no;
	private int c_no;
	private int member_no;
	private String qna_title;
	private String qna_content;
	private String qna_when;
	private int super_no;
	private int group_no;
	private int depth;
}
