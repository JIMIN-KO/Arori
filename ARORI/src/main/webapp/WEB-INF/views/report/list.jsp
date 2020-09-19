<jsp:include
	page="/WEB-INF/views/template/admin/main_admin_nav_header.jsp"></jsp:include>
<%@page contentType="text/html; charset=UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!-- <script
	src="https://cdnjs.cloudflare.com/ajax/libs/paginationjs/2.1.4/pagination.min.js"></script>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/paginationjs/2.1.4/pagination.css" /> -->
<!-- <script>
	$(function() {
		$
				.get(
						'list_data',
						function(data) {
							console.log(data);
							let container = $('#pagination');
							container
									.pagination({
										dataSource : data,
										callback : function(data, pagination) {
											var dataHtml = '';

											$
													.each(
															data,
															function(index,
																	item) {
																dataHtml += '<tr><td>'
																		+ item.report_no
																		+ '</td><td>'
																		+ item.report_member
																		+ '</td><td>'
																		+ item.report_type
																		+ '</td><td><a href="content/'+item.report_no + '">'
																		+ "신고내용"
																		+ '</td></a><td>'
																		+ item.report_crimi
																		+ '</td><td>'
																		+ item.report_date
																		+ '</td></tr>';

															});

											$("#tbody").html(dataHtml);
										}
									})
						});
	})
</script> -->
<div class="row mt-5">
	<div class="col-8 offset-2">
			<h1>신고 접수 리스트</h1>
			<th>총 신고된 접수 내역은 ${reportCount} 건 입니다.</th>
			<table class="table table-hover">
				<tr>
					<th scope="col">번호</th>
					<th scope="col">신고 접수자</th>
					<th scope="col">신고 유형</th>
					<th scope="col">신고 내용</th>
					<th scope="col">신고 접수된 회원</th>
					<th scope="col">신고 접수 날짜</th>
				</tr>
				<tbody id="tbody">
					<c:set var="no" value="${no }"></c:set>
					<c:forEach items="${list}" var="list">
						<tr>
							<th scope="row">
								${no }
							</th>
							<c:set var="no" value="${no - 1 }"></c:set>
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
								href="${pageContext.request.contextPath}/admin/adminUpdate/${list.report_crimi}">${list.report_crimi}</a>
							</td>
							<td><c:out value="${list.report_date}" /></td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
			<nav aria-label="Page navigation example">
				<ul class="pagination justify-content-center">
					<li class="page-item">
					<c:if test="${pageNo > 10 }">
							<a class="page-link"
								href="${pageContext.request.contextPath }/report/list/${block[0] - 1}"
								aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
							</a>
						</c:if></li>
					<c:forEach var="block" items="${block}">
						<li class="page-item"><a class="page-link"
							href="${pageContext.request.contextPath }/report/list/${block}">${block}</a></li>
					</c:forEach>
					<li class="page-item">
						<c:set var="size" value="${fn:length(block)}"></c:set>
						<c:if test="${size> pageNo and pageNo >10}">
							<a class="page-link"
								href="${pageContext.request.contextPath }/report/list/${block[size]+1}"
								aria-label="Next"> <span aria-hidden="true">&raquo;</span>
							</a>
						</c:if>
					</li>
				</ul>
			</nav>
		</div>
	</div>


			<!-- 	<form action="search" method="post">
					<table>
						<tr>
							<th scope="col"></th>
							<td><select name="type" class="custom-select">
									<option value="report_member">신고자</option>
									<option value="report_type">신고유형</option>
									<option value="report_crimi">신고회원</option>
							</select></td>
							<td><input type="text" class="form-control" name="keyword"
								placeholder="검색어"></td>
							<td><input type="submit"
								class="btn btn-primary btn-lg font-weight-bold" value="찾기"></td>
						</tr>
					</table>
				</form> -->


			<jsp:include
				page="/WEB-INF/views/template/admin/main_admin_nav_footer.jsp"></jsp:include>