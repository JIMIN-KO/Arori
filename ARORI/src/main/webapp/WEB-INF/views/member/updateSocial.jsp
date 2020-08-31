<jsp:include page="/WEB-INF/views/template/main_header.jsp"></jsp:include>
<%@page contentType="text/html; charset=UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<script src="https://cdn.jsdelivr.net/npm/jquery@1.12.4/dist/jquery.min.js"></script>
<script>
    $(document).ready(function(){
    	
$("#update").click(function(){

    if(confirm("수정하시겠습니까?")){
        document.form.action="${path}/member/socialMyPage";
        document.form.submit();

   		 }
	
		});
  
    });

</script>

<form action="updateSocial" method="post" name="form">
	<!-- 세션에 있는 아이디 불러오는 것 추가 -->
	<h1>정보수정</h1>
	<input type="hidden" value="${memberDto.member_no}">
	<br><br>
	닉네임
<input type = "text" value="${memberDto.member_nick}">
<br>
가입날짜
<input type ="text" value="${memberDto.member_join}">
<br>
<input type="submit"  value="수정" id="update">
</form>
</body>
</html>
