<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


<div class="row content-top mt-5 h-100">
	<div class="col-12 overflow-auto mt-5">
		<!-- 본문 내용 -->
		<div class="ml-3 mr-3 mt-5">
			<!-- 검색창 -->
			<form action="${pageContext.request.contextPath }/classes/search"  method="post">
				<!-- 검색 분류 -->
				<select name="searchOption" id="searchOption">
					<option value="member_nick">작성자</option>
					<option value="c_title">클래스</option>
				</select>

				<!-- 검색어 -->
				<input type="text" name="keyword" id="keyword">

				<!--검색 버튼 -->
				<input type="submit" value="검색" id="search">
				
				<div>
					<select name="col" class="select-down">
						<option value="c_when_new">최신순</option>
						<option value="c_when_old">등록순</option>
						<option value="c_subscribe">인기순</option>
					</select>
				</div>
			</form>
			
		</div>
	</div>
</div>

<div class="row">
	<c:forEach var="mciDto" items="${MCIDto}">
		<div class="col-sm-12 col-md-6 col-lg-3">
			<div class="card-deck">
				<div class="card">
					<a href="${pageContext.request.contextPath }/classes/readme/${MCIDto.c_no}">
						<c:choose>
							<c:when test="${mciDto.img_no > 0}">
								<img src="${pageContext.request.contextPath }/imgAjax/classes/download/${MCIDto.img_no }" class="card-img" alt="...">
							</c:when>
							<c:otherwise>
								<img src="http://lorempixel.com/400/200/" alt="love" class="card-img">
							</c:otherwise>
						</c:choose>				
					</a>
				<div>
					<div class="row">
						<div class="col-12 d-flex justify-content-end position-absolute p-0 ml-2" style="top: 45%;">
							<a href="${pageContext.request.contextPath }/search/img/setting/${MCIDto.c_no}" onclick="window.open(this.href, '_blank', 'width=305px,height=400px,toolbars=no,scrollbars=no'); return false;">
								<svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-gear" fill="currentColor" xmlns="http://www.w3.org/2000/svg"
									style="width: 30px; height: 30px;">
								  <path fill-rule="evenodd" d="M8.837 1.626c-.246-.835-1.428-.835-1.674 0l-.094.319A1.873 1.873 0 0 1 4.377 3.06l-.292-.16c-.764-.415-1.6.42-1.184 1.185l.159.292a1.873 1.873 0 0 1-1.115 2.692l-.319.094c-.835.246-.835 1.428 0 1.674l.319.094a1.873 1.873 0 0 1 1.115 2.693l-.16.291c-.415.764.42 1.6 1.185 1.184l.292-.159a1.873 1.873 0 0 1 2.692 1.116l.094.318c.246.835 1.428.835 1.674 0l.094-.319a1.873 1.873 0 0 1 2.693-1.115l.291.16c.764.415 1.6-.42 1.184-1.185l-.159-.291a1.873 1.873 0 0 1 1.116-2.693l.318-.094c.835-.246.835-1.428 0-1.674l-.319-.094a1.873 1.873 0 0 1-1.115-2.692l.16-.292c.415-.764-.42-1.6-1.185-1.184l-.291.159A1.873 1.873 0 0 1 8.93 1.945l-.094-.319zm-2.633-.283c.527-1.79 3.065-1.79 3.592 0l.094.319a.873.873 0 0 0 1.255.52l.292-.16c1.64-.892 3.434.901 2.54 2.541l-.159.292a.873.873 0 0 0 .52 1.255l.319.094c1.79.527 1.79 3.065 0 3.592l-.319.094a.873.873 0 0 0-.52 1.255l.16.292c.893 1.64-.902 3.434-2.541 2.54l-.292-.159a.873.873 0 0 0-1.255.52l-.094.319c-.527 1.79-3.065 1.79-3.592 0l-.094-.319a.873.873 0 0 0-1.255-.52l-.292.16c-1.64.893-3.433-.902-2.54-2.541l.159-.292a.873.873 0 0 0-.52-1.255l-.319-.094c-1.79-.527-1.79-3.065 0-3.592l.319-.094a.873.873 0 0 0 .52-1.255l-.16-.292c-.892-1.64.902-3.433 2.541-2.54l.292.159a.873.873 0 0 0 1.255-.52l.094-.319z" />
								  <path fill-rule="evenodd" d="M8 5.754a2.246 2.246 0 1 0 0 4.492 2.246 2.246 0 0 0 0-4.492zM4.754 8a3.246 3.246 0 1 1 6.492 0 3.246 3.246 0 0 1-6.492 0z" />
								</svg>
							</a>
						</div>
					</div>
				</div>
					<div class="card-body pb-0">
						<input type="hidden" class="card-no" value="${MCIDto.c_no }">
						<input type="hidden" class="card-public" value="${MCIDto.c_public }">
						<h5 class="card-title">${MCIDto.c_title}</h5>
						<p class="card-info">${MCIDto.c_info}</p>
						<p class="card-when"> 
							<small class="text-muted"> 
								<fmt:parseDate value="${MCIDto.c_when}" var="time" pattern="yyyy-MM-dd HH:mm:ss" /> 
								<fmt:formatDate value="${time}" pattern="yyyy-MM-dd" />
							</small>
						</p>
						<p>
							<span class="badge badge-pill badge-success">${MCIDto.c_subscribe}</span>						
						</p>	
							<!-- 내 클래스일 때는 수정, 삭제 버튼 / 남의 클래스 일 때는 구독버튼이 보이게 -->
						<p>
						<c:choose>
							<c:when test="${MCIDto.member_no != userinfo.member_no}">
								<span style="margin-left: 80px; padding-top: 20px;" class="card-btn">
									<form action="${pageContext.request.contextPath}/subAjax/subscribe" method="post">
										<input type="hidden" name="c_no" value="${MCIDto.c_no }">
										<input type="button" class="btn btn-primary btn-sm subBtn" value="구독">	
									</form>
								</span>
							</c:when>
							<c:otherwise>
								<span style="margin-left: 80px; padding-top: 20px;" class="card-btn">
									<button type="button" class="btn btn-primary btn-sm editClass" data-target="#classEdit">EDIT</button>
									<a href="${pageContext.request.contextPath}/classes/delete/${c_no}" class="btn btn-warning btn-sm">DELETE</a>
								</span>
							</c:otherwise>
						</c:choose>
						</p>
					</div>
				</div>
			</div>
		</div>
	</c:forEach>
</div>

<script>
	
	$(function(){
		$("#search").click(function(){
			var keyword=$("#keyword").val()
			var searchOption = $("#searchOption").val()
			var list = document.querySelector(".card")
			
		})
	})
	
		
</script>
