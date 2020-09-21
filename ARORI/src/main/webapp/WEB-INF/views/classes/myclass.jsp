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
		padding-bottom: 40px;
		margin-top: 35px;
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
		appearance: none;
		-webkit-appearance: none;
		text-align-last: center;
	}
	
	/* 정보 수정 모달 중 public 수정 */
</style><!-- 클래스 목록 -->
<div class="row" style="margin-top: 80px;">
	<div class="col-4 w-100">
		
	</div>
	<div class="col-4 d-flex justify-content-center">
		<c:if test="${userinfo.member_no eq member_no }">
				<button class="top-btn mr-lg-5 createClass" style="font-size:14px">클래스 만들기</button>
		</c:if>
	</div>
	<div class="col-4 w-100 d-flex justify-content-end">
		<form action="${pageContext.request.contextPath }/classes/myclass/${member_no}" method="get" id="myClassOrder">
			<select name="col" id="colSelector" class="select-down" >
				<option value="c_when">최신순</option>
				<option value="c_when_old">등록순</option>
				<option value="c_subscribe">인기순</option>
			</select>
		</form>	
	</div>
</div>

<div class="row w-100 m-0">
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
					<div class="row">
						<div class="col-12 d-flex justify-content-end position-absolute p-0 ml-2" style="top: 45%;">
							<a data-target="#imgEdit" class="imgEdit" data-cno="${MCIDto.c_no }">
								<svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-gear-fill" fill="currentColor" xmlns="http://www.w3.org/2000/svg" style="width:30px; height:30px;">
								  <path fill-rule="evenodd" d="M9.405 1.05c-.413-1.4-2.397-1.4-2.81 0l-.1.34a1.464 1.464 0 0 1-2.105.872l-.31-.17c-1.283-.698-2.686.705-1.987 1.987l.169.311c.446.82.023 1.841-.872 2.105l-.34.1c-1.4.413-1.4 2.397 0 2.81l.34.1a1.464 1.464 0 0 1 .872 2.105l-.17.31c-.698 1.283.705 2.686 1.987 1.987l.311-.169a1.464 1.464 0 0 1 2.105.872l.1.34c.413 1.4 2.397 1.4 2.81 0l.1-.34a1.464 1.464 0 0 1 2.105-.872l.31.17c1.283.698 2.686-.705 1.987-1.987l-.169-.311a1.464 1.464 0 0 1 .872-2.105l.34-.1c1.4-.413 1.4-2.397 0-2.81l-.34-.1a1.464 1.464 0 0 1-.872-2.105l.17-.31c.698-1.283-.705-2.686-1.987-1.987l-.311.169a1.464 1.464 0 0 1-2.105-.872l-.1-.34zM8 10.93a2.929 2.929 0 1 0 0-5.86 2.929 2.929 0 0 0 0 5.858z"/>
								</svg>
							</a>
						</div>
					</div>
					<div class="card-body pb-0">
						<input type="hidden" class="card-no" value="${MCIDto.c_no }">						
						<span class="h4 title font-weight-bold">${MCIDto.c_title}</span>
						<span class="badge badge-pill badge-success ml-2 mb-1 h4" >
							${MCIDto.c_subscribe}
						</span>
						<hr>
						<p class="card-info mt-4">${MCIDto.c_info}</p>
						<p class="card-nick mb-0 font-weight-bold">
							<c:choose>
      							<c:when test="${MCIDto.member_nick eq 'null'}">
      								소셜 회원
      							</c:when>
      							<c:otherwise>
			      					${MCIDto.member_nick}  										
      							</c:otherwise>
      						</c:choose>
						</p>
						<p class="card-when mb-0"> 
							<small class="text-muted"> 
								<fmt:parseDate value="${MCIDto.c_when}" var="time" pattern="yyyy-MM-dd HH:mm:ss" /> 
								<fmt:formatDate value="${time}" pattern="yyyy-MM-dd" />
							</small>
						</p>
						<c:choose>
							<c:when test="${userinfo.member_no == MCIDto.member_no or userinfo.member_auth == 1 }">
								<div class="card-btn w-100">
									<div class="row mt-3 mb-3">
										<div class="col-6">
											<button type="button" class="btn btn-primary btn-sm editClass btn-block" data-target="#classEdit" style="font-size:14px">EDIT</button>
										</div>
										<div class="col-6">
											<a href="${pageContext.request.contextPath}/classes/delete/${MCIDto.c_no}" class="btn btn-warning btn-sm btn-block" style="font-size:14px">DELETE</a>
										</div>
									</div>
								</div>							
							</c:when>																				
						</c:choose>
					</div>
				</div>
			</div>
		</div>
	</c:forEach>
</div>

