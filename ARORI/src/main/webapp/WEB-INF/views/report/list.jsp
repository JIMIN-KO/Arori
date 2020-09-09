<jsp:include page="/WEB-INF/views/template/member/main_member_nav_header.jsp"></jsp:include>
<%@page contentType="text/html; charset=UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>



<h1>신고 접수 리스트</h1>

<c:forEach items="${list}" var="list">
번호<c:out value="${list.report_no}" />
신고 접수자<c:out value="${list.report_member}" />
신고 유형<c:out value="${list.report_type}" />
<a href="${pageContext.request.contextPath}/report/content/${list.report_no}"><td>▶신고내용 확인하기◀</td></a></td>
<td id="click">
<a href="${pageContext.request.contextPath}/admin/adminUpdate/${list.report_crimi}"><td>${list.report_crimi}</td></a></td>
신고한 날짜<c:out value="${list.report_date}" />
	<br>
	<br>
</c:forEach>

<form action="search" method="post">
<select name="type">
<option value="report_member">신고자</option>
<option value="report_type">신고유형</option>
<option value="report_crimi">신고회원</option>
</select>
<input type="text" name="keyword" placeholder="검색어">
<input type="submit" value="검색">
</form>