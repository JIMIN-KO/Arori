package com.kh.arori.vo;

import java.util.List;

import com.kh.arori.entity.study.ThisQuizDto;

import lombok.AllArgsConstructor;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
public class ThisQuizVo extends ThisQuizDto {
	
	public List<String> getContent() {
		return content;
	}

	public void setContent(List<String> content) {
		this.content = content;
	}

	private List<String> content;
}
