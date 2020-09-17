package com.kh.arori;

import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.post;
import static org.springframework.test.web.servlet.result.MockMvcResultHandlers.print;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.status;

import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;
import org.springframework.web.context.WebApplicationContext;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "file:src/main/webapp/WEB-INF/spring/root-context.xml",
		"file:src/main/webapp/WEB-INF/spring/appServlet/servlet-context.xml" })
@WebAppConfiguration
public class junitTest {

	@Autowired
	private WebApplicationContext ctx;

	MockMvc mock;

	@Before
	public void prepare() {
		mock = MockMvcBuilders.webAppContextSetup(ctx).build();
	}

	@Test
	public void test() throws Exception {

		mock.perform(post("/nonMemberAjax/checkEmail").param("member_id", "dip0cean@skuniv.ac.kr")).andDo(print()).andExpect(status().is(200)).andReturn();
	}
}
