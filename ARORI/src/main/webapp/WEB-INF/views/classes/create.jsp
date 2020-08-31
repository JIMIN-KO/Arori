<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <jsp:include page="/WEB-INF/views/template/member/main_member_nav_header.jsp"></jsp:include>
<h2>클래스 생성</h2>
<form action="create" method="post">
	제목 : <input type="text" name="c_title">
	<br>
	공개 여부 : <input type="text" name="c_public">
	<br>
	클래스 정보 : <textarea name="c_info"></textarea>
	<br>
	<button type="submit">생성</button>
</form> 

<jsp:include page="/WEB-INF/views/template/member/main_member_nav_footer.jsp"></jsp:include>