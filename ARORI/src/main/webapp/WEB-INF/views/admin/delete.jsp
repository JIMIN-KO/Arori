<%-- <jsp:include
	page="/WEB-INF/views/template/admin/main_admin_nav_header.jsp"></jsp:include>
<jsp:include
	page="/WEB-INF/views/template/member/member_classes_nav_header.jsp"></jsp:include>
<%@page contentType="text/html; charset=UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script type="text/javascript">

	function button() {
		if (confirm("정말 탈퇴시키겠습니까?") == true) { //탈퇴
			document.form.submit();
		} else { //취소
			return;
		}
	}
</script>

<form action="delete" method="get" name="">
<h1 class="font-weight-bold mt-4">회원 탈퇴</h1>
	<table class="table table-hover">
	<tr>
	<th scope="col">탈퇴할 회원의 ID를 입력해주세요.</th> 
	<tr>
	<td><input type="text" name="member_id" placeholder="ID"></td>
		</tr>
		<tr>
		<td><input onclick="Javascript:button();"
				class="btn btn-danger btn-sm font-weight-bold" type="submit"
				value="탈퇴시키기"></td>
				</tr>
</table>
</form>
<jsp:include page="/WEB-INF/views/template/admin/main_admin_nav_footer.jsp"></jsp:include> --%>