<%@page import="com.kh.arori.entity.MemberDto"%>
<jsp:include
	page="/WEB-INF/views/template/member/main_member_nav_header.jsp"></jsp:include>
<%@page contentType="text/html; charset=UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<form action="delete" method="get">
	탈퇴시킬 회원의 아이디: <input type="text" name="member_id"
		placeholder="삭제할 회원의 ID를 입력해주세요.">
		
		 <br>
		 <input type="submit" value="회원탈퇴">

</form>