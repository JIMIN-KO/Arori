<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<script
	src="https://cdn.jsdelivr.net/npm/jquery@1.12.4/dist/jquery.min.js"></script>
	
<jsp:include page="/WEB-INF/views/template/member/main_member_nav_header.jsp"></jsp:include>
<style>

	/* 전체 카드 */
	.card-deck {
		height: 460px;
		width: 380px;
		padding-bottom: 30px;
		margin-top: 30px;
		margin-left: 17px;
	}
	/* 이미지 사이즈 */
	.card-img {
		height: 200px;
		width: 100%;

	}
	
	/* 클래스 제목 링크 색상 제거 */
	a {
		text-decoration: none;
	}
	
	.btn a {
		text-decoration: none;
		color: #ffffff;
	}
	
	/* 클래스 타이틀 */
	.card-title {
		text-decoration: none;
		color: black;
	}
	
	/* 클래스 정보 */
	.card-info {
		max-height: 4.5em;
		white-space: nowrap;
		overflow: hidden;
		text-overflow: ellipsis;
		display: -webkit-box;
		-webkit-line-clamp: 3;
		-webkit-box-orient: vertical;
		text-decoration: none;
		color: #3e3e3e;
	}
	
	/* 버튼 */
	.card-btn {
		display: inline-block;
	}
	
	/* 클래스 만들기 버튼 */
	.top-btn {
		width: 140px;
		height: 45px;
		font-size: 11px;
		text-transform: uppercase;
		letter-spacing: 2.5px;
		font-weight: 500;
		color: #000;
		background-color: #fff;
		border: none;
		border-radius: 45px;
		box-shadow: 0px 8px 15px rgba(0, 0, 0, 0.1);
		transition: all 0.3s ease 0s;
		cursor: pointer;
		outline: none;
	}
	
	.top-btn:hover {
		background-color: #2EE59D;
		box-shadow: 0px 15px 20px rgba(46, 229, 157, 0.4);
		color: #fff;
		transform: translateY(-7px);
	}

	/* 정렬 드롭다운 */
	.select-down {
		margin-top: 10px;
		width: 100px;
		height: 35px;
		font-size: 15px;
		color: #999;
		border: 2px solid #ddd;
		/*background: url(bg_select.png) no-repeat right 13px center;*/
		appearance: none;
		-webkit-appearance: none;
		text-align-last: center;
	}
	

</style>
<!-- 클래스 목록 -->
<div class="row justify-content-center" style="margin-top: 80px;">
	<div class="offset-4 col-4">
		<a href="${pageContext.request.contextPath}/classes/create"><button
				class="top-btn" style="font-size:14px">클래스 만들기</button></a>
	</div>

	<div class="col-1">
		<form action="${pageContext.request.contextPath }/classes/myclass/${MCIDto.get(0).member_no}" method="get" id="myClassOrder">
			<select name="col" id="colSelector" class="select-down" >
				<option value="c_when">최신순</option>
				<option value="c_when_old">등록순</option>
				<option value="c_subscribe">인기순</option>
			</select>
		</form>	
	</div>
</div>

<div class="row">
	<c:forEach var="MCIDto" items="${MCIDto}">
		<div class="col-sm-12 col-md-6 col-lg-3">
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
				<div>
					<div class="row">
						<div class="col-12 d-flex justify-content-end position-absolute p-0 ml-2" style="top: 45%;">
							<a data-target="#imgEdit" class="imgEdit" data-cno="${MCIDto.c_no }">
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
						
						<span class="h4 title">${MCIDto.c_title}
						</span>
						<span class="badge badge-pill badge-success">${MCIDto.c_subscribe}</span>
						<p class="card-info">${MCIDto.c_info}</p>
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
								<fmt:parseDate value="${MCIDto.c_when}" var="time" pattern="yyyy-MM-dd HH:mm:ss" /> 
								<fmt:formatDate value="${time}" pattern="yyyy-MM-dd" />
							</small>
						</p>					
							<!-- 내 클래스일 때는 수정, 삭제 버튼 / 남의 클래스 일 때는 구독버튼이 보이게 -->
						<c:choose>
							<c:when test="${MCIDto.member_no != userinfo.member_no}">
									<form method="post">
										<span class="card-btn">
											<input type="hidden" name="c_no" id="subC_no" value="${MCIDto.c_no }">
											<input type="button" class="btn btn-primary btn-sm subBtn" value="구독">	
										</span>
									</form>
							</c:when>
							<c:otherwise>
								<div class="card-btn w-100">
									<div class="row mt-3">
										<div class="col-6">
											<button type="button" class="btn btn-primary btn-sm editClass btn-block" data-target="#classEdit" style="font-size:14px">EDIT</button>
										</div>
										<div class="col-6">
											<a href="${pageContext.request.contextPath}/classes/delete/${MCIDto.c_no}" class="btn btn-warning btn-sm btn-block" style="font-size:14px">DELETE</a>
										</div>
									</div>
								</div>
							</c:otherwise>
						</c:choose>
					</div>
				</div>
			</div>
		</div>
	</c:forEach>
