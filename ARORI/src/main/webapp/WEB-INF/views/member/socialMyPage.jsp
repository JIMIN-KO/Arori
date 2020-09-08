<jsp:include page="/WEB-INF/views/template/member/main_member_nav_header.jsp"></jsp:include>
<%@page contentType="text/html; charset=UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<h1>myPage</h1>
 <form action="socialMyPage" method="post">

<input type="hidden" value="${memberDto.getMember_no()}">
닉네임
<input type = "text" value="${ memberDto.getMember_nick}" readonly="readonly">
<br>
가입날짜
<input type ="text" value="${memberDto.member_join}" readonly="readonly">
<br>
<a href=""><input type="button"></a> 

</form>
<jsp:include page="/WEB-INF/views/template/member/main_member_nav_footer.jsp"></jsp:include>