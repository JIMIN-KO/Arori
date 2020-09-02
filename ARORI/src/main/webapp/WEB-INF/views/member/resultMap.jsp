<jsp:include
	page="/WEB-INF/views/template/member/main_member_nav_header.jsp"></jsp:include>
<%@page contentType="text/html; charset=UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<h1>회원 목록(관리자 페이지)</h1>

<hr>
<c:forEach var="memberDto" items="${result}" varStatus="status">

	<td>${memberDto.member_no} </td>
	<td>${memberDto.member_id}</td>
	<td>${result2[status.index].member_email}</td>
	<td>${memberDto.member_nick}</td>
	<td>${result2[status.index].member_phone}</td>
	<td>${memberDto.member_state}</td>
	<td>${memberDto.member_join}</td>
	<td>${memberDto.member_login}</td>
	<td>${memberDto.report_state}</td>
	<td>${memberDto.suspension}</td><br>

<td>${aroriMemberDto.member_email}
</c:forEach>

<a href="">수정하기</a>
<a href="">삭제하기</a>



<!-- 전체 리스트 불러오기 아직 구현중 -->

<jsp:include
	page="/WEB-INF/views/template/member/main_member_nav_footer.jsp"></jsp:include>