<jsp:include
	page="/WEB-INF/views/template/admin/main_admin_nav_header.jsp"></jsp:include>
<%@page contentType="text/html; charset=UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div class="row mt-5">
	<div class="offset-2 col-8">
		<h1>회원 목록(관리자 페이지) - 회원 아이디를 클릭하면 상세페이지로 이동</h1>
		<div class="mt-3">
			<button class="btn btn-lg btn-warning font-weight-bold mt-5">
				<a href="${pageContext.request.contextPath}/admin/cleanList">CLEAN
					MEMBER</a>
			</button>
			<div class="col-md-3 mb-3">
				<tr>
					<th><select onchange="visit(this)" class="custom-select">
							<option value="">
							<option value="http://localhost:8080/arori/admin/allList">전체회원</option>
							<option value="http://localhost:8080/arori/admin/aroriList">아로리</option>
							<option value="http://localhost:8080/arori/admin/socialList"
								selected>소셜</option>
					</select></th>
				</tr>
			</div>
		</div>
		<table class="table table-hover">
			<thead>
				<tr>
					<th scope="col">번호</th>
					<th scope="col">아이디</th>
					<th scope="col">닉네임</th>
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
						<c:if
							test="${allMemberDto.member_state eq 'GOOGLE'||allMemberDto.member_state eq 'GITHUB'}">
							<br>

							<tr>
								<th scope="row">${allMemberDto.member_no}</th>
								<td>${allMemberDto.member_id}</td>
								<td>${allMemberDto.member_nick}</td>
								<td>${allMemberDto.member_state}</td>
								<td>${allMemberDto.member_join}</td>
								<td>${allMemberDto.member_login}</td>
								<td>${allMemberDto.report_state}</td>
								<td>
									<button>
										<a
											href="${pageContext.request.contextPath}/admin/memberProfile/${allMemberDto.member_no}">DETAIL</a>
									</button>
								</td>
						</c:if>
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
				<span>총 소셜 회원수는 ${memberCount-aroriCount} 명입니다.</span>
				<a href="${pageContext.request.contextPath}"
					class="btn btn-primary btn-lg font-weight-bold">메인페이지로 이동</a>
			</tbody>
		</table>
	</div>
</div>
<script type="text/javascript">
	function visit(url) {
		if (url.selectedIndex != 0) {
			location.href = url.options[url.selectedIndex].value;
		}
	}
</script>

<jsp:include
	page="/WEB-INF/views/template/admin/main_admin_nav_footer.jsp"></jsp:include>