<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="/WEB-INF/views/template/member/main_member_nav_header.jsp"></jsp:include>
<script src="https://unpkg.com/axios/dist/axios.min.js"></script>
<script>


/* 	$(function(){
		$("#sub").click(function(){
			
			axios({
				url:'${pageContext.request.contextPath}/classes/subscribe',
				method:'get'
			}).then(function(resp){
				subCount();			
			})
			
		function subCount() {
				
				axios({
					url:'${pageContext.request.contextPath}/classes/subscribe',
					method:'get'
				}). then(function(count){
					$(".subCount").html(count);
				})
			}
		}
	}); */
		
	
</script>

<h2>클래스 디테일 페이지</h2>

클래스 이름 :<div class="c_title">${classesDto.c_title}</div>
클래스 정보 :<div class="c_info">${classesDto.c_info}</div>
<div>회원 닉네임 : ${memberDto.member_nick}</div>
<!-- 

<div>회원 닉네임 : ${memberDto.member_nick }</div>
 -->
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
<span class="subCount"></span>
<!-- 
<div>구독자 수 : ${classesDto.c_subscribe }</div>
 -->

<!-- 로그인한 경우에만 구독 버튼이 보이도록 -->
<c:if test="${classesDto.member_no != userinfo.member_no}">
	<a href="${pageContext.request.contextPath}/classes/subscribe/${c_no}">
		<button type="button" id="sub">구독</button>
	</a>
</c:if>

<c:if test="${classesDto.member_no==userinfo.member_no}">
<a href="${pageContext.request.contextPath}/classes/edit/${c_no}">
	<button id='btn' name="edit">수정</button>
</a>
</c:if>
<a href="${pageContext.request.contextPath}/classes/myclass/${classesDto.member_no}">
	<button id='btn' name="myclass">목록</button>
</a>

			
			
<jsp:include page="/WEB-INF/views/template/member/main_member_nav_footer.jsp"></jsp:include>

