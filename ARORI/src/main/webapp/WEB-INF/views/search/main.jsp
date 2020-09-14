<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<jsp:include
	page="/WEB-INF/views/template/member/main_member_nav_header.jsp"></jsp:include>
	
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
	
</style>
	
<div class="row content-top mt-5 h-100">
	<div class="col-12 overflow-auto mt-5">
		<!-- 본문 내용 -->
		<div class="ml-3 mr-3 mt-5">
			<!-- 검색창 -->
			<div>
				<!-- 검색 분류 -->
				<select name="searchOption" id="searchOption">
					<option value="member_nick">작성자</option>
					<option value="c_title">클래스</option>
				</select>

				<!-- 검색어 -->
				<input type="text" name="keyword" id="keyword">

				<!--검색 버튼 -->
				<input type="button" value="검색" id="search">

				<select name="col" class="dropdown">
					<option>최신순</option>
					<option>등록순</option>
					<option>인기순</option>
				</select>
			</div>
		</div>
	</div>
</div>

<div class="row content-top mt-5 h-100">
	<div class="col-12 overflow-auto mt-5">
		<div class="container-fluid">
			<div class="row">
				<c:forEach var="MCIDto" items="${MCIDto}">
					<div class="col-sm-12 col-md-6 col-lg-3">
						<div class="card-deck">
  							<div class="card">
  								<c:choose>
									<c:when test="${MCIDto.ai_no > 0}">
										<img src="${pageContext.request.contextPath }/imgAjax/classes/download/${MCIDto.ai_no }" class="card-img" alt="...">
									</c:when>
									<c:otherwise>
										<img src="http://lorempixel.com/400/200/" alt="love" class="card-img">
									</c:otherwise>
								</c:choose>
   								<div class="card-body">
      								<span class="card-title">${MCIDto.c_title}</span>
									<span class="badge badge-pill badge-success">${MCIDto.c_subscribe}</span>
      								<p class="card-info">${MCIDto.c_info}</p>
      								<p class="card-info">${MCIDto.member_nick}</p>
      								<p class="card-when"><small class="text-muted">
	      								<fmt:parseDate value="${MCIDto.c_when}" var="time" pattern="yyyy-MM-dd HH:mm:ss"/>
										<fmt:formatDate value="${time}" pattern="yyyy-MM-dd"/></small></p>
  								</div>	
  										<!-- 내 클래스일 때는 수정, 삭제 버튼 / 남의 클래스 일 때는 구독버튼이 보이게 -->
									<c:choose>
										<c:when test="${MCIDto.member_no != userinfo.member_no}">
												<form method="post" class="d-flex justify-content-center mb-3">
													<span class="card-btn">
														<input type="hidden" name="c_no" id="subC_no" value="${MCIDto.c_no }">
														<input type="button" class="btn btn-primary btn-sm subBtn" value="구독">	
													</span>
												</form>
										</c:when>
										<c:otherwise>
											<div class="card-btn w-100">
												<div class="row">
													<div class="col-6">
														<button type="button" class="btn btn-primary btn-sm editClass btn-block" data-target="#classEdit">EDIT</button>
													</div>
													<div class="col-6">
														<a href="${pageContext.request.contextPath}/classes/delete/${MCIDto.c_no}" class="btn btn-warning btn-sm btn-block">DELETE</a>
													</div>
												</div>
											</div>
										</c:otherwise>
									</c:choose>
  							</div>
 						</div>
					</div>
				</c:forEach>
			</div>
		</div>
	</div>
</div>					
	
	<script>
		$(function() {

			$("#search").click(function() {
							console.log("hello")
								var keyword = $("#keyword").val()
								var searchOption = $("#searchOption").val()
								var list = document.querySelector(".card")
								/* list.textContent = "" */

								axios(
										{
											url : '${pageContext.request.contextPath}/searchAjax/search?keyword='
													+ keyword
													+ '&searchOption='
													+ searchOption,
											method : 'get'
										})
										.then(
												function(resp) {
													console.log(resp)

													for (var i = 0; i < resp.data.length; i++) {

														
													}
												})
							})
		})
	</script>

	
	<jsp:include
		page="/WEB-INF/views/template/member/main_member_nav_footer.jsp"></jsp:include>