package com.kh.arori;

import org.junit.Test;

import com.kh.arori.constant.NameConst;

import lombok.extern.slf4j.Slf4j;

@Slf4j
public class test {

	@Test
	public void test() {
		String[][] list = { { NameConst.MEMBER, "member_join" }, { NameConst.CLASSES, "c_when" },
				{ NameConst.QUIZ, "q_when" }, { NameConst.QNA, "qna_when" }, { NameConst.REPORT, "report_when" } };
		
		int[] count = new int[list.length];
		
		for (int i = 0; i < list.length; i++) {
			System.out.println("list[" + i + "][k]");
			System.out.println();
			
			for(int k = 0; k < list[i].length; k++) {
				
				System.out.println("list[" + i + "][" + k + "]");
				System.out.println(list[i][k]);
			}
			
			System.out.println();
		}
	}

}
