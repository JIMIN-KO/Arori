<jsp:include
	page="/WEB-INF/views/template/admin/main_admin_nav_header.jsp"></jsp:include>
<%@page contentType="text/html; charset=UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script>
	<script>
	$(document).ready(function() {

		$('input[value=일시 정지]').css('color', 'red');

	});
</script>


<h1>회원 목록(관리자 페이지) - 회원 아이디를 클릭하면 상세페이지로 이동</h1>
<button class="btn btn-primary btn-lg font-weight-bold">
	<a href="${pageContext.request.contextPath}/admin/allList">ALL
		MEMBER 
</button>
<table class="table table-hover">
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
			<c:forEach var="allMemberDto" items="${list}" varStatus="status">
			<tr>
				<c:if test="${allMemberDto.member_state eq 'ARORI'}">
					<br>

					<tr>
							<th scope="row">${allMemberDto.member_no}</th>
							<td>${allMemberDto.member_id}</td>
							</a>
							<td>${allMemberDto.member_nick}</td>
							<td>${allMemberDto.member_email}</td>
							<td>${allMemberDto.member_phone}</td>
							<td>${allMemberDto.member_state}</td>
							<td>${allMemberDto.member_join}</td>
							<td>${allMemberDto.member_login}</td>
							<td>${allMemberDto.report_state}</td>

						<td><button>
								<a
									href="${pageContext.request.contextPath}/admin/memberProfile/${allMemberDto.member_no}">DETAIL</a>
							</button>
				</c:if>
				</td>
			</tr>
		</c:forEach>
		<form action="search" method="post">
			<tr>
				<td><select name="type" class="custom-select">
						<option value="member_id">ID</option>
						<option value="member_state">소셜/아로리회원</option>
						<option value="member_nick">닉네임</option>
				</select></td>
				<td><input type="text" class="form-control" name="keyword"
					placeholder="검색어"></td>
				<td><input type="submit" class="form-control" value="찾기"></td>
			</tr>
		</form>
		총 회원 수는 ${aroriCount} 명 입니다.
		<a href="${pageContext.request.contextPath}"
			class="btn btn-primary btn-lg font-weight-bold"><svg
				width="1.5em" height="1.5em" viewBox="0 0 16 16"
				class="bi bi-house-fill" fill="currentColor"
				xmlns="http://www.w3.org/2000/svg">
  <path fill-rule="evenodd"
					d="M8 3.293l6 6V13.5a1.5 1.5 0 0 1-1.5 1.5h-9A1.5 1.5 0 0 1 2 13.5V9.293l6-6zm5-.793V6l-2-2V2.5a.5.5 0 0 1 .5-.5h1a.5.5 0 0 1 .5.5z" />
  <path fill-rule="evenodd"
					d="M7.293 1.5a1 1 0 0 1 1.414 0l6.647 6.646a.5.5 0 0 1-.708.708L8 2.207 1.354 8.854a.5.5 0 1 1-.708-.708L7.293 1.5z" />
</svg>메인페이지로 이동<svg width="1.5em" height="1.5em" viewBox="0 0 16 16"
				class="bi bi-house-fill" fill="currentColor"
				xmlns="http://www.w3.org/2000/svg">
  <path fill-rule="evenodd"
					d="M8 3.293l6 6V13.5a1.5 1.5 0 0 1-1.5 1.5h-9A1.5 1.5 0 0 1 2 13.5V9.293l6-6zm5-.793V6l-2-2V2.5a.5.5 0 0 1 .5-.5h1a.5.5 0 0 1 .5.5z" />
  <path fill-rule="evenodd"
					d="M7.293 1.5a1 1 0 0 1 1.414 0l6.647 6.646a.5.5 0 0 1-.708.708L8 2.207 1.354 8.854a.5.5 0 1 1-.708-.708L7.293 1.5z" />
</svg></a>
	</tbody>

</table>

<jsp:include
	page="/WEB-INF/views/template/admin/main_admin_nav_footer.jsp"></jsp:include>