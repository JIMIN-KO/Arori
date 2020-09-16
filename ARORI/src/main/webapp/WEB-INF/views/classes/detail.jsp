<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
/* 비동기로 '구독'버튼 누를시 구독 테이블에 데이터 저장*/
 
$(function(){
	$("#subscribe").click(function(){
/*  		var c_no = document.querySelector("input[name=c_no]").value
		var member_no = document.querySelector("input[name=member_no]").value  */
		
		axios({
			url:'${pageContext.request.contextPath}/subAjax/subscribe?member_no='+${userinfo.member_no}+"&c_no="+${classesDto.c_no},
			method:'get'
		}) .then(function(resp){
			console.log("비동기 성공!");
			console.log(resp.data)
		})
	})
});
	
</script>

@@ -42,42 +37,39 @@
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

<div>등록시간 : 
	<fmt:parseDate value="${classesDto.c_when}" var="time" pattern="yyyy-MM-dd HH:mm:ss"/>
	<fmt:formatDate value="${time}" pattern="yyyy-MM-dd HH:mm"/>		
</div>

<span class="subCount"></span>
<!-- 

<div>구독자 수 : ${classesDto.c_subscribe }</div>
 -->


<!-- 로그인한 경우에만 구독 버튼이 보이도록 -->
<c:if test="${classesDto.member_no != userinfo.member_no}">

	<form action="${pageContext.request.contextPath}/classes/subscribe" method="post">
		<input type="hidden" name="c_no" value="${c_no }">
		<input type="hidden" name="member_no" value="${userinfo.member_no }">
		<input type="submit" value="구독">
	</form>
		<input type="submit" value="구독" id="subscribe">
</c:if>

<c:if test="${classesDto.member_no==userinfo.member_no}">
<a href="${pageContext.request.contextPath}/classes/edit/${c_no}">
	<button id='btn' name="edit">수정</button>
</a>
	<a href="${pageContext.request.contextPath}/classes/edit/${c_no}">
		<button id='btn' name="edit">수정</button>
	</a>
</c:if>
<a href="${pageContext.request.contextPath}/classes/myclass/${classesDto.member_no}">
	<button id='btn' name="myclass">목록</button>
</a>


	<a href="${pageContext.request.contextPath}/classes/myclass/${classesDto.member_no}">
		<button id='btn' name="myclass">목록</button>
	</a>			

<jsp:include page="/WEB-INF/views/template/member/main_member_nav_footer.jsp"></jsp:include>