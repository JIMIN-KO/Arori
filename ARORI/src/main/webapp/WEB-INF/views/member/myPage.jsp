<jsp:include page="/WEB-INF/views/template/member/main_member_nav_header.jsp"></jsp:include>
<%@page contentType="text/html; charset=UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<h1>aroriMyPage</h1>
<form action="myPage" method="post">


	<input type="text" value="${aroriMemberDto.member_no}"
		readonly="readonly"> <br> 
		
		이메일 <input type="text"
		value="${aroriMemberDto.member_email}" readonly="readonly"> <br>
		
	핸드폰 번호 <input type="text" value="${aroriMemberDto.member_phone}"
		readonly="readonly"> <br> 
		
		회원가입일시 <input type="text"
		value="${memberDto.member_join}" readonly="readonly"> <br>

		
		
	<input type="submit" value="수정하기">

</form>
<jsp:include page="/WEB-INF/views/template/member/main_member_nav_footer.jsp"></jsp:include>