<jsp:include
	page="/WEB-INF/views/template/admin/main_admin_nav_header.jsp"></jsp:include>
<jsp:include
	page="/WEB-INF/views/template/member/member_classes_nav_header.jsp"></jsp:include>
<%@page contentType="text/html; charset=UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div class="row mt-5">
	<h1 class="font-weight-bold mt-4">신고접수 상세 내용</h1>
	<table class="table table-hover">

		<tbody>
			<tr>
				<th scope="col">NO</th>
				<td><input type="text" class="form-control"
					value="${reportDto.report_no}" readonly="readonly"></td>
			</tr>
			<tr>
				<th scope="col">DATE</th>
				<td><input type="text" name="report_date" class="form-control"
					value="${reportDto.report_date}" readonly="readonly"></td>
			</tr>
			<tr>
				<th scope="col">REPRT MEMBER ID</th>
				<td><input type="text" name="report_member"
					class="form-control" value="${reportDto.report_member}"
					readonly="readonly"></td>
			</tr>
			<tr>
				<th scope="col">CRIMI MEMBER ID</th>
				<td><input type="text" name="report_crimi" class="form-control"
					value="${reportDto.report_crimi}" readonly="readonly"></td>
			</tr>
			<tr>
				<th scope="col">REPORT TYPE</th>
				<td><input type="text" name="report_type"
					value="${reportDto.report_type}" class="form-control"
					readonly="readonly"></td>
			</tr>
			<tr>

				<th scope="col">REPORT CONTENT</th>
				<td><textarea name="report_content" class="form-control"
						readonly="readonly">${reportDto.report_content}
</textarea></td>
			</tr>


			<tr align="center">
				<td><a
					href="${pageContext.request.contextPath}/admin/adminUpdate/${reportDto.report_crimi}"><input
						type="button" class="btn btn-lg btn-warning font-weight-bold mt-5"
						value="상태변경하기"></a> <a
					href="${pageContext.request.contextPath}/report/list"><input
						type="button" class="btn btn-primary btn-lg font-weight-bold mt-5"
						value="목록으로"></a></td>
			</tr>
			
		</tbody>
		
	</table>
</div>
 
                
                    
               

<jsp:include
	page="/WEB-INF/views/template/admin/main_admin_nav_footer.jsp"></jsp:include>