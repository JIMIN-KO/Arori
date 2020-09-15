package com.kh.arori;

import org.junit.Test;

import lombok.extern.slf4j.Slf4j;

@Slf4j
public class test {

	@Test
	public void test() {
		int quiz = 89;
		int cur = 76;
		int result = (int)(((double) cur/quiz) * 100);
		
		System.out.println(result);
	}

}
