package com.kh.arori.interceptor;

import java.text.SimpleDateFormat;
import java.util.Calendar;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.kh.arori.entity.member.MemberDto;
import com.kh.arori.entity.study.ClassesDto;
import com.kh.arori.entity.study.QuizDto;
import com.kh.arori.repository.study.ClassesDao;
import com.kh.arori.repository.study.QuizDao;

public class QuizInterceptor extends HandlerInterceptorAdapter {

	@Autowired
	private QuizDao quizDao;

	@Autowired
	private ClassesDao classesDao;

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {

		// 퀴즈 번호 받아오기
		String uri = request.getRequestURI();
		int q_no = Integer.parseInt(uri.substring(25));

		// 해당 퀴즈 정보 받아오기
		QuizDto quizDto = QuizDto.builder().q_no(q_no).build();		
		quizDto = quizDao.get(quizDto);
		
		// 퀴즈 생성자 비교 
		ClassesDto classesDto = classesDao.get(quizDto.getC_no());
		MemberDto userinfo = (MemberDto) request.getSession().getAttribute("userinfo");

		if (classesDto.getMember_no() == userinfo.getMember_no()) {
			// 현재 로그인 회원과 클래스 생성자와 같은 사람이면 테스트 중이라는 뜻
			// 통과
			return true;
		} else {

			// 현재 시간
			Calendar car = Calendar.getInstance();
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			String date = sdf.format(car.getTime());

			// 결과값
			int isOpenToday = date.compareTo(quizDto.getQ_open());
			int isCloseToday = date.compareTo(quizDto.getQ_close());

			// 오픈 날짜 < 현재 날짜 < 클로즈 날짜
			boolean isOpen = isOpenToday >= 0 && isCloseToday <= 0;

			if (isOpen) {
				return true;
			}
			
			// 오픈 기간이 아닐 경우 디테일 페이지로 강제 이동
			System.out.println("퀴즈 기간 인터셉터 통과!");
			response.sendRedirect(
					request.getContextPath() + "/classes/quiz/detail/" + quizDto.getC_no() + "/" + quizDto.getQ_no() + "?sorry");
			
			return false;
		}

	}

}
