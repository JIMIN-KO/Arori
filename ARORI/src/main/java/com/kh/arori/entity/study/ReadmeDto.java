package com.kh.arori.entity.study;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class ReadmeDto {

	private int r_no;
	private int c_no;
	private String r_content;
	private String r_when;
}
