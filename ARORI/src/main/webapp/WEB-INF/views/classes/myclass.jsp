<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
   <script src="https://cdn.jsdelivr.net/npm/jquery@1.12.4/dist/jquery.min.js"></script>
<jsp:include page="/WEB-INF/views/template/member/main_member_nav_header.jsp"></jsp:include>
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
	border-radius: 10px 60px;
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
	  margin-left:100px;
	  }
	
	.top-btn:hover {
	  background-color: #2EE59D;
	  box-shadow: 0px 15px 20px rgba(46, 229, 157, 0.4);
	  color: #fff;
	  transform: translateY(-7px);
	}
	
	/* 클래스 수정 모달 */
#modal {
display:none;
  position:relative;
  width:100%;
  height:100%;
  z-index:1;
}

#modal h2 {
  margin:0;   
}

#modal button {
  display:inline-block;
  width:100px;
  margin-left:calc(100% - 100px - 10px);
}

#modal .modal_content {
  width:300px;
  margin:100px auto;
  padding:20px 10px;
  background:#fff;
  border:2px solid #666;
}

#modal .modal_layer {
  position:fixed;
  top:0;
  left:0;
  width:100%;
  height:100%;
  background:rgba(0, 0, 0, 0.5);
  z-index:-1;
}   

</style>

<script>

$("#modal_opne_btn").click(function(){
    $("#modal").attr("style", "display:block").fadeIn(300);
});

 $("#modal_close_btn").click(function(){
    $("#modal").attr("style", "display:none").fadeOut(300);
});    
 
</script>

<body>

<%-- <h2>클래스 목록</h2>
<table border="1">
	<thead>
		<tr>
			<th>클래스 번호</th>
			<th>이름</th>
			<th>정보</th>
			<th>공개여부</th>
			<th>등록일</th>
		</tr>
	</thead>
	<tbody>
		<c:forEach var="classesDto" items="${list}">
			<tr>
				<td>${classesDto.c_no}</td>
				<td>
					<a href="${pageContext.request.contextPath}/classes/readme/${classesDto.c_no}">
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
				<c:if test="${userinfo.member_no==classesDto.member_no}">
				<td>
					<a href="edit/${classesDto.c_no}">수정</a> 
					<a href="delete/${classesDto.c_no}">삭제</a>
				</td>
				</c:if>
			</tr>
		</c:forEach>
	</tbody>
</table> --%>

<div class="container-fluid">
	<div class="row justify-content-center" style="margin-top:80px;">
		<div class="offset-3 col-6" >
		<a href="${pageContext.request.contextPath}/classes/create"><button class="top-btn">클래스 만들기</button></a>
		</div>
	</div>
	
	<div class="row">
	<c:forEach var="classesDto" items="${list}">
		<div class="col-3">
			<div class="card-deck">
			<a href="${pageContext.request.contextPath}/classes/readme/${classesDto.c_no}">
  				<div class="card">
    				<img src="https://lh3.googleusercontent.com/proxy/krOnAmoaj9mpoKRwej4_B9pmiFxVtFiJrrxWgvFNL_7nwDmztB9McDMvQubDGin05J4Mf282hR-67Fe5Ur2b2VNomNKQzu51LMJYucMxQ15WcB7HJflVwKrfS6s" class="card-img" alt="...">
   						 <div class="card-body">
      						<h5 class="card-title">${classesDto.c_title}</h5>
      						<p class="card-info">${classesDto.c_info}</p>
      						<p class="card-when"><small class="text-muted">
      							<fmt:parseDate value="${classesDto.c_when}" 
									var="time" pattern="yyyy-MM-dd HH:mm:ss"/>
								<fmt:formatDate value="${time}" pattern="yyyy-MM-dd"/>	</small></p>
								<span class="badge badge-pill badge-success">${classesDto.c_public}</span>
							<P style="margin-left:80px; padding-top:20px;" class="card-btn">
							<button type="button" class="btn btn-primary btn-sm" id="modal_opne_btn">EDIT</button>
							<button type="button" class="btn btn-warning btn-sm"><a href="${pageContext.request.contextPath}/classes/delete/${classesDto.c_no}">DELETE</a></button>
							</P>
  						</div>
  				</div>
   			</a>
 			</div>
		</div>
	</c:forEach>
	</div>
</div>

<!-- 클래스 수정 모달 -->

<div id="modal">
   
    <div class="modal_content">
        <h2>모달 창</h2>
       
        <p>모달 창 입니다.</p>
       
        <button type="button" id="modal_close_btn">모달 창 닫기</button>
       
    </div>
   
    <div class="modal_layer"></div>
</div>


</body>
<jsp:include page="/WEB-INF/views/template/member/main_member_nav_footer.jsp"></jsp:include>

