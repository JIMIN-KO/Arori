<jsp:include
	page="/WEB-INF/views/template/admin/main_admin_nav_header.jsp"></jsp:include>
<%@page contentType="text/html; charset=UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<table class="table table-hover">
	<h1>회원 목록(관리자 페이지) - 회원 아이디를 클릭하면 상세페이지로 이동</h1>
	<thead>
		<tr>
			<th scope="col">번호</th>
			<th scope="col">아이디</th>
			<th scope="col">닉네임</th>
			<th scope="col">이메일</th>
			<th scope="col">H.P</th>
			<th scope="col">회원구분</th>
			<th scope="col">가입일시</th>
			<th scope="col">로그인일시</th>
			<th scope="col">회원상태</th>
			<th scope="col">DETAIL</th>
		</tr>
	</thead>
	<tbody>
		<c:forEach var="memberDto" items="${result}" varStatus="status">
			<br>

			<tr>
				<th scope="row">${memberDto.member_no}</th>
				<td>${memberDto.member_id}</td>
				</a>
				<td>${memberDto.member_nick}</td>
				<td>${result2[status.index].member_email}</td>
				<td>${result2[status.index].member_phone}</td>
				<td>${memberDto.member_state}</td>
				<td>${memberDto.member_join}</td>
				<td>${memberDto.member_login}</td>
				<td>${memberDto.report_state}</td>
	<td><button> <a href="${pageContext.request.contextPath}/admin/memberProfile/${memberDto.member_no}">DETAIL</a></button></td>
	</tr>
</c:forEach>

<a href="${pageContext.request.contextPath}">메인페이지로 이동</a>

</tbody>
</table>

<jsp:include page="/WEB-INF/views/template/admin/main_admin_nav_footer.jsp"></jsp:include>