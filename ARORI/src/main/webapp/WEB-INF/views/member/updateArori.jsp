<%@page contentType="text/html; charset=UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<script src="https://cdn.jsdelivr.net/npm/jquery@1.12.4/dist/jquery.min.js"></script>
<script>

   	 $(document).ready(function(){

    	$("#update").click(function(){

    if(confirm("수정하시겠습니까?")){
        document.form.action="${path}/member/myPage";
        document.form.submit();

   			 }
		});

    });

   	 
   	 /* 
   	 	이 페이지 주소로 하고 
   	 	DaoImpl에 parametertype="String"
   	 	member_id가 문자열 형태이니까 받아올수있자나
   	 	윤아
   	 	Select * from member where member_id=?
   	 	Select * from member where member_id='윤아'
		
   	 	<form>
   	 	-정보 1
   	 	-정보2
   	 	-수정한 정보1
   	 	-
   	 	-수정한 정보 2
   	 	-
   	 	</form>
   	 	Dto에 담아서  수정페이지에서 보여주고
   	 	
   	 	윤아가 수정을 하고 
   	 	
   	 	controller 업데이트 구문만 실행해주면 정보 수정 완료
   	 	update member set 수정 할거 
		
   	 	그다음에  redirect:member내정보 보여주는?
   	 			
   	 	
   	 	*/

</script>

<form action="updateArori" method="post" name="form">
	<!-- 세션에 있는 아이디 불러오는 것 추가 -->
	<h1>정보수정</h1>
	<input type="hidden" name="member_no">
	<br><br>
	password
	<input type="password" name="member_pw" value="${aroriMemberDto.member_pw}"> 
	<br><br> 
	email
	<input type="text" name="member_email" value="${aroriMemberDto.member_email}" required="required">
	 <br><br> 
	phone 
	<input type="text" name="member_phone"value="${aroriMemberDto.member_phone}" placeholder="PHONE" required="required"> 
		<br><br> 
	Q 
	<select name="pwList">
		<c:forEach var="pwList" items="${pwList}">
			<option value="${pwListo.pq_no}">${pwList.pq_content}</option>
		</c:forEach>	
	</select> 
	<br><br>
	A 
	<input type="text" name="member_a" placeholder="answer" required="required"> 
	<br><br>
	<input type="submit" value="수정" id="update">
	
</form>
<jsp:include page="/WEB-INF/views/template/member/main_member_nav_footer.jsp"></jsp:include>
