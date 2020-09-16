<jsp:include
	page="/WEB-INF/views/template/admin/main_admin_nav_header.jsp"></jsp:include>
<%@page contentType="text/html; charset=UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div class="row mt-5">
	<div class="col-8 offset-2">
		<h1>신고글 작성</h1>

		<form action="write" method="post" id="report">
			<table class="table table-hover">
				<tbody>
					<tr>
						<th scope="col">REPORT_MEMBER</th>
						<td><input type="text" name="report_member"
							class="form-control" placeholder="아이디를 입력해주세요"></td>
					</tr>
					<tr>
						<th scope="col">REPORT TYPE</th>
						<td><select name="report_type" required="required"
							class="custom-select">
								<option value="유언비어" selected="selected">유언비어</option>
								<option value="욕설">욕설</option>
								<option value="불법 광고">불법 광고</option>
								<option value="저작권">저작권</option>
								<option value="기타">기타</option>
						</select></td>
					</tr>

					<tr>
						<th scope="col">REPORT CONTENT</th>
						<td><textarea name="report_content"
								placeholder="신고사유를 입력해주세요" class="form-control"></textarea></td>
					</tr>

					<tr>
						<th scope="col">REPORT CRIMI MEMBER</th>
						<td><input type="text" name="report_crimi"
							class="form-control" placeholder="신고할 아이디"></td>
					</tr>

					<tr>
						<td><input type="submit"
							class="btn btn-primary btn-lg font-weight-bold" value="신고접수"
							id="ok"> <a href="${pageContext.request.contextPath}"><input
								type="submit" class="btn btn-primary btn-lg font-weight-bold"
								value="돌아가기" id="cancel"></a></td>
					</tr>
				</tbody>
			</table>
		</form>
	</div>
</div>

<script>
	$("#report").submit(function(event) {

		if ($('.form-control').val() == "") {
			alert("아이디를 입력해주세요");
			$('[name=report_member]').focus();
			return false;
		}
		if ($('[name=report_type]').val() == "") {
			alert("신고사유를 선택해주세요.");
			$('[name=report_type]').focus();
			return false;
		}
		if ($('[name=report_content]').val() == "") {
			alert("신고내용을 입력해주세요.");
			$('[name=report_content]').focus();
			return false;
		}
		if ($('[name=report_crimi]').val() == "") {
			alert("신고하실 회원의 아이디를 입력해주세요.");
			$('[name=report_crimi]').focus();
			return false;
		}
		return true;
	});
</script>

<jsp:include
	page="/WEB-INF/views/template/admin/main_admin_nav_footer.jsp"></jsp:include>