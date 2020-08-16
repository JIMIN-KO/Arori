package com.kh.arori.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.method.HandlerMethod;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.kh.arori.entity.MemberDto;

public class AuthInterceptor extends HandlerInterceptorAdapter {

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {

		// 1. Handler 종류 확인
		// > Controller 에 있는 메소드 확인을 위해 HandlerMethod 타입인지 체크
		// > return true 일 경우 > Controller에 있는 메소드가 아니므로, 그대로 컨트롤러 실행
		if (handler instanceof HandlerMethod == false) return true;

		// 2. 형 변환
		HandlerMethod handlerMethod = (HandlerMethod) handler;

		// 3. @Auth 받아오기
		Auth auth = handlerMethod.getMethodAnnotation(Auth.class);

		// 4. 메소드에 @Auth 가 없는 경우 > 권한 인증이 필요없는 요청
		if (auth == null) return true;

		// 5. @Auth 가 있는 경우이므로 세션이 있는지 체크 
		HttpSession session = request.getSession();
		if(session == null) {
			// 세션이 없을 경우 > Login 화면으로 이동 
			response.sendRedirect(request.getContextPath() + "/member/login");
			return false;
		}
		
		// 6. 세션이 존재하다면 유효한 유저인지 확인
		MemberDto member = (MemberDto) session.getAttribute("userinfo");
		if(member == null) {
			response.sendRedirect(request.getContextPath() + "/member/login");
			return false;
		}
		
		// 7. admin 계정인지 확인 
		String role = auth.role().toString();
		if("ADMIN".equals(role)) {
			if(!"admin".equals(member.getMember_id())) {
				response.sendRedirect(request.getContextPath());
				return false;
			}
		}
		return true;
	}
}
