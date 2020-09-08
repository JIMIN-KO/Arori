package com.kh.arori;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;

import com.kh.arori.entity.member.PasswordQDto;

import lombok.extern.slf4j.Slf4j;

@RunWith(SpringJUnit4ClassRunner.class) // Spring + Junit4 연동
@ContextConfiguration(locations = { "file:src/main/webapp/WEB-INF/spring/root-context.xml",
		"file:src/main/webapp/WEB-INF/spring/appServlet/servlet-context.xml" }) // 설정파일 위치 정보
@WebAppConfiguration // 웹과 관련된 설정 무시
@Slf4j
public class GetPasswordQ {

	@Autowired
	private SqlSession sqlSession;
	
	@Test
	public void test() {
		
		List<PasswordQDto> list = sqlSession.selectList("member.getPasswordQ");
		
		for(PasswordQDto q : list) {
			log.info("PasswordDto.getPq_content = {}", q.getPq_content());
		}
		
	}
	
}
