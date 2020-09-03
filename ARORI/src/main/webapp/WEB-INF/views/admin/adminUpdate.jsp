<%@page import="com.kh.arori.entity.MemberDto"%>
<jsp:include page="/WEB-INF/views/template/member/main_member_nav_header.jsp"></jsp:include>
<%@page contentType="text/html; charset=UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<form action="adminUpdate" method="post">
닉네임
<input type="text" name="member_nick" value="${memberDto.member_nick}">
<br>
소셜/아로리 구분
<input type ="text" name="member_state" value="${memberDto.member_state}">
<br>
가입일시
${memberDto.member_join}
<br>
최근 로그인
${memberDto.member_login}
<br>
회원상태
<input type ="text" name="report_state" value="${memberDto.report_state}">
<br>
정지일
<input type ="text" name="suspension" value="${memberDto.suspension}">
<br>
<input type ="hidden" name="member_id" value="${memberDto.member_id}">

<input type="submit" value="수정완료">

</form>