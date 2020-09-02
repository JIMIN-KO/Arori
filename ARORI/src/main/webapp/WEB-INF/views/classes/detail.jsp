<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="/WEB-INF/views/template/member/main_member_nav_header.jsp"></jsp:include>
<script src="https://unpkg.com/axios/dist/axios.min.js"></script>
<script>

/* 	$(function(){
		// 정보 수정
		var c_title = document.querySelector(".c_title").value;
		var c_info = document.querySelector(".c_info").value;
		
		axios({
			url:"${pageContext.request.contextPath}/classes/edit?c_no="+c_no,
			method:"get"
		})
		.then(function(response){
			if($(document).on('click', '#btn', function(){
				$()
			}))
		})
		
	}); */
	
</script>

<h2>클래스 디테일 페이지</h2>

클래스 이름 :<div class="c_title">${classesDto.c_title}</div>
클래스 정보 :<div class="c_info">${classesDto.c_info}</div>
<div>회원 닉네임 : ${userinfo.member_nick }</div>
<div class="select_data">
공개여부 :
<c:choose>
	<c:when test ="${classesDto.c_public == 1}">
	<h3>공개</h3>
	</c:when>
	<c:otherwise>
	<h3>비공개</h3>
	</c:otherwise>
</c:choose>
</div>
<div>등록 시간 : ${classesDto.c_when }</div>
<a href="${pageContext.request.contextPath}/classes/edit/${c_no}">
<button id='btn' name="edit">수정</button>
</a>

<jsp:include page="/WEB-INF/views/template/member/main_member_nav_footer.jsp"></jsp:include>

