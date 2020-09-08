package com.kh.arori.entity.study;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class NoticeDto {

	private int n_no;
	private int c_no;
	private String n_title;
	private String n_content;
	private String n_when;
	private int n_state;
}
