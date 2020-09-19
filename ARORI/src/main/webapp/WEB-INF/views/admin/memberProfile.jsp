<jsp:include
	page="/WEB-INF/views/template/admin/main_admin_nav_header.jsp"></jsp:include>
<%@page contentType="text/html; charset=UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<script>
function del(member_no) {
    var chk = confirm("정말 삭제하시겠습니까?")
    if (chk) {
       location.href='${pageContext.request.contextPath}/admin/delete/' + member_no
    }
 }   

</script>
<div class="row mt-5">
	<div class="col-8 offset-2">
		
			<h1 class="font-weight-bold mt-5">회원상세정보</h1>
			<table class="table table-hover text-center">
				<tbody>
					<tr>
						<th scope="col">AUTH</th>
						<td><c:if
								test="${fn:contains(allMemberDto.member_auth,'1') || fn:contains(allMemberDto.member_nick,'admin')}">
                  관리자               
                  </c:if> <c:if
								test="${fn:contains(allMemberDto.member_auth,'0')}">
                  일반회원            
                  </c:if></td>
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
							href="${pageContext.request.contextPath}/classes/myclass/${allMemberDto.member_no}"
							class="btn btn-primary btn-sm font-weight-bold mt-5">회원 클래스로 이동</a>
					</tr>

					<tr>
						<td colspan="2"><input type="button" class="btn btn-primary btn-lg font-weight-bold" id="update" value="수정하기">
						<input type="button" class="btn btn-primary btn-lg font-weight-bold" value="삭제하기" onclick="del(${allMemberDto.member_no})">
							<a href="${pageContext.request.contextPath}/admin/allList"
							class="btn btn-primary btn-lg font-weight-bold">목록으로</a></td>
					</tr>
				</tbody>
			</table>
	</div>
</div>
<jsp:include
	page="/WEB-INF/views/template/admin/main_admin_nav_footer.jsp"></jsp:include>