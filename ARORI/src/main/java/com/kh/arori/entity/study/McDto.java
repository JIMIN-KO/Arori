package com.kh.arori.entity.study;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Builder @NoArgsConstructor @AllArgsConstructor @Data
public class McDto {
private String member_nick;
private String c_title;
private String c_when;
private String c_info;
private int c_no;
}
