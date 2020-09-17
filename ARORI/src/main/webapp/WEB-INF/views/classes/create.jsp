<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    <jsp:include page="/WEB-INF/views/template/member/main_member_nav_header.jsp"></jsp:include>
    
<style>

	.form-group {
	padding-left :0;
	}
	
	.btn {
	margin-left:320px;
	margin-top :20px;
	}
	
</style>

<script>

</script>

<div class="background"></div>
<div class="container-fluid">
	<div class="offset-sm-1 col-sm-10 offset-md-3 col-md-6">
		<form action="${pageContext.request.contextPath }/classes/create" method="post" style="padding-top:200px">
	  <div class="form-group">
	  <input type="hidden" name="member_no" value="${userinfo.member_no }">
	    <label for="c_title">Class Title</label>
	    <input type="text" class="form-control" id="c_title"  name="c_title">
	    <small id="emailHelp" class="form-text text-muted">클래스 이름은 20자 이내로 작성해주세요.</small>
	  </div>
	  <div class="form-group">
	    <label for="c_info">Class Info</label>
	    <textarea id="c_info" class="form-control" name="c_info"></textarea>
	        <small id="emailHelp" class="form-text text-muted">클래스 정보는 한 줄로 간략하게 작성해주세요.</small>
	  </div>
	  <div class="form-group form-check">
	    <label class="form-check-label" for="c_public">Public Check</label>
						<select  class="form-control" name="c_public" id="c_public">
							<option value="1">공개</option>
							<option value="0" >비공개</option>
						</select>
	  </div>
	  <button type="submit" class="btn btn-primary">Submit</button>
	</form>
	</div>
 </div>
<jsp:include page="/WEB-INF/views/template/member/main_member_nav_footer.jsp"></jsp:include>

