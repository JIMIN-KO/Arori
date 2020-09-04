<jsp:include page="/WEB-INF/views/template/member/main_member_nav_header.jsp"></jsp:include>
<%@page contentType="text/html; charset=UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<h1>회원 목록(관리자 페이지) - 수정하려면 회원아이디를 클릭</h1>


<c:forEach var="memberDto" items="${result}" varStatus="status">
<br>
	<tr>
	<td>${memberDto.member_no}</td>
<a href="${pageContext.request.contextPath}/admin/adminUpdate/${memberDto.member_id}"><td>${memberDto.member_id} </td></a>
	<td>${memberDto.member_nick}</td>
	<td>${result2[status.index].member_email}</td>
	<td>${result2[status.index].member_phone}</td>
	<td>${memberDto.member_state}</td>
	<td>${memberDto.member_login}</td>
	<td>${memberDto.report_state}</td>
	</tr>
	<br>
	
	
</c:forEach>



<a href="${pageContext.request.contextPath}">메인페이지로 이동</a>
<%-- <!-- 검색 조회 -->
<form action="memberList" method="post">

<select name="kinds">

<option value="member_id" ${param.type=='member_id'?'selected':'' }>ID</option>
<option value="member_nick" ${param.type=='member_nick'?'selected':'' }>닉네임</option>
<option value="member_state" ${param.type=='member_state'?'selected':'' }>회원구분</option>
<option value="report_state" ${param.type=='report_state'?'selected':'' }>회원상태</option>

</select>

<input type="text" name="keyword" placeholder="검색어" value="${param.keyword }">
<input type="submit" value="찾기">

</form>
 --%>
<jsp:include
	page="/WEB-INF/views/template/member/main_member_nav_footer.jsp"></jsp:include>