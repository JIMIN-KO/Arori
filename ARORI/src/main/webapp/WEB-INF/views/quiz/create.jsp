<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <jsp:include page="/WEB-INF/views/template/member/main_member_nav_header.jsp"></jsp:include>
 <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
    <br><br><br>
<h2>퀴즈 생성</h2>

<form action="create" method="post">
	<input type="hidden" name="c_no" value="${c_no}">
	
	퀴즈제목 : <input type="text" name="q_title"> <br><br>
	퀴즈 총 배점 : <input type="text" name="q_score">점<br><br>
	퀴즈 제한 시간 : <input type="text" name="q_runtime">분<br><br>
	
	<hr>
	
	퀴즈 오픈 시간 :<input type="datetime-local" name="q_open"> 
	퀴즈 클로즈 시간 : <input type="datetime-local" name="q_close"> <br><br>
	답안 오픈시간 : <input type="datetime-local" name="q_score_open"> <br><br>

	<hr>
	
	자동채점 0/수동채점1 : <input type="text" name="q_scoring" >
	
	<hr>
	
	<button type="submit">퀴즈생성</button>
</form> 

<jsp:include page="/WEB-INF/views/template/member/main_member_nav_footer.jsp"></jsp:include>