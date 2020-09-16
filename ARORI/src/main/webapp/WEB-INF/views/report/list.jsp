<jsp:include
	page="/WEB-INF/views/template/admin/main_admin_nav_header.jsp"></jsp:include>
<%@page contentType="text/html; charset=UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/paginationjs/2.1.4/pagination.min.js"></script>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/paginationjs/2.1.4/pagination.css" />


<script>
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
</script>

<table class="table table-hover">

	<h1>신고 접수 리스트</h1>
	<th>총 신고된 접수 내역은 ${reportCount} 건 입니다.
	<th>
	<tr>
		<th scope="col">번호</th>
		<th scope="col">신고 접수자</th>
		<th scope="col">신고 유형</th>
		<th scope="col">신고 내용</th>
		<th scope="col">신고 접수된 회원</th>
		<th scope="col">신고한 날짜</th>

	</tr>

	<tbody id="tbody">
		<%--  <c:forEach items="${list}" var="list">
            <tr>
                <th scope="row">
                    <c:out value="${list.report_no}" />
                </th>
                <td>
                    <c:out value="${list.report_member}" />
                </td>
                <td>
                    <c:out value="${list.report_type}" />
                </td>
                <td><a href="${pageContext.request.contextPath}/report/content/${list.report_no}"><svg width="1.0625em"
                            height="1em" viewBox="0 0 17 16" class="bi bi-exclamation-triangle-fill" fill="currentColor"
                            xmlns="http://www.w3.org/2000/svg">
                            <path fill-rule="evenodd"
                                d="M8.982 1.566a1.13 1.13 0 0 0-1.96 0L.165 13.233c-.457.778.091 1.767.98 1.767h13.713c.889 0 1.438-.99.98-1.767L8.982 1.566zM8 5a.905.905 0 0 0-.9.995l.35 3.507a.552.552 0 0 0 1.1 0l.35-3.507A.905.905 0 0 0 8 5zm.002 6a1 1 0 1 0 0 2 1 1 0 0 0 0-2z" />
                        </svg>신고내용</a></td>
                <td><a
                        href="${pageContext.request.contextPath}/admin/adminUpdate/${list.report_crimi}">${list.report_crimi}</a>
                </td>
                <td>
                    <c:out value="${list.report_date}" />
                </td>
            </tr>
        </c:forEach> --%>
	</tbody>


	<tr>
		<td align="center"><a
			href="${pageContext.request.contextPath}/report/searchList"><input
				type="button" class="form-control" value="검색창으로 이동하기"></a></td>
				
	</tr>






</table>
<div class="container-fluid">
	<div class="row">
		<div class="offset-md-5 col-md-5">
			<div id="pagination"></div>
		</div>
	</div>
</div>







<jsp:include
	page="/WEB-INF/views/template/admin/main_admin_nav_footer.jsp"></jsp:include>