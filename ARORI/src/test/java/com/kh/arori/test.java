package com.kh.arori;

import org.junit.Test;

import lombok.extern.slf4j.Slf4j;

@Slf4j
public class test {

	@Test
	public void test() {
		int quiz = 9;
		int cur = 4;
		int result = (int) (((double) cur / quiz) * 100);
		double aa = 100 / quiz;
		System.out.println(aa);
		System.out.println(result);
	}

}
