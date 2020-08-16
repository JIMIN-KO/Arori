package com.kh.arori.interceptor;

import static java.lang.annotation.ElementType.METHOD;
import static java.lang.annotation.RetentionPolicy.RUNTIME;

import java.lang.annotation.Retention;
import java.lang.annotation.Target;

@Retention(RUNTIME)
@Target(METHOD)
public @interface Auth {

	public enum Role {ADMIN, USER}
	
	// 이와 같이 작성하면 메소드 위에 @Auth(role=Role.ADMIN)과 같이 작성 가능 
	public Role role() default Role.USER;
	
	// 해당 클래스를 이용해서 @Auth Annotation 생성
	// 해당 Annotation 을 컨트롤러 메소드 위에 명시 > 접근 권한 관리 가능 
}
