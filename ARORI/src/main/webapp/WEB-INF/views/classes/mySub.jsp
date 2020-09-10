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
<style>
	/* 전체 카드 */
	.card-deck {
    height:460px;
    width:380px;
    padding-bottom: 30px;
    margin-top: 30px;
    margin-left: 17px;
}
	/* 이미지 사이즈 */
	.card-img {
	height:200px;
	width:320px;
	border-radius: 10px 10px;
	margin-left:13px;
	margin-top: 15px;
	}
	
	/* 클래스 제목 링크 색상 제거 */
	a {
	text-decoration: none;
	}
	.btn a {
	text-decoration: none;
	color:#ffffff;
	}
	
	/* 클래스 타이틀 */
	.card-title {
	text-decoration: none;
	color:black;
	}
	
	/* 클래스 정보 */
	.card-info {
	max-height:4.5em;
	white-space: nowrap;
	overflow: hidden;
	text-overflow: ellipsis;
	display: -webkit-box;
	-webkit-line-clamp: 3;
	-webkit-box-orient: vertical;
	text-decoration: none;
	color:#3e3e3e;
	}
	
	/* 버튼 */
	.card-btn {
	display: inline-block;
	}
</style>

</head>
<body>

<div class="row content-top mt-5 h-100">
	<div class="col-12 overflow-auto mt-5">
<div class="container-fluid">
	<div class="row">
	<c:forEach var="classesDto" items="${classesDto}">
		<div class="col-sm-12 col-md-6 col-lg-3">
			<div class="card-deck">
  				<div class="card">
			<a href="${pageContext.request.contextPath}/classes/readme/${classesDto.c_no}">
    				<img src="https://lh3.googleusercontent.com/proxy/krOnAmoaj9mpoKRwej4_B9pmiFxVtFiJrrxWgvFNL_7nwDmztB9McDMvQubDGin05J4Mf282hR-67Fe5Ur2b2VNomNKQzu51LMJYucMxQ15WcB7HJflVwKrfS6s" class="card-img" alt="...">
   			</a>
   						 <div class="card-body">
      						<h5 class="card-title">${classesDto.c_title}</h5>
      						<p class="card-info">${classesDto.c_info}</p>
      						<p class="card-when"><small class="text-muted">
      							<fmt:parseDate value="${classesDto.c_when}" 
									var="time" pattern="yyyy-MM-dd HH:mm:ss"/>
								<fmt:formatDate value="${time}" pattern="yyyy-MM-dd"/>	</small></p>
								<span class="badge badge-pill badge-success">${classesDto.c_subscribe}</span>
						
  						</div>	
  				</div>
 			</div>
		</div>
	</c:forEach>
	</div>
</div>
	
	
	</div>
</div>


<%-- <h2>내가 구독한 클래스 목록</h2>
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
				<c:if test="${userinfo.member_no==subDto.member_no}">
				<td>
					<a href="delete/${subDto.c_no}">삭제</a>
				</td>
				</c:if>
			</tr>
		</c:forEach>
	</tbody>
</table> --%>

</body>
</html>
<jsp:include page="/WEB-INF/views/template/member/main_member_nav_footer.jsp"></jsp:include>