<jsp:include
	page="/WEB-INF/views/template/admin/main_admin_nav_header.jsp"></jsp:include>
<%@page contentType="text/html; charset=UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.6.0/Chart.js"></script>
<div class="row mt-5">
	<div class="col-8 offset-2">
		<form action="adminUpdate" method="post" class="mt-3">
			<h1 class="font-weight-bold mt-4">회원정보 업데이트 페이지(관리자)</h1>
			<table class="table table-hover">
				<thead>
					<tr>
						<td>이미지공간</td>
					</tr>
				</thead>
				<tbody>
					<tr>
						<span>변경할 수 있는 정보만 표시됩니다.</span>
					<tr>
						<th scope="col">AUTH</th>
						<td>
						<!-- member_auth = 1이면면서 member_nick에 admin이 포함하면 관리자 -->
						<c:if
							test="${fn:contains(allMemberDto.member_auth,'1') || fn:contains(allMemberDto.member_nick,'admin')}">
						관리자					
						</c:if>
						<c:if test="${fn:contains(allMemberDto.member_auth,'0')}">
						일반회원				
						</c:if>
						<select name="member_auth">
								<option value="0">일반회원</option>
								<option value="1">관리자</option>
						</select></td>
					</tr>

					<tr>
						<th scope="col">ID</th>
						<td><input type="text" class="form-control" name="member_id"
							value="${allMemberDto.member_id}" readonly="readonly"></td>
					</tr>

					<tr>
						<th scope="col">MEMBER</th>
						<td><input type="text" class="form-control"
							name="member_state" value="${allMemberDto.member_state}"
							readonly="readonly"></td>
					</tr>
					<tr>
						<th scope="col">NICK</th>
						<td><input type="text" class="form-control"
							name="member_nick" value="${allMemberDto.member_nick}"></td>
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
					<tr>
						<th scope="col">REPORT STATE</th>
						<td><select name="report_state" class="custom-select">
								<option selected="selected" disabled="disabled">${allMemberDto.report_state}</option>
								<option value="정상">정상</option>
								<option value="일시 정지">일시 정지</option>
								<option value="영구 정지">영구 정지</option>
								<option value="탈퇴">탈퇴</option>
						</select></td>
					</tr>
					<tr>
						<th scope="col">SUSPENSION</th>
		
						<td><input type="text" class="form-control" name="suspension"
							value="${allMemberDto.suspension}" placeholder="ex:2020-01-01"> <span>변경 예 :
								2020-01-01 (yyyy-mm-dd)</span></td>

					</tr>

					<tr>
						<td><input type="submit" id="input"
							class="btn btn-primary btn-lg font-weight-bold" value="수정완료"></td>
						<td><a href="../delete"><input type="button" id="input"
								class="btn btn-primary btn-lg font-weight-bold" value="탈퇴시키기"></a></td>

					</tr>


				</tbody>
			</table>
		</form>
	</div>
</div>
<script>
	$(document).ready(function() {
		// select 옵션에 required X
		$("[name=member_state]").attr("required", false);

		$("[name=member_nick]").attr("required", false);

		$("[name=report_state]").attr("required", false);

		$("[name=suspension]").attr("required", false);

	});
</script>
<jsp:include
	page="/WEB-INF/views/template/admin/main_admin_nav_footer.jsp"></jsp:include>
