<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<jsp:include page="/WEB-INF/views/template/member/main_member_nav_header.jsp"></jsp:include>

<script type="text/javascript">


</script>


<body>
<h1>마이클래스</h1>
<a href="${pageContext.request.contextPath}/classes/create"><button>클래스
		만들기</button></a>


<h2>클래스 목록</h2>
<table border="1">
	<thead>
		<tr>
			<th>클래스 번호</th>
			<th>이름</th>
			<th>정보</th>
			<th>공개여부</th>
			<th>등록일</th>
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
				<td>${classesDto.c_when}</td>
				<td>
					<a href="edit/${classesDto.c_no}">수정</a> 
					<a href="delete/${classesDto.c_no}">삭제</a>
				</td>
			</tr>
		</c:forEach>
	</tbody>
</table>
</body>
<jsp:include
	page="/WEB-INF/views/template/member/main_member_nav_footer.jsp"></jsp:include>

