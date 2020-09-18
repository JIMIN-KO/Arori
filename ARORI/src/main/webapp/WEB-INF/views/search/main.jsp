<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:choose>
	<c:when test="${userinfo.member_auth eq 1 }">
		<jsp:include page="/WEB-INF/views/template/admin/main_admin_nav_header.jsp"></jsp:include>	
	</c:when>
	<c:otherwise>
		<jsp:include page="/WEB-INF/views/template/member/main_member_nav_header.jsp"></jsp:include>
	</c:otherwise>
</c:choose>	
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
	height: 200px;
	width: 100%;
	}
	
	/* 드롭다운 */
	#searchOption, .select-down{
		margin-top: 10px;
		width: 100px;
		height: 35px;
		font-size: 15px;
		color: #999;
		border: 2px solid #ddd;
		appearance: none;
		-webkit-appearance: none;
		text-align-last: center;
	}
	 #keyword {
		margin-top: 10px;
		width: 200px;
		height: 35px;
		font-size: 15px;
		color: #999;
		border: 2px solid #ddd;
		appearance: none;
		-webkit-appearance: none;
		text-align-last: center;
	 }
	/* 버튼 */
	#search {
		width:70px;
		height: 35px;
	   background-color: #F5C159;
		border: 2px solid #F5C159;
		color: #fff;
	}
	
	/* 검색 아웃라인 지우기 */
	#searchOption:focus {
	outline: none;
	}
	#keyword:focus {
	outline:none;
	}
	
	.select-down {
	outline: none;
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
	.title {
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
	
	/* 카드 버튼 */
	.btn {
	display:inline-block;
	font-size:15px;
	margin-bottom:0px;
	margin-top:0px;
	}
	.card-btn {
	text-align:center;
	}
	
	/* 수정 버튼 */
	.editClass {
	width: 120px;
    left: 40px;
    bottom: 15px;
	}
	
	/* 삭제버튼 */
	.delete {
	width: 120px;
    bottom: 15px;
	}
	
</style>
<div class="row content-top mt-5 h-100">
	<div class="col-12 overflow-auto">
		<!-- 본문 내용 -->
		<div class="ml-3 mr-3 mt-5">
			<!-- 검색창 -->
			<div class="row searchBox">
				<div class="col-12" style="text-align:center">
					<!-- 검색 분류 -->
					<select name="searchOption" id="searchOption">
						<option value="member_nick">작성자</option>
						<option value="c_title">클래스</option>
					</select>
	
					<!-- 검색어 -->
					<input type="text" name="keyword" id="keyword">
	
					<!--검색 버튼 -->
					
					<input type="button" value="Search" id="search" > 
	
					<select name="col"  id="colSelector" class="select-down">
						<option value="c_when">최신순</option>
						<option value="c_when_old">등록순</option>
						<option value="c_subscribe">인기순</option>
					</select>
				</div>
			</div>
			
			<!--  클론 시작 -->
				<div class="col-sm-12 col-md-6 col-lg-3 cardList p-0" style="display: none;">
						<div class="card-deck">
  							<div class="card">
  								<a>
									<img class="card-img" alt="...">		
								</a>
   								<div class="card-body pb-0">
   									<input type="hidden" class="card-no">
      								<div class="title h5">
      									<span class="card-title" style="font-size: 21px;!important"></span>
      									<span class="badge badge-pill badge-success ml-2 mb-1"></span>
      								</div>
      								<p class="card-info"></p>
      								<p class="card-nick">
      									
      								</p>
      								<p class="card-when">
	      								<small class="text-muted">
		      								
										</small>
									</p>
  								</div>	
  									<div class="row mt-3">
										<div class="col-6">
											<button type="button" class="btn btn-primary btn-sm editClass btn-block" data-target="#classEdit" style="font-size:14px">EDIT</button>
										</div>
										<div class="col-6">
											<a class="btn btn-warning btn-sm btn-block delete" style="font-size:14px">DELETE</a>
										</div>
									</div>
  									<form method="post" class="d-flex justify-content-center">
										<span class="card-btn">
											<input type="hidden" name="c_no" class="subC_no">
											<input type="button" class="btn btn-primary btn-md subBtn" value="구독" style="font-size:14px">	
										</span>
									</form>						
  								</div>
 							</div>
						</div>
					<!--  여기까지 클론 -->
					
			<div class="row classCard">
				<c:forEach var="MCIDto" items="${MCIDto}">
					<div class="col-sm-12 col-md-6 col-lg-3 cardList p-0">
						<div class="card-deck">
  							<div class="card">
  								<a href="${pageContext.request.contextPath }/classes/readme/${MCIDto.c_no}">
									<c:choose>
										<c:when test="${MCIDto.ai_no > 0}">
											<img src="${pageContext.request.contextPath }/imgAjax/classes/download/${MCIDto.ai_no }" class="card-img" alt="...">
										</c:when>
										<c:otherwise>
											<img src="${pageContext.request.contextPath }/imgAjax/classes/download/57" class="card-img">
										</c:otherwise>
									</c:choose>				
								</a>
   								<div class="card-body pb-0">
   									<input type="hidden" value="${MCIDto.c_no}" class="card-no">
	      							<div class="title h4">
	      								<span style="font-size: 21px;!important" class="card-title" >${MCIDto.c_title}</span>
	      								<span class="badge badge-pill badge-success ml-2 mb-1">${MCIDto.c_subscribe }</span>
	      							</div>
	      							<p class="card-info" >${MCIDto.c_info}</p>
	      							<p class="card-nick">
	      								<c:choose>
	      									<c:when test="${MCIDto.member_nick eq 'null'}">
	      										소셜 회원
	      									</c:when>
	      									<c:otherwise>
				      							${MCIDto.member_nick}  										
	      									</c:otherwise>
	      								</c:choose>
	      							</p>
	      							<p class="card-when">
		      							<small class="text-muted">
			      							<fmt:parseDate value="${MCIDto.c_when}" var="time" pattern="yyyy-MM-dd HH:mm:ss"/>
											<fmt:formatDate value="${time}" pattern="yyyy-MM-dd"/>
										</small>
									</p>
  								</div>	
								<c:choose>						
									<c:when test="${userinfo.member_auth eq 1 }">
										<div class="row mt-3">
											<div class="col-6">
												<button type="button" class="btn btn-primary btn-sm editClass btn-block" data-target="#classEdit" style="font-size:14px">EDIT</button>
											</div>
											<div class="col-6">
												<a href="${pageContext.request.contextPath}/classes/delete/${MCIDto.c_no}" class="btn btn-warning btn-sm btn-block delete" style="font-size:14px">DELETE</a>
											</div>
										</div>										
									</c:when>					
									<c:when test="${MCIDto.member_no != userinfo.member_no}">
											<form method="post" class="d-flex justify-content-center mb-3">
												<span class="card-btn">
													<input type="hidden" name="c_no" class="subC_no" value="${MCIDto.c_no }">
													<input type="button" class="btn btn-primary btn-md subBtn" value="구독" style="font-size:14px">	
												</span>
											</form>
									</c:when>
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
		
		$(document).on("click",".subBtn",function(){
			console.log("hello")
			var subDto = {
					member_no:${userinfo.member_no},
					c_no:$(this).parents(".card-btn").children("input[name=c_no]").val()
			}

			var path = $(this).parents(".card").children(".card-body").children(".title").children(".badge")
			
			axios.post("/arori/subAjax/subscribe", JSON.stringify(subDto), {
			 	headers:{
					'content-type':'application/json',
			 	}
			 }).then(function(resp){

				 $(path).text(resp.data)
				 
		 	})
		})
		
		var backup = $(".cardList").first().clone()
		$("#search").click(function() {
			searchClass(backup)
		})
		
		$(".select-down").on("change",function(){
			console.log("hello")
			searchClass(backup)
		})
		
	})
	
	function searchClass(backup) {
		var keyword = $("#keyword").val()
		var searchOption = $("#searchOption").val()
		var select = $(".select-down").val()
		var list = document.querySelector(".card")
		axios({
			url : '${pageContext.request.contextPath}/searchAjax/search?keyword=' + keyword + '&searchOption=' + searchOption + "&col=" + select,
			method : 'get'
		}).then(function(resp) {
			console.log(resp)
			// 기존에 있던 카드 삭제
			document.querySelector(".classCard").innerHTML = "";
			
			// 검색된 데이터만큼 카드 생성
			for (var i = 0; i < resp.data.length; i++) {
				var clone = backup.clone() // 클론을 검색된 데이터 길이만큼 복제
				$(clone).css("display","block") // 복제한 데이터 디스플레이 block
				
				// 검색된 클래스 만큼 반복 및 카드 생성
				$(".classCard").append(clone)
				
				addCard(resp, i)				
			}
		})
	}
	
	function addCard(resp, i) {
		var cardList = document.querySelectorAll(".cardList")
		
		// 이미지
		var img = $(cardList[i+1]).children(".card-deck").children(".card").children("a").children("img")
		var path = "/arori/imgAjax/classes/download/" + resp.data[i].ai_no
		
		if(resp.data[i].ai_no == 0) {
			path = "/arori/imgAjax/classes/download/57"
		}
		
		$(img).attr("src",path)
		
		// classesURL
		var classesURL = $(cardList[i+1]).children(".card-deck").children(".card").children("a")
		var imgPath = "${pageContext.request.contextPath }/classes/readme/" + resp.data[i].c_no
		$(classesURL).attr("href",imgPath)
		
		// c_no
		var c_no = $(cardList[i+1]).children(".card-deck").children(".card").children(".card-body").children(".card-no")
		$(c_no).val(resp.data[i].c_no)
		
		// title
		var title = $(cardList[i+1]).children(".card-deck").children(".card").children(".card-body").children(".title").children(".card-title")
		$(title).text(resp.data[i].c_title)
		
		// subscribe
		var sub = $(cardList[i+1]).children(".card-deck").children(".card").children(".card-body").children(".title").children(".badge")
		$(sub).text(resp.data[i].c_subscribe)
		
		// info
		var info = $(cardList[i+1]).children(".card-deck").children(".card").children(".card-body").children(".card-info")
		$(info).text(resp.data[i].c_info)
	
		// nick
		var nick = $(cardList[i+1]).children(".card-deck").children(".card").children(".card-body").children(".card-nick")
		$(nick).text(resp.data[i].member_nick)
		
		// when
		var when = $(cardList[i+1]).children(".card-deck").children(".card").children(".card-body").children(".card-when")
		var c_when = resp.data[i].c_when.substring(0,10)
		$(when).text(c_when)
		
		// 구독 button
		var subbuttonVal = $(cardList[i+1]).children(".card-deck").children(".card").children("form").children(".card-btn").children(".subC_no")
		var subbutton = $(cardList[i+1]).children(".card-deck").children(".card").children("form").children(".card-btn").children("span").children(".subBtn")
		var member_no = ${userinfo.member_no}
		$(subbutton).css("display","none")
		if((member_no != resp.data[i].member_no) && (${userinfo.member_auth == 0})) {
			$(subbutton).css("display","block")
			$(subbuttonVal).val(resp.data[i].c_no)
      	}
		
		// 수정 삭제 button
		var editbutton = $(cardList[i+1]).children(".card-deck").children(".card").children(".row").children(".col-6").children(".editClass")
		var deletebutton = $(cardList[i+1]).children(".card-deck").children(".card").children(".row").children(".col-6").children(".delete")
		if(${userinfo.member_auth == 0}) {
			$(editbutton).css("dispaly","none")
			$(deletebutton).css("dispaly","none")
		}
	}
	
	$(function() {
		$("#classEdit").modal("hide") // 클래스 수정 모달 숨김
		$(document).on("click",".editClass", function(){
			$("#classEdit").modal("show"); // 클래스 수정 모달 띄우기
			var c_no = $(this).parents(".card").children(".card-body").children(".card-no").val()
			var c_title = $(this).parents(".card").children(".card-body").children(".title").children(".card-title").text()
			var c_info = $(this).parents(".card").children(".card-body").children(".card-info").text()

			console.log(c_title)
			console.log(c_no)
			$("input[name=c_no]").val(c_no)
			$("input[name=c_title]").val(c_title) // 모달에 타이틀 데이터 던지기
			$("input[name=c_info]").val(c_info) // 모달에 인포 데이터 던지기	
		})
		
		// 수정하기 버튼을 누르면 수정이 되도록 한다!
		$("#goEdit").click(function() {
			var form = document.querySelector("#editForm")
			form.submit()
		})
	
	})
	
</script>

	<jsp:include page="/WEB-INF/views/template/member/main_member_nav_footer.jsp"></jsp:include>
	
<!-- 클래스 수정 모달 -->
<div class="modal" id="classEdit" tabindex="-1" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="exampleModalLabel">클래스 수정</h5>
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<div class="modal-body">
				<form action="${pageContext.request.contextPath }/classes/edit" method="post" id="editForm">
					<input type="hidden" name="c_no"> 
					<input type="hidden" name="member_no" value="${userinfo.member_no }"> 
					<div>
						<label for="c_title">Class Title</label>
						<input type="text" name="c_title" class="modal-content">
					</div>
					<div style="margin-top:10px;">
						<label for="c_info">Class Information</label>
						<input type="text" name="c_info" class="modal-content">
					</div>
				

				</form>
			</div>				
				
			<div class="modal-footer">
				<button type="button" class="btn btn-secondary"
					data-dismiss="modal">창 닫기</button>
				<button type="button" class="btn btn-primary" id="goEdit">수정하기</button>
			</div>
		</div>
	</div>
</div>