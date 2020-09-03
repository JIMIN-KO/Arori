<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <jsp:include page="/WEB-INF/views/template/member/main_member_nav_header.jsp"></jsp:include>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<h1>퀴즈 메인</h1>
<hr>
<h3>현재 퀘스천 넘버 : ${c_no} </h3>
<a href="${pageContext.request.contextPath}/classes/${c_no}/quiz/create"><button>퀴즈 만들기</button></a>
<hr>
<h2>퀴즈 목록</h2>
<div>
	<c:forEach var="quizDto" items="${list}">
	${quizDto.q_no}/ ${quizDto.q_title} / 총${quizDto.q_score}점 / 
	오픈시간 :
	<fmt:parseDate value="${quizDto.q_open}" var="time" pattern="yyyy-MM-dd HH:mm:ss"/>
	<fmt:formatDate value="${time}" pattern="yy-MM-dd HH:mm"/>부터
	<fmt:parseDate value="${quizDto.q_close}" var="time" pattern="yyyy-MM-dd HH:mm:ss"/>
	<fmt:formatDate value="${time}" pattern="yy-MM-dd HH:mm"/>까지
	 / 생성일 : 
	<fmt:parseDate value="${quizDto.q_when}" var="time" pattern="yyyy-MM-dd HH:mm:ss"/>
	<fmt:formatDate value="${time}" pattern="yy-MM-dd"/>
	<br>
	</c:forEach>
</div>
<jsp:include page="/WEB-INF/views/template/member/main_member_nav_footer.jsp"></jsp:include>