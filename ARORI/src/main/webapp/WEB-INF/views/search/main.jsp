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

			</div>
			<div class="col-1">
				<select name="col" class="dropdown">
					<option>최신순</option>
					<option>등록순</option>
					<option>인기순</option>
				</select>
			</div>

			<div id="list" class="row w-100">
			<!-- 	<table class="w-100">
					<thead>
						<tr>
							<th>클래스 번호</th>
							<th>클래스 이름</th>
							<th>닉네임</th>
							<th>클래스 정보</th>
							<th>등록일</th>
						</tr>
					</thead>
					<tbody class="tbody">

					</tbody>
				</table> -->
				
				<div class="col-sm-12 col-md-6 col-lg-3">
			<div class="card-deck">
  				<div class="card">
					<a href="${pageContext.request.contextPath}/classes/readme/${mcDto.c_no}">
    				<img src="https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcRqZj1VAYabe1m4rawPTgoeQWECgoD8RJmRDQ&usqp=CAU" class="card-img" alt="...">
   					</a>
   						 <div class="card-body">
      						<h5 class="card-title">${mcDto.c_title}</h5>
      						<p class="card-info">${mcDto.c_info}</p>
      						<p class="card-nick">${mcDto.member_nick}</p>
      						<p class="card-when"><small class="text-muted">
      							<fmt:parseDate value="${mcDto.c_when}" 
									var="time" pattern="yyyy-MM-dd HH:mm:ss"/>
								<fmt:formatDate value="${time}" pattern="yyyy-MM-dd"/>	</small></p>
								<span class="badge badge-pill badge-success">${mcDto.c_subscribe}</span>
							<P style="margin-left:80px; padding-top:20px;" class="card-btn">
							<button type="button" class="btn btn-primary btn-sm" id="modal_opne_btn">EDIT</button>
							<button type="button" class="btn btn-warning btn-sm"><a href="${pageContext.request.contextPath}/classes/delete/${mcDto.c_no}">DELETE</a></button>
							</P>
  						</div>	
  				</div>
 			</div>
				
			</div>
		</div>
	</div>
	<script>
		$(function() {
			/* var keyword = document.querySelector("#searchOption")
			var searchOption = document.querySelector("#keyword")
			
			$("#searchOption").on("change",function(){
				console.log($("#searchOption").val())
			})
			
			$("#keyword").on("input",function(){
				console.log($("#keyword").val())
			}) */

			$("#search")
					.click(
							function() {
								var keyword = $("#keyword").val()
								var searchOption = $("#searchOption").val()
								var list = document.querySelector(".card")
								list.textContent = ""

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

														var tr = document.createElement(".card-body")
														tr.classList.add("class_list"+ i)
														list.appendChild(tr)
														var class_list = document.querySelector(".class_list"+ i)


														var title = document.createElement(".card-title")
														var nick = document.createElement(".card-nick")
														var info = document.createElement(".card-info")
														var when = document.createElement(".card-when")

														title.textContent = resp.data[i].c_title
														nick.textContent = resp.data[i].member_nick
														info.textContent = resp.data[i].c_info
														when.textContent = resp.data[i].c_when

														class_list.appendChild(no)
														class_list.appendChild(title)
														class_list.appendChild(nick)
														class_list.appendChild(info)
														class_list.appendChild(when)
													}
												})
							})
		})
	</script>

	
	<jsp:include
		page="/WEB-INF/views/template/member/main_member_nav_footer.jsp"></jsp:include>