</div>
<!-- 클래스 수정 모달 -->

<script>
	$(function() {
		$("#classEdit").modal("hide") // 클래스 수정 모달 숨김
		$("#imgEdit").modal("hide") // 이미지 수정 모달 숨김
		
		$(".editClass").click(
				function() {
					$("#classEdit").modal("show"); // 클래스 수정 모달 띄우기
					var c_no = $(this).parents(".card-body").children(".card-no").val()
					var c_title = $(this).parents(".card-body").children(".title").text()
					var c_info = $(this).parents(".card-body").children(".card-info").text()
					var c_public = $(this).parents(".card-body").children(".card-public").text()

					$("input[name=c_no]").val(c_no)
					$("input[name=c_title]").val(c_title) // 모달에 타이틀 데이터 던지기
					$("input[name=c_info]").val(c_info) // 모달에 인포 데이터 던지기

				})
		// 수정하기 버튼을 누르면 수정이 되도록 한다!
		$("#goEdit").click(function() {
			var form = document.querySelector("#editForm")
			form.submit()

		})
		
		// 이미지 수정 모달 띄우기
		$(".imgEdit").click(function(){
			$("#imgEdit").modal("show"); // 클래스 수정 모달 띄우기
			var c_no = $(this).data("cno")
			$("#imgEditC_no").val(c_no)
		})
		// 이미지 수정하기
		$("#goimgEdit").click(function(){
			var form = document.querySelector("#addImg")
			$(form).submit()
		})
		
		// 구독
		$(".subBtn").click(function(){
			console.log($(this).prev())
			var subDto = {
					member_no:${userinfo.member_no},
					c_no:$(this).parent().prev().val()
			}
			
			console.log(subDto)
			
			axios.post("/arori/subAjax/subscribe", JSON.stringify(subDto), {
			 	headers:{
					'content-type':'application/json',
			 	}
			 }).then(resp=>{
				console.log(resp)
				$(".subBtn").parents(".card-body").children(".subCount").text(resp.data)
				 
		 	})
		})
		
		$("#colSelector").on("change", function(){
			document.querySelector("#myClassOrder").submit()
		})

	})


</script>
<jsp:include page="/WEB-INF/views/template/member/main_member_nav_footer.jsp"></jsp:include>
<div class="modal" id="imgEdit" tabindex="-1" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">클래스 이미지 수정</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<form action="${pageContext.request.contextPath }/classes/img/setting" method="post" enctype="multipart/form-data" id="addImg">
						<input type="hidden" name="c_no" id="imgEditC_no">
						<input type="file" accept=".jpg, .png, .jpeg" name="req">
					</form>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-dismiss="modal">창 닫기</button>
					<button type="button" class="btn btn-primary" id="goimgEdit">수정하기</button>
				</div>
			</div>
		</div>
	</div>
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
						<input type="hidden" name="c_no"> <input type="hidden" name="member_no" value="${userinfo.member_no }"> 
						<div>
							<label for="c_title">Class Title :</label>
							<input type="text" name="c_title" class="modal-content">
						</div>
						<div>
							<label for="c_info">Class Info :</label>
							<input type="text" name="c_info" class="modal-content">
						</div>
						<div>
							<label for="c_public">Public Check :</label>
							<select	name="c_public" class="select">
								<option value=1 >공개</option>
								<option value=0>비공개</option>
							</select>
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