<script>
<!-- 정렬 값 고정시키기 -->	
$(function(){
	var param = location.search
	if(param) {
		var last = param.indexOf("=") + 1
		var keyword = param.substring(last)
		$("#colSelector").val(keyword).prop("selected", true)
	}
})
$(function() {
	$("#createClass").modal("hide")// 클래스 생성 모달 숨김
	$("#classEdit").modal("hide") // 클래스 수정 모달 숨김
	$("#imgEdit").modal("hide") // 이미지 수정 모달 숨김
	
	$(".createClass").click(function(){
		$("#createClass").modal("show")// 클래스 생성 모달 띄우기
	})
	
	$(".editClass").click(
			function() {
				$("#classEdit").modal("show"); // 클래스 수정 모달 띄우기
				var c_no = $(this).parents(".card-body").children(".card-no").val()
				var c_title = $(this).parents(".card-body").children(".title").text()
				var c_info = $(this).parents(".card-body").children(".card-info").text()
	
				$("#c_no").val(c_no)
				$("#c_title").val(c_title) // 모달에 타이틀 데이터 던지기
				$("#c_info").val(c_info) // 모달에 인포 데이터 던지기		
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
		var file = document.querySelector("input[name=req]")
		
		if(file.value) {
			$(form).submit()
		} else {
			alert("현재 이미지가 없거나 등록할 수 없습니다. 다시 확인해주세요.")
		}
	})
	
	// 구독
	$(".subBtn").click(function(){
		var subDto = {
				member_no:${userinfo.member_no},
				c_no:$(this).parent().prev().val()
		}
		
		axios.post("/arori/subAjax/subscribe", JSON.stringify(subDto), {
		 	headers:{
				'content-type':'application/json',
		 	}
		 }).then(resp=>{
			$(".subBtn").parents(".card-body").children(".subCount").text(resp.data)			 
	 	})
	})
	
	$("#colSelector").on("change", function(){
		document.querySelector("#myClassOrder").submit()
	})
})
</script>
<jsp:include page="/WEB-INF/views/template/member/main_member_nav_footer.jsp"></jsp:include>
<!-- 클래스 생성 모달 -->
<div class="modal fade" id="createClass" tabindex="-1" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">클래스 생성</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
					<form action="${pageContext.request.contextPath }/classes/create" method="post">
					<div class="modal-body">
					  <div class="form-group">
					  <input type="hidden" name="member_no" value="${userinfo.member_no }">
					    <label for="c_title" class="h5 font-weight-bold">Class Title</label>
					    <input type="text" class="form-control"  name="c_title">
					    <small id="emailHelp" class="form-text text-muted">클래스 이름은 20자 이내로 작성해주세요.</small>
					  </div>
					  <div class="form-group">
					    <label for="c_info" class="h5 font-weight-bold">Class Info</label>
					    <textarea class="form-control" name="c_info"></textarea>
					        <small id="emailHelp" class="form-text text-muted">클래스 정보는 한 줄로 간략하게 작성해주세요.</small>
					  </div>
				</div>
					<div class="modal-footer">
						 <button type="submit" class="btn btn-warning btn-lg font-weight-bold">생성하기</button>
						<button type="button" class="btn btn-primary btn-lg font-weight-bold" data-dismiss="modal">창 닫기</button>
					</div>
				</form>
			</div>
		</div>
</div>

<!-- 이미지 수정 모달 -->
<div class="modal fade" id="imgEdit" tabindex="-1" aria-hidden="true">
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
					<button type="button" class="btn btn-warning btn-lg font-weight-bold" id="goimgEdit">수정하기</button>
					<button type="button" class="btn btn-primary btn-lg font-weight-bold" data-dismiss="modal">창 닫기</button>
				</div>
			</div>
		</div>
</div>
	
<!-- 클래스 수정 모달 -->
<div class="modal fade" id="classEdit" tabindex="-1" aria-hidden="true">
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
						<input type="hidden" name="c_no" id="c_no">
						<input type="hidden" name="member_no" value="${userinfo.member_no }"> 
						<div class="form-group">
						    <label for="c_title" class="h5 font-weight-bold">Class Title</label>
						    <input type="text" class="form-control edit-title" id="c_title"  name="c_title">
						    <small id="emailHelp" class="form-text text-muted">클래스 이름은 20자 이내로 작성해주세요.</small>
						  </div>
						  <div class="form-group">
						    <label for="c_info" class="h5 font-weight-bold">Class Info</label>
						    <textarea id="c_info" class="form-control edit-info" name="c_info"></textarea>
						        <small id="emailHelp" class="form-text text-muted">클래스 정보는 한 줄로 간략하게 작성해주세요.</small>
						  </div>			
					</form>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-warning btn-lg font-weight-bold" id="goEdit">수정하기</button>
					<button type="button" class="btn btn-primary btn-lg font-weight-bold" data-dismiss="modal">창 닫기</button>
				</div>
			</div>
		</div>
	</div>