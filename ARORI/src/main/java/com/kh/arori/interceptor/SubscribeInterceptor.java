package com.kh.arori.interceptor;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.servlet.HandlerMapping;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.kh.arori.entity.member.MemberDto;
import com.kh.arori.entity.study.ClassesDto;
import com.kh.arori.entity.study.SubscribeDto;
import com.kh.arori.repository.study.ClassesDao;

import lombok.extern.slf4j.Slf4j;

@Slf4j
public class SubscribeInterceptor extends HandlerInterceptorAdapter {

	@Autowired
	private ClassesDao classesDao;

	@SuppressWarnings("unchecked")
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {

		log.info("구독 인터셉터 접속!");
		HttpServletRequest req = (HttpServletRequest) request;

		// 클래스 페이지 진입 시, 받게되는 PathVariables 값 Map 으로 받기
		Map<String, String> pathVariables = (Map<String, String>) request
				.getAttribute(HandlerMapping.URI_TEMPLATE_VARIABLES_ATTRIBUTE);

		// 로그인한 회원 정보 받아오기
		MemberDto userinfo = (MemberDto) req.getSession().getAttribute("userinfo");
		
		// 만약 관리자라면 통과
		if(userinfo.getMember_auth() == 1) {
			return true;
		}

		// 해당 클래스 번호
		int c_no = Integer.parseInt(pathVariables.get("c_no"));

		if (!pathVariables.isEmpty()) {

			ClassesDto classesDto = classesDao.get(c_no);

			// 만약 내가 만든 클래스인지 아닌지 조건문
			if (classesDto.getMember_no() == userinfo.getMember_no()) {
				// 해당 클래스와 로그인한 회원의 번호가 같으면
				return true;
			} else {
				// 1. 해당 회원이 현재의 클래스를 구독하지 않았다면 readme 만 볼 수 있다.

				// 위의 정보 객체화 (회원 정보 + 해당 클래스 번호)
				SubscribeDto subscribeDto = SubscribeDto.builder().member_no(userinfo.getMember_no()).c_no(c_no)
						.build();
				subscribeDto = classesDao.checkSub(subscribeDto); // 구독 조회

				// 구독 조회를 이용한 조건문
				if (subscribeDto != null) {
					// 해당 클래스가 구독되었을 경우
					return true;

				}
			}
		}
		response.sendRedirect(request.getContextPath() + "/classes/readme/" + c_no + "?plz");
		return false;
	}
}
