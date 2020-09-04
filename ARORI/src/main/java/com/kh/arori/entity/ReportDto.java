package com.kh.arori.entity;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class ReportDto {
	private int report_no;
	private int report_member;
	private String report_type;
	private String report_content;
	private int report_crimi;
}
