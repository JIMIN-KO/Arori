<%@page import="com.kh.arori.entity.MemberDto"%>
<jsp:include
	page="/WEB-INF/views/template/member/main_member_nav_header.jsp"></jsp:include>
<%@page contentType="text/html; charset=UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<h1>신고 접수 리스트</h1>

<c:forEach items="${list}" var="list">
번호<c:out value="${list.report_no}" />
신고 접수자<c:out value="${list.report_member}" />
신고 유형<c:out value="${list.report_type}" />
신고내용<c:out value="${list.report_content}" />
<a href="${pageContext.request.contextPath}/admin/adminUpdate/${list.report_crimi}"><td>${list.report_crimi}</td></a>
신고날짜<c:out value="${list.report_date}" />
	<br>
	<br>
</c:forEach>

