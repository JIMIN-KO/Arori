<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <jsp:include page="/WEB-INF/views/template/member/main_member_nav_header.jsp"></jsp:include>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<h2>퀴즈디테일 페이지</h2>
<h2> 클래스 번호 : ${c_no}</h2> 
<h2>지금 만들어진 퀴즈 번호 : ${q_no}</h2>
<hr>
<form action="create" method="post">
<input type="submit" value="퀘스천 등록">
</form> 
<hr>
<div>
		퀴즈번호 : ${q_no} <br>
		퀴즈 제목 : ${q_title}<br>
		퀴즈 총 배점 : ${q_score}<br>
		퀴즈 오픈시간 : ${q_open}<br>
		퀴즈 클로즈 시간 : ${q_close}<br>
		퀴즈 제한 시간 : ${q_runtime}<br>
		퀴즈 채점방법 : ${q_scoring}<br>
		퀴즈 정답 오픈 시간 : ${q_score_open}<br>
		퀴즈 생성 날짜 : ${q_when}<br>
</div>

<jsp:include page="/WEB-INF/views/template/member/main_member_nav_footer.jsp"></jsp:include>