<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <jsp:include page="/WEB-INF/views/template/member/main_member_nav_header.jsp"></jsp:include>
<h1>퀴즈 메인</h1>
<hr>
<a href="${pageContext.request.contextPath}/classes/${c_no}/quiz/create"><button>퀴즈 만들기</button></a>
<hr>
<h2>퀴즈 목록</h2>
<jsp:include page="/WEB-INF/views/template/member/main_member_nav_footer.jsp"></jsp:include>