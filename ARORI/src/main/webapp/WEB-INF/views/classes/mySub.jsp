<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <jsp:include page="/WEB-INF/views/template/member/main_member_nav_header.jsp"></jsp:include>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<h2>내가 구독한 클래스 목록</h2>
<table border="1">
	<thead>
		<tr>
			<th>클래스 번호</th>
			<th>출제자</th>
			<th>정보</th>
			<th>공개여부</th>
			<th>등록일</th>
			<th>구독자 수</th>
		</tr>
	</thead>
	<tbody>
		<c:forEach var="classesDto" items="${list}">
			<tr>
				<td>${classesDto.c_no}</td>
				<td>
					<a href="${pageContext.request.contextPath}/classes/detail/${classesDto.c_no}">
						${classesDto.c_title}					
					</a>
				</td>
				<td>${classesDto.c_info}</td>

				<td>
					<c:choose>
						<c:when test="${classesDto.c_public == 1}">
							공개
						</c:when>
						<c:otherwise>
							비공개
						</c:otherwise>
					</c:choose>
				</td>
				<td>
				<fmt:parseDate value="${classesDto.c_when}" 
							var="time" pattern="yyyy-MM-dd HH:mm:ss"/>
				<fmt:formatDate value="${time}" pattern="yyyy-MM-dd"/>				
				</td>
				<td>${classesDto.c_subscribe}</td>
<%-- 				<c:if test="${userinfo.member_no==subDto.member_no}">
				<td>
					<a href="delete/${subDto.c_no}">삭제</a>
				</td>
				</c:if> --%>
			</tr>
		</c:forEach>
	</tbody>
</table>

</body>
</html>
<jsp:include page="/WEB-INF/views/template/member/member_classes_nav_footer.jsp"></jsp:include>