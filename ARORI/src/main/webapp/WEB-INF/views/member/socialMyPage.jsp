<%@page import="com.kh.arori.entity.MemberDto"%>
<jsp:include page="/WEB-INF/views/template/member/main_member_nav_header.jsp"></jsp:include>
<%@page contentType="text/html; charset=UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<h1>myPage</h1>
 <form action="socialMyPage" method="post">

 

<input type="hidden" value="${memberDto.member_no}">
닉네임
<input type = "text" value="${memberDto.member_nick}" readonly="readonly">
<br>
가입날짜
<input type ="text" value="${memberDto.member_join}" readonly="readonly">
<br>
<a href="">수정</a> 

</form>
<jsp:include page="/WEB-INF/views/template/member/main_member_nav_footer.jsp"></jsp:include>