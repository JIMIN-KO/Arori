<jsp:include
	page="/WEB-INF/views/template/admin/main_admin_nav_header.jsp"></jsp:include>
<%@page contentType="text/html; charset=UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


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


	<c:forEach items="${list}" var="list">
		<tr>
			<th scope="row"><c:out value="${list.report_no}" /></th>
			<td><c:out value="${list.report_member}" /></td>
			<td><c:out value="${list.report_type}" /></td>
			<td><a
				href="${pageContext.request.contextPath}/report/content/${list.report_no}"><svg
						width="1.0625em" height="1em" viewBox="0 0 17 16"
						class="bi bi-exclamation-triangle-fill" fill="currentColor"
						xmlns="http://www.w3.org/2000/svg">
  <path fill-rule="evenodd"
							d="M8.982 1.566a1.13 1.13 0 0 0-1.96 0L.165 13.233c-.457.778.091 1.767.98 1.767h13.713c.889 0 1.438-.99.98-1.767L8.982 1.566zM8 5a.905.905 0 0 0-.9.995l.35 3.507a.552.552 0 0 0 1.1 0l.35-3.507A.905.905 0 0 0 8 5zm.002 6a1 1 0 1 0 0 2 1 1 0 0 0 0-2z" />
</svg>신고내용</a></td>
			<td><a
				href="${pageContext.request.contextPath}/admin/adminUpdate/${list.report_crimi}">${list.report_crimi}</a></td>
			<td><c:out value="${list.report_date}" /></td>
		</tr>
	</c:forEach>
	<form action="search" method="post">
		<tr>
			<th scope="col"><svg width="2em" height="2em"
					viewBox="0 0 16 16" class="bi bi-search" fill="currentColor"
					xmlns="http://www.w3.org/2000/svg">
  <path fill-rule="evenodd"
						d="M10.442 10.442a1 1 0 0 1 1.415 0l3.85 3.85a1 1 0 0 1-1.414 1.415l-3.85-3.85a1 1 0 0 1 0-1.415z" />
  <path fill-rule="evenodd"
						d="M6.5 12a5.5 5.5 0 1 0 0-11 5.5 5.5 0 0 0 0 11zM13 6.5a6.5 6.5 0 1 1-13 0 6.5 6.5 0 0 1 13 0z" />
</svg></th>
			<td><select name="type" class="custom-select">
					<option value="report_member">신고자</option>
					<option value="report_type">신고유형</option>
					<option value="report_crimi">신고회원</option>
			</select></td>
			<td><input type="text" class="form-control" name="keyword"
				placeholder="검색어"></td>
			<td><input type="submit" class="form-control" value="찾기"></td>
		</tr>
	</form>


</table>
<jsp:include
	page="/WEB-INF/views/template/admin/main_admin_nav_footer.jsp"></jsp:include>