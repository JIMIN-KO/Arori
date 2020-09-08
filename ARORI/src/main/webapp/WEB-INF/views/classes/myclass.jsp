<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<jsp:include page="/WEB-INF/views/template/member/main_member_nav_header.jsp"></jsp:include>
<style>

	/* 전체 카드 */
	.card-deck {
    margin: 20px;
}
	/* 이미지 사이즈 */
	.card-img-top {
	height:200px;
	width:300px;
	}
	
	/* 클래스 제목 링크 색상 제거 */
	a {
	text-decoration: none;
	color:#000000;
	}
</style>

<script>

</script>

<body>
<h1>마이클래스</h1>
<a href="${pageContext.request.contextPath}/classes/create"><button>클래스
		만들기</button></a>


<%-- <h2>클래스 목록</h2>
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
					<a href="${pageContext.request.contextPath}/classes/readme/${classesDto.c_no}">
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
				<c:if test="${userinfo.member_no==classesDto.member_no}">
				<td>
					<a href="edit/${classesDto.c_no}">수정</a> 
					<a href="delete/${classesDto.c_no}">삭제</a>
				</td>
				</c:if>
			</tr>
		</c:forEach>
	</tbody>
</table> --%>

	<c:forEach var="classesDto" items="${list}">
<div class="card-deck">
<a href="${pageContext.request.contextPath}/classes/readme/${classesDto.c_no}">
  <div class="card">
    <img src="https://lh3.googleusercontent.com/proxy/krOnAmoaj9mpoKRwej4_B9pmiFxVtFiJrrxWgvFNL_7nwDmztB9McDMvQubDGin05J4Mf282hR-67Fe5Ur2b2VNomNKQzu51LMJYucMxQ15WcB7HJflVwKrfS6s" class="card-img-top" alt="...">
    <div class="card-body">
      <h5 class="card-title">${classesDto.c_title}</h5>
      <p class="card-text">${classesDto.c_info}</p>
      <p class="card-text"><small class="text-muted"><fmt:parseDate value="${classesDto.c_when}" 
							var="time" pattern="yyyy-MM-dd HH:mm:ss"/>
				<fmt:formatDate value="${time}" pattern="yyyy-MM-dd"/>	</small></p>
    </div>
    </a>
  </div>
  <div class="card">
    <img src="..." class="card-img-top" alt="...">
    <div class="card-body">
      <h5 class="card-title">Card title</h5>
      <p class="card-text">This card has supporting text below as a natural lead-in to additional content.</p>
      <p class="card-text"><small class="text-muted">Last updated 3 mins ago</small></p>
    </div>
  </div>
  <div class="card">
    <img src="..." class="card-img-top" alt="...">
    <div class="card-body">
      <h5 class="card-title">Card title</h5>
      <p class="card-text">This is a wider card with supporting text below as a natural lead-in to additional content. This card has even longer content than the first to show that equal height action.</p>
      <p class="card-text"><small class="text-muted">Last updated 3 mins ago</small></p>
    </div>
  </div>
</div>
	</c:forEach>

</body>
<jsp:include page="/WEB-INF/views/template/member/main_member_nav_footer.jsp"></jsp:include>

