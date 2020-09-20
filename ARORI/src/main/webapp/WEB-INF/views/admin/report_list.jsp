<jsp:include
	page="/WEB-INF/views/template/admin/main_admin_nav_header.jsp"></jsp:include>
<%@page contentType="text/html; charset=UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<div class="row mt-5">
	<div class="col-8 offset-2">
	<div class="card mt-5 mb-5">
			  <div class="card-header h3 bg-warning text-white">
			  Reportlist
			  </div>    
		<div class="card-body">
			<blockquote class="mb-0">
				<p><svg width="1.5em" height="1.5em" viewBox="0 0 16 16" class="bi bi-bell-fill" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
  <path d="M8 16a2 2 0 0 0 2-2H6a2 2 0 0 0 2 2zm.995-14.901a1 1 0 1 0-1.99 0A5.002 5.002 0 0 0 3 6c0 1.098-.5 6-2 7h14c-1.5-1-2-5.902-2-7 0-2.42-1.72-4.44-4.005-4.901z"/>
</svg>총 신고된 접수 내역은 ${reportCount} 건 입니다.</p>
			</blockquote>
		</div>
	</div>
		<form action="${pageContext.request.contextPath }/admin/report_list/1" method="get" class="mt-5 mb-5 w-100">
				<div class="row">
					<div class="col-1">
						<select name="col" class="custom-select">
							<option value="report_member">신고 접수자</option>
							<option value="report_type">신고 유형</option>
							<option value="report_crimi">신고 받은 회원</option>
						</select>
					</div>
						<div class="col-10">
						<input type="text" class="form-control" name="keyword" placeholder="검색어">
					</div>
					<div class="col-1">
						<input type="submit" class="btn btn-primary btn-md font-weight-bold"  value="찾기">
					</div>
				</div>
			</form>

		<table class="table table-hover">
			<thead>
				<tr>
					<th scope="col">번호</th>
					<th scope="col">신고 접수자</th>
					<th scope="col">신고 유형</th>
					<th scope="col">신고 내용</th>
					<th scope="col">신고 접수된 회원</th>
					<th scope="col">신고 접수 날짜</th>
				</tr>
			</thead>
			<tbody>
				<c:set var="no" value="${no }"></c:set>
				<c:forEach items="${list}" var="list">
					<tr>
						<th scope="row">${no }</th>
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
				<li class="page-item"><c:if test="${pageNo > 10 }">
						<a class="page-link"
							href="${pageContext.request.contextPath }/admin/report_list/${block[0] - 1}"
							aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
						</a>
					</c:if></li>
				<c:forEach var="block" items="${block}">
					<li class="page-item"><a class="page-link"
						href="${pageContext.request.contextPath }/admin/report_list/${block}">${block}</a></li>
				</c:forEach>
				<li class="page-item"><c:set var="size"
						value="${fn:length(block)}"></c:set> <c:if
						test="${size> pageNo and pageNo >10}">
						<a class="page-link"
							href="${pageContext.request.contextPath }/admin/report_list/${block[size]+1}"
							aria-label="Next"> <span aria-hidden="true">&raquo;</span>
						</a>
					</c:if></li>
			</ul>
		</nav>
	</div>
</div>
<script>
	$(function(){
		// 페이지 네이션 시, 해당 블럭에 파라미터 값 넣기
		var block = document.querySelectorAll(".block");
		var next = document.querySelector(".next");
		var prev = document.querySelector(".prev");
		var param = location.search

		if(param) {	
			$(prev).attr("href","${pageContext.request.contextPath }/admin/report_list/" + (block[0] - 1) + param)
			$(next).attr("href","${pageContext.request.contextPath }/admin/report_list/" + (block[block.size]+1) + param)
			for(var i = 0; i < block.length; i++) {
				var path = "${pageContext.request.contextPath }/admin/report_list/" + (i+1) + param
				$(block[i]).attr("href",path)
			}
		}

	})
</script>

<jsp:include
	page="/WEB-INF/views/template/admin/main_admin_nav_footer.jsp"></jsp:include>