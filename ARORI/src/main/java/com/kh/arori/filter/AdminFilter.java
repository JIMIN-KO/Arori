package com.kh.arori.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.arori.entity.member.MemberDto;

import lombok.extern.slf4j.Slf4j;

@Slf4j
public class AdminFilter implements Filter {

	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {

		HttpServletRequest req = (HttpServletRequest) request;
		HttpServletResponse resp = (HttpServletResponse) response;

		MemberDto userinfo = (MemberDto) req.getSession().getAttribute("userinfo");
		int member_auth = userinfo.getMember_auth();

		if (member_auth == 1) {
			chain.doFilter(request, response);

		} else {
			resp.sendRedirect(req.getContextPath());

		}

	}

}
