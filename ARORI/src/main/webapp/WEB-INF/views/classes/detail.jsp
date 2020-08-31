<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <jsp:include page="/WEB-INF/views/template/member/main_member_nav_header.jsp"></jsp:include>
<h2>클래스 디테일 페이지</h2>
<h3>지금 만들어진 클래스 번호 : ${classesDto.c_no }</h3> 
<h3>등록 시간 : ${classesDto.c_when }</h3>
<h3>회원 닉네임 : ${userinfo.member_nick }</h3>
<h3>클래스 정보 : ${classesDto.c_info }</h3>
<h3>공개여부 : ${classesDto.c_public }</h3>
<jsp:include page="/WEB-INF/views/template/member/main_member_nav_footer.jsp"></jsp:include>