<jsp:include
	page="/WEB-INF/views/template/admin/main_admin_nav_header.jsp"></jsp:include>
<jsp:include
	page="/WEB-INF/views/template/member/member_classes_nav_header.jsp"></jsp:include>
<%@page contentType="text/html; charset=UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>




<form action="memberProfile" method="post">
	<h1 class="font-weight-bold mt-4">
		<th scope="col"><svg width="3em" height="3em" viewBox="0 0 16 16"
				class="bi bi-person-fill" fill="currentColor"
				xmlns="http://www.w3.org/2000/svg">
  <path fill-rule="evenodd"
					d="M3 14s-1 0-1-1 1-4 6-4 6 3 6 4-1 1-1 1H3zm5-6a3 3 0 1 0 0-6 3 3 0 0 0 0 6z" />
</svg>관리자만 볼수 있는 회원 상세정보
	</h1>
	<table class="table table-hover">
		<tbody>
			<tr>
				<img
					src="${pageContext.request.contextPath}/imgAjax/notice/download/${this_no }" />
				이미지가 아직 없어서 안뜨는중
			</tr>
			<tr>
				<th scope="col">NO</th>
				<td><input type="text" class="form-control"
					value="${memberDto.member_no}" readonly="readonly"></td>
			</tr>


			<tr>
				<th scope="col">ID</th>
				<td><input type="text" class="form-control"
					value="${memberDto.member_id}" readonly="readonly"></td>
			</tr>

			<tr>
				<th scope="col">MEMBER</th>
				<td><input type="text" class="form-control"
					value="${memberDto.member_state}" readonly="readonly"></td>
			</tr>
			<tr>
				<th scope="col">NICK</th>
				<td><input type="text" class="form-control"
					value="${memberDto.member_nick}" readonly="readonly"></td>
			</tr>

			<tr>
				<th scope="col">E-mail</th>
				<td><input type="text" class="form-control"
					value="${memberDto2.member_email}" readonly="readonly"></td>
			</tr>
			<tr>
				<th scope="col">PHONE</th>
				<td><input type="text" class="form-control"
					value="${memberDto2.member_phone}" readonly="readonly"></td>
			</tr>

			<tr>
				<th scope="col">JOIN</th>
				<td><input type="text" class="form-control"
					value="${memberDto.member_join}" readonly="readonly"></td>
			</tr>

			<tr>
				<th scope="col">LOGIN</th>
				<td><input type="text" class="form-control"
					value="${memberDto.member_login}" readonly="readonly"></td>
			</tr>

			<tr>
				<th scope="col">STATE</th>
				<td><input type="text" class="form-control"
					value="${memberDto.report_state}" readonly="readonly"></td>
			</tr>
			<tr>
				<th scope="col">CLASS</th>
				<td><input type="text" class="form-control" value="${count}"
					readonly="readonly"> <svg width="2em" height="2em"
						viewBox="0 0 16 16" class="bi bi-book" fill="currentColor"
						xmlns="http://www.w3.org/2000/svg">
  <path fill-rule="evenodd"
							d="M1 2.828v9.923c.918-.35 2.107-.692 3.287-.81 1.094-.111 2.278-.039 3.213.492V2.687c-.654-.689-1.782-.886-3.112-.752-1.234.124-2.503.523-3.388.893zm7.5-.141v9.746c.935-.53 2.12-.603 3.213-.493 1.18.12 2.37.461 3.287.811V2.828c-.885-.37-2.154-.769-3.388-.893-1.33-.134-2.458.063-3.112.752zM8 1.783C7.015.936 5.587.81 4.287.94c-1.514.153-3.042.672-3.994 1.105A.5.5 0 0 0 0 2.5v11a.5.5 0 0 0 .707.455c.882-.4 2.303-.881 3.68-1.02 1.409-.142 2.59.087 3.223.877a.5.5 0 0 0 .78 0c.633-.79 1.814-1.019 3.222-.877 1.378.139 2.8.62 3.681 1.02A.5.5 0 0 0 16 13.5v-11a.5.5 0 0 0-.293-.455c-.952-.433-2.48-.952-3.994-1.105C10.413.809 8.985.936 8 1.783z" />
</svg>
					<button>
						<a
							href="${pageContext.request.contextPath}/classes/detail/${memberDto.member_no}">VIEW
							CLASS</a>
					</button></td>
			</tr>

			<tr>
				<td><a
					href="${pageContext.request.contextPath}/admin/adminUpdate/${memberDto.member_id}"
					class="btn btn-primary btn-lg font-weight-bold">수정하기</a> <a
					href="${pageContext.request.contextPath}/admin/resultMap"
					class="btn btn-primary btn-lg font-weight-bold">목록으로</a></td>
			</tr>
		</tbody>
	</table>
</form>

<jsp:include
	page="/WEB-INF/views/template/admin/main_admin_nav_footer.jsp"></jsp:include>