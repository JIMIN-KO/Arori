<jsp:include
	page="/WEB-INF/views/template/member/main_member_nav_header.jsp"></jsp:include>
<%@page contentType="text/html; charset=UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<!-- 전체 리스트 불러오기 아직 구현중 -->


<tr>
	<td>번호</td>
	<td>아이디/소셜email</td>
	<td>닉네임</td>
	<td>회원종류</td>
</tr>
<c:forEach var="memberDto" items="${result}" varStatus="status">

			<c:out value="${memberDto.member_no}" />
			<c:out value="${memberDto.member_id}" />
			<c:out value="${memberDto.member_nick}" />
			<c:out value="${result2[status.index].member_email}"/>
			<c:out value="${memberDto.member_state}" />
			<c:out value="${memberDto.member_join}" />
			<c:out value="${memberDto.member_login}" />
			<c:out value="${memberDto.report_state}" />
			<c:out value="${memberDto.suspension}" />
	

</c:forEach>

<!-- 전체 리스트 불러오기 아직 구현중 -->


<jsp:include page="/WEB-INF/views/template/member/main_member_nav_footer.jsp"></jsp:include>
