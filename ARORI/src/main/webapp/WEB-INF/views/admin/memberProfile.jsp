<jsp:include
	page="/WEB-INF/views/template/admin/main_admin_nav_header.jsp"></jsp:include>
<%@page contentType="text/html; charset=UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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
		
			<h1 class="font-weight-bold mt-5"><svg width="4em" height="4em" viewBox="0 0 16 16" class="bi bi-person-lines-fill" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
  <path fill-rule="evenodd" d="M1 14s-1 0-1-1 1-4 6-4 6 3 6 4-1 1-1 1H1zm5-6a3 3 0 1 0 0-6 3 3 0 0 0 0 6zm7 1.5a.5.5 0 0 1 .5-.5h2a.5.5 0 0 1 0 1h-2a.5.5 0 0 1-.5-.5zm-2-3a.5.5 0 0 1 .5-.5h4a.5.5 0 0 1 0 1h-4a.5.5 0 0 1-.5-.5zm0-3a.5.5 0 0 1 .5-.5h4a.5.5 0 0 1 0 1h-4a.5.5 0 0 1-.5-.5zm2 9a.5.5 0 0 1 .5-.5h2a.5.5 0 0 1 0 1h-2a.5.5 0 0 1-.5-.5z"/>
</svg>회원 상세정보</h1>
			<table class="table table-hover text-center">
				<tbody>
					<tr>
						<th scope="col">AUTH</th>
						<td><c:if
								test="${fn:contains(allMemberDto.member_auth,'1') || fn:contains(allMemberDto.member_nick,'admin')}">
                <svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-check" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
  <path fill-rule="evenodd" d="M10.97 4.97a.75.75 0 0 1 1.071 1.05l-3.992 4.99a.75.75 0 0 1-1.08.02L4.324 8.384a.75.75 0 1 1 1.06-1.06l2.094 2.093 3.473-4.425a.236.236 0 0 1 .02-.022z"/>
</svg>  관리자               
                  </c:if> <c:if
								test="${fn:contains(allMemberDto.member_auth,'0')}">
                 <svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-check" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
  <path fill-rule="evenodd" d="M10.97 4.97a.75.75 0 0 1 1.071 1.05l-3.992 4.99a.75.75 0 0 1-1.08.02L4.324 8.384a.75.75 0 1 1 1.06-1.06l2.094 2.093 3.473-4.425a.236.236 0 0 1 .02-.022z"/>
</svg> 일반회원            
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
							value="${allMemberDto.member_nick}" readonly="readonly"><span></span></td>
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
						<td colspan="2"><a href="${pageContext.request.contextPath}/admin/adminUpdate/${allMemberDto.member_id}" class="btn btn-primary btn-lg font-weight-bold">
							수정하기</a>
						<input type="button" class="btn btn-primary btn-lg font-weight-bold" value="삭제하기" onclick="del(${allMemberDto.member_no})">
					<a href="${pageContext.request.contextPath}/admin/allList/1"
							class="btn btn-primary btn-lg font-weight-bold">목록으로</a></td>
					</tr>
				</tbody>
			</table>
	</div>
</div>
<jsp:include
	page="/WEB-INF/views/template/admin/main_admin_nav_footer.jsp"></jsp:include>