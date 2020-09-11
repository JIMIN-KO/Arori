<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    <jsp:include page="/WEB-INF/views/template/member/main_member_nav_header.jsp"></jsp:include>
    
<script>

</script>

<div class="row content-top mt-5 h-100">
	<div class="col-12 overflow-auto mt-5">
	<form action="${pageContext.request.contextPath }/classes/create" method="post">

		<input type="hidden" name="member_no" value="${userinfo.member_no }">
		<label for="c_title">
			Title
		</label>
		<input type="text" name="c_title" id="c_title">
		<label for="c_info">
			Info
		</label>
		<textarea name="c_info" id="c_info"></textarea>
		<label for="c_public">
			Public
		</label>
		<select name="c_public" id="c_public">
			<option value="1">공개</option>
			<option value="0" >비공개</option>
		</select>
		<button type="submit">Submit</button>
		</form>
		</div>

</div>
    
<jsp:include page="/WEB-INF/views/template/member/main_member_nav_footer.jsp"></jsp:include>

