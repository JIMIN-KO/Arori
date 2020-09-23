package com.kh.arori.entity.member;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;


@NoArgsConstructor
@AllArgsConstructor
@Builder
@Data
public class ReportDto {
	private int report_no;
	private String report_member;
	private String report_type;
	private String report_content;
	private String report_crimi;
	private String report_date;
	private int member_no;
}
