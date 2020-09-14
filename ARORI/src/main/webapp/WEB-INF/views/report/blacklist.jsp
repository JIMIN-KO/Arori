<jsp:include
	page="/WEB-INF/views/template/admin/main_admin_nav_header.jsp"></jsp:include>
<%@page contentType="text/html; charset=UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script>
	
</script>

<table class="table table-hover">
	<h1>신고 접수 리스트</h1>
	<tr>
		<th scope="col">번호</th>
		<th scope="col">신고 접수자</th>
		<th scope="col">신고 유형</th>
		<th scope="col">신고 내용</th>
		<th scope="col">신고 접수된 회원</th>
		<th scope="col">신고한 날짜</th>

	</tr>
	<c:forEach items="${blacklist}" var="blacklist">
		<tr>
			<th scope="row"><c:if
					test="${blacklist.report_type eq '욕설'||blacklist.report_type eq'유언비어'||blacklist.report_type eq'불법 광고'||blacklist.report_type eq'저작권'}">
					<c:out value="${blacklist.report_no}" /></th>
			<td>${blacklist.report_member}</td>
			<td>${blacklist.report_type}</td>
			<td><a
				href="${pageContext.request.contextPath}/report/content/${blacklist.report_no}"><svg
						width="1.0625em" height="1em" viewBox="0 0 17 16"
						class="bi bi-exclamation-triangle-fill" fill="currentColor"
						xmlns="http://www.w3.org/2000/svg">
  <path fill-rule="evenodd" d="M8.982 1.566a1.13 1.13 0 0 0-1.96 0L.165 13.233c-.457.778.091 1.767.98 1.767h13.713c.889 0 1.438-.99.98-1.767L8.982 1.566zM8 5a.905.905 0 0 0-.9.995l.35 3.507a.552.552 0 0 0 1.1 0l.35-3.507A.905.905 0 0 0 8 5zm.002 6a1 1 0 1 0 0 2 1 1 0 0 0 0-2z" />
</svg>신고내용</a></td>
			<td><a href="${pageContext.request.contextPath}/admin/adminUpdate/${blacklist.report_crimi}">${blacklist.report_crimi}</a></td>
			<td><c:out value="${blacklist.report_date}" /> </c:if></td>
		</tr>
	</c:forEach>