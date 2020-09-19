package com.kh.arori.entity.admin;

import lombok.AllArgsConstructor;

import lombok.NoArgsConstructor;

import lombok.Builder;

import lombok.Data;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class ChartDto {

	private String col;
	private String table_name;
	private String period;
}
