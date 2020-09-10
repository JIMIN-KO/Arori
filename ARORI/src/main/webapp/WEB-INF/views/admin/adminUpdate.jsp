<jsp:include
	page="/WEB-INF/views/template/admin/main_admin_nav_header.jsp"></jsp:include>
<jsp:include
	page="/WEB-INF/views/template/member/member_classes_nav_header.jsp"></jsp:include>
<%@page contentType="text/html; charset=UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<form action="adminUpdate" method="post">
 
	<table class="table table-hover">
		<h1 class="font-weight-bold mt-4">관리자-> 회원정보 업데이트 </h1>
		<thead>
<h1>이미지 공간</h1>
		</thead>
		<tbody>
		변경할 수 있는 정보만 표시됩니다.
		<tr>
				<th scope="col">NO</th>
				<td ><input type="text" class="form-control" value="${memberDto.member_no}" readonly="readonly"></td>
			</tr>
			<tr>
				<th scope="col">ID</th>
				<td ><input type="text" class="form-control" name="member_id"
					value="${memberDto.member_id}" readonly="readonly"></td>
			</tr>
			<tr>
				<th scope="col">NICK</th>
				<td><input type="text" class="form-control" name="member_nick"
					value="${memberDto.member_nick}"></td>
			</tr>
			<tr>
				<th scope="col">MEMBER</th>
				<td><input type="text" class="form-control" name="member_state"
					value="${memberDto.member_state}"></td>
			</tr>
			<tr>
				<th scope="col">JOIN</th>
				<td><input type="text" class="form-control" value="${memberDto.member_join}" readonly="readonly"></td>
			</tr>
			<tr>
				<th scope="col">LOGIN</th>
				<td><input type="text" class="form-control" value="${memberDto.member_login}" readonly="readonly"></td>
			</tr>
			<tr>
				<th scope="col">REPORT STATE</th>
				<td><select name="report_state"  class="custom-select">
						<option selected="selected" disabled="disabled">${memberDto.report_state}</option>
						<option value="정상">정상</option>
						<option value="일시 정지">일시 정지</option>
						<option value="영구 정지">영구 정지</option>
						<option value="탈퇴">탈퇴</option>
				</select></td>
			</tr>
			<tr>
				<th scope="col">SUSPENSION</th>
					<td><input type="text" class="form-control" name="suspension"
					value="${memberDto.suspension}"></td>
				<td>변경 예 : 2020-01-01 (yyyy-mm-dd)<td>
			
					
					
			</tr>

	<tr>
		<td><input type="submit"
					class="btn btn-primary btn-lg font-weight-bold" value="수정완료"></td>
			<td><a href="../delete"><input type="button"
						class="btn btn-primary btn-lg font-weight-bold" value="탈퇴시키기"></a></td>
						
					</tr>
					
			
		</tbody>
	</table>
</form>
<jsp:include
	page="/WEB-INF/views/template/admin/main_admin_nav_footer.jsp"></jsp:include>
<jsp:include
	page="/WEB-INF/views/template/member/member_classes_nav_footer.jsp"></jsp:include>
