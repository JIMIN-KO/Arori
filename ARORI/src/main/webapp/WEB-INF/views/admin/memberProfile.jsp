<jsp:include
	page="/WEB-INF/views/template/admin/main_admin_nav_header.jsp"></jsp:include>
<%@page contentType="text/html; charset=UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div class="row mt-5">
	<div class="col-8 offset-2">
		<form action="memberProfile" method="post" class="mt-3">
			<h1 class="font-weight-bold mt-4">회원상세정보</h1>
			<table class="table table-hover">
				<thead>
					<tr>
						<td>이미지공간</td>
					</tr>
				</thead>
				<tbody>
					<tr>
						<img
							src="${pageContext.request.contextPath}/imgAjax/notice/download/${this_no }" />
						이미지가 아직 없어서 안뜨는중
					</tr>
					<tr>
						<th scope="col">NO</th>
						<td><input type="text" class="form-control"
							value="${allMemberDto.member_no}" readonly="readonly"></td>
					</tr>


					<tr>
						<th scope="col">ID</th>
						<td><input type="text" class="form-control"
							value="${allMemberDto.member_id}" readonly="readonly"></td>
					</tr>

					<tr>
						<th scope="col">MEMBER</th>
						<td><input type="text" class="form-control"
							value="${allMemberDto.member_state}" readonly="readonly"></td>
					</tr>
					<tr>
						<th scope="col">NICK</th>
						<td><input type="text" class="form-control"
							value="${allMemberDto.member_nick}" readonly="readonly"></td>
					</tr>

					<tr>
						<th scope="col">E-mail</th>
						<td><input type="text" class="form-control"
							value="${allMemberDto.member_email}" readonly="readonly"></td>
					</tr>
					<tr>
						<th scope="col">PHONE</th>
						<td><input type="text" class="form-control"
							value="${allMemberDto.member_phone}" readonly="readonly"></td>
					</tr>

					<tr>
						<th scope="col">JOIN</th>
						<td><input type="text" class="form-control"
							value="${allMemberDto.member_join}" readonly="readonly"></td>
					</tr>

					<tr>
						<th scope="col">LOGIN</th>
						<td><input type="text" class="form-control"
							value="${allMemberDto.member_login}" readonly="readonly"></td>
					</tr>

					<tr>
						<th scope="col">STATE</th>
						<td><input type="text" class="form-control"
							value="${allMemberDto.report_state}" readonly="readonly"></td>
					</tr>
					<tr>
						<th scope="col">CLASS</th>
						<td><input type="text" class="form-control" value="${count}"
							readonly="readonly"> <a
							href="${pageContext.request.contextPath}/classes/detail/${allMemberDto.member_no}"
							class="btn btn- btn-md font-weight-bold">회원 클래스로 이동</a>
					</tr>

					<tr>
						<td><a
							href="${pageContext.request.contextPath}/admin/adminUpdate/${allMemberDto.member_id}"
							class="btn btn-primary btn-lg font-weight-bold">수정하기</a> <a
							href="${pageContext.request.contextPath}/admin/allList"
							class="btn btn-primary btn-lg font-weight-bold">목록으로</a></td>
					</tr>
				</tbody>
			</table>
		</form>
	</div>
</div>


<jsp:include
	page="/WEB-INF/views/template/admin/main_admin_nav_footer.jsp"></jsp:include>