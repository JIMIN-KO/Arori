<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <jsp:include page="/WEB-INF/views/template/member/main_member_nav_header.jsp"></jsp:include>
<h2>퀴즈디테일 페이지</h2>
<h2> 클래스 번호 : ${c_no}</h2> 
<h2>지금 만들어진 퀴즈 번호 : ${q_no}</h2>

<form action="create" method="post">
<input type="submit" value="퀘스천 등록">
</form> 

<jsp:include page="/WEB-INF/views/template/member/main_member_nav_footer.jsp"></jsp:include>