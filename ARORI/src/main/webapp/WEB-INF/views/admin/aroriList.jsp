<jsp:include
	page="/WEB-INF/views/template/admin/main_admin_nav_header.jsp"></jsp:include>
<%@page contentType="text/html; charset=UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<div class="row mt-5">
	<div class="col-8 offset-2">
		<h1>회원 목록(관리자 페이지) - 회원 아이디를 클릭하면 상세페이지로 이동</h1>
		<script type="text/javascript">
			function visit(url) {
				if (url.selectedIndex != 0) {
					location.href = url.options[url.selectedIndex].value;
				}
			}
		</script>
		<form>
			<button class="btn btn-lg btn-warning font-weight-bold mt-5">
				<a href="${pageContext.request.contextPath}/admin/allList/1">ALL
					MEMBER </a>
			</button>
			<div class="col-md-3 mb-3">
				<tr>
					<th><select onchange="visit(this)" class="custom-select">
							<option value="">
							<option value="http://localhost:8080/arori/admin/allList/1">전체회원</option>
							<option value="http://localhost:8080/arori/admin/aroriList/1"
								selected>아로리</option>
							<option value="http://localhost:8080/arori/admin/socialList/1">소셜</option>
					</select></th>
				</tr>
			</div>

			<table class="table table-hover">
				<thead>
					<tr>
						<th scope="col">번호</th>
						<th scope="col">아이디</th>
						<th scope="col">닉네임</th>
						<th scope="col">회원구분</th>
						<th scope="col">회원상태</th>
						<th scope="col">DETAIL</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="allMemberDto" items="${list}" varStatus="status">
						<tr>
							<c:if test="${allMemberDto.member_state eq 'ARORI'}">
								<tr>
								<tr>
									<th scope="row">${allMemberDto.member_no}</th>
									<td>${allMemberDto.member_id}</td>
									<td>${allMemberDto.member_nick}</td>
									<td>${allMemberDto.member_state}</td>
									<td>${allMemberDto.report_state}</td>

									<td><button>
											<a
												href="${pageContext.request.contextPath}/admin/memberProfile/${allMemberDto.member_no}">DETAIL</a>
										</button></td>
								</tr>
							</c:if>
					</c:forEach>
				</tbody>
				<nav aria-label="Page navigation example">
					<ul class="pagination justify-content-center">
						<li class="page-item"><c:if test="${pageNo > 10 }">
								<a class="page-link"
									href="${pageContext.request.contextPath }/admin/allList/${block[0] - 1}"
									aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
								</a>
							</c:if></li>
						<c:forEach var="block" items="${block}">
							<li class="page-item"><a class="page-link"
								href="${pageContext.request.contextPath }/admin/allList/${block}">${block}</a></li>
						</c:forEach>
						<li class="page-item"><c:set var="size"
								value="${fn:length(block)}"></c:set> <c:if
								test="${size> pageNo and pageNo >10}">
								<a class="page-link"
									href="${pageContext.request.contextPath }/admin/allList/${block[size]+1}"
									aria-label="Next"> <span aria-hidden="true">&raquo;</span>
								</a>
							</c:if></li>
					</ul>
				</nav>


				<form action="search" method="post">
					<table>
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
					</table>
				</form>
				<span>총 회원 수는 ${aroriCount} 명 입니다.</span>
				<a href="${pageContext.request.contextPath}"
					class="btn btn-primary btn-lg font-weight-bold">메인페이지로 이동</a>
				</tbody>
			</table>
		</form>
		<nav aria-label="Page navigation example">
			<ul class="pagination justify-content-center">
				<li class="page-item"><c:if test="${pageNo > 10 }">
						<a class="page-link"
							href="${pageContext.request.contextPath }/admin/aroriList/${block[0] - 1}"
							aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
						</a>
					</c:if></li>
				<c:forEach var="block" items="${block}">
					<li class="page-item"><a class="page-link"
						href="${pageContext.request.contextPath }/admin/aroriList/${block}">${block}</a></li>
				</c:forEach>
				<li class="page-item"><c:set var="size"
						value="${fn:length(block)}"></c:set> <c:if
						test="${size> pageNo and pageNo >10}">
						<a class="page-link"
							href="${pageContext.request.contextPath }/admin/aroriList/${block[size]+1}"
							aria-label="Next"> <span aria-hidden="true">&raquo;</span>
						</a>
					</c:if></li>
			</ul>
		</nav>
	</div>
</div>
</div>
</div>


<jsp:include
	page="/WEB-INF/views/template/admin/main_admin_nav_footer.jsp"></jsp:include>