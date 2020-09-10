<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    <jsp:include page="/WEB-INF/views/template/member/main_member_nav_header.jsp"></jsp:include>
    
<script>
$(".submit").click(funtion(){
	var file = document.querySelector("input[type=file]").value;

	var frm = new FormData();

	frm.append("file", file);

	axios({
		url:"/arori/imgAjax/classes/upload/${c_no}",
		method:"post",
		data:frm
	}).then(function(resp){
		$("input[name=img_no]").val(resp.data)
		console.log(${c_no})
	})

	var createClass = document.querySelector(".createClass")
	createClass.submit()
})

</script>

<div class="row content-top mt-5 h-100">
	<div class="col-12 overflow-auto mt-5">
	
<form action="create" method="post" class="createClass">
	<input type="hidden" name="img_no">
	<input type="hidden" name="c_no">
	제목 : <input type="text" name="c_title">
	<br>
	공개 여부 : 
	<select name="c_public">
		<option value=1>공개</option>
		<option value=0>비공개</option>		
	</select>
	<br>
	클래스 정보 : <textarea name="c_info"></textarea>
	<br>
	 <div>
   <label>이미지 첨부</label>
   <input type="file" name="file" accept=".jpg, .gif, .png">
   </div> 

	
	<button type="submit" class="submit">생성</button>
</form> 
	
	</div>
</div>
    
<jsp:include page="/WEB-INF/views/template/member/main_member_nav_footer.jsp"></jsp:include>

