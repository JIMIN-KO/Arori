<jsp:include page="/WEB-INF/views/template/member/main_member_nav_header.jsp"></jsp:include>
<%@page contentType="text/html; charset=UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<!-- 전체 리스트 불러오기 아직 구현중 -->

<c:forEach var="memberDto" items="${list}">
${memberDto.member_no}
</c:forEach>


<c:forEach var="aroiMemberDto" items="${aroriList}">
${aroriMemberDto.member_no}
</c:forEach>

<!-- 전체 리스트 불러오기 아직 구현중 -->

<jsp:include page="/WEB-INF/views/template/member/main_member_nav_footer.jsp"></jsp:include>