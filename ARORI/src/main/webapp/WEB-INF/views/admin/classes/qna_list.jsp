<%@page contentType="text/html; charset=UTF-8"%>
<jsp:include page="/WEB-INF/views/template/admin/main_admin_nav_header.jsp"></jsp:include>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<br><br>
	<div class="d-flex">
		<h1 class="font-weight-bold mt-4" style="flex:18;">Admin | Q&A List</h1>
	</div>	
	<br>
<!-- 		<div style="margin-right: 50px; text-align: right;"> -->
<!-- 			<a class="btn btn-primary btn-lg font-weight-bold" id="delete">선택삭제</a> -->
<!-- 		</div> -->
	<br>
	<!-- QNA 리스트 -->
	<div class="ml-5 mr-5 pr-5 pl-5">
		<table class="table table-hover">
			<thead>
				<tr  style="text-align: center;">
<!-- 					<th><input type="checkbox" id="check-all"></th> -->
					<th scope="col" class="font-weight-bold">Qna_No</th>
					<th scope="col" class="font-weight-bold">Classes_No</th>
					<th scope="col" class="font-weight-bold">Nickname</th>
					<th scope="col" class="font-weight-bold">Title</th>
					<th scope="col" class="font-weight-bold">Content</th>
					<th scope="col" class="font-weight-bold">Date</th>
					<th scope="col" class="font-weight-bold">Ctrl</th>
					
				</tr>
			</thead>
			<tbody>
				<c:forEach var="list" items="${list}">
				<tr>
<!-- 					<td> -->
<!-- 						<input type="checkbox" class="check-item" name="check-item"> -->
<!-- 					</td> -->
					<td style="text-align: center;">${list.qna_no}</td>
					<td style="text-align: center;">${list.c_no}</td>
					<td style="text-align: center;">${list.member_nick}</td>
					<td>${list.qna_title}</td>
	 				<td>${list.qna_content}</td>
	 				<td style="text-align: center;">${list.qna_when}</td>
	 				<td style="text-align: center;">
	 					<!-- 수정 아이콘 -->
						<a class="text-primary font-weight-bold mr-3" href="${pageContext.request.contextPath }/admin/qnaEditAdmin/${list.c_no}/${list.qna_no}">
							<svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-hammer" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
								<path d="M9.812 1.952a.5.5 0 0 1-.312.89c-1.671 0-2.852.596-3.616 1.185L4.857 5.073V6.21a.5.5 0 0 1-.146.354L3.425 7.853a.5.5 0 0 1-.708 0L.146 5.274a.5.5 0 0 1 0-.706l1.286-1.29a.5.5 0 0 1 .354-.146H2.84C4.505 1.228 6.216.862 7.557 1.04a5.009 5.009 0 0 1 2.077.782l.178.129z"/>
								<path fill-rule="evenodd" d="M6.012 3.5a.5.5 0 0 1 .359.165l9.146 8.646A.5.5 0 0 1 15.5 13L14 14.5a.5.5 0 0 1-.756-.056L4.598 5.297a.5.5 0 0 1 .048-.65l1-1a.5.5 0 0 1 .366-.147z"/>
							</svg>
						</a>
						<!-- 삭제 아이콘 -->
						<a class="text-danger font-weight-bold ml-3 deleteQna" data-cno="${list.c_no }" data-qnano="${list.qna_no }" data-target="#deleteQna">
							<svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-trash-fill" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
								<path fill-rule="evenodd" d="M2.5 1a1 1 0 0 0-1 1v1a1 1 0 0 0 1 1H3v9a2 2 0 0 0 2 2h6a2 2 0 0 0 2-2V4h.5a1 1 0 0 0 1-1V2a1 1 0 0 0-1-1H10a1 1 0 0 0-1-1H7a1 1 0 0 0-1 1H2.5zm3 4a.5.5 0 0 1 .5.5v7a.5.5 0 0 1-1 0v-7a.5.5 0 0 1 .5-.5zM8 5a.5.5 0 0 1 .5.5v7a.5.5 0 0 1-1 0v-7A.5.5 0 0 1 8 5zm3 .5a.5.5 0 0 0-1 0v7a.5.5 0 0 0 1 0v-7z"/>
							</svg>
						</a>	 					
	 				</td>
	 			</tr>
				</c:forEach>
			</tbody>
		</table>
		
		<nav aria-label="Page navigation example">
			<ul class="pagination justify-content-center">
				<li class="page-item">
					<a class="page-link" href="${pageContext.request.contextPath }/admin/qnaList/${block[0] - 1}" aria-label="Previous">
						<span aria-hidden="true">&laquo;</span>
					</a>
				</li>
				<c:forEach var="block" items="${block }">
  				<li class="page-item"><a class="page-link" href="${pageContext.request.contextPath }/admin/qnaList/${block}">${block }</a></li>
				</c:forEach>
				<li class="page-item">
					<a class="page-link" href="${pageContext.request.contextPath }/admin/qnaList/${block[9]+1}" aria-label="Next">
						<span aria-hidden="true">&raquo;</span>
					</a>
				</li>
			</ul>
		</nav>		
		
		
		<div style="text-align: center;">
		<!-- 검색창 -->
		<form action="unionQna" method="post">
		<select name="type">
					<option value="member_nick">닉네임</option>
					<option value="qna_title">게시글 제목</option>
					<option value="qna_content">게시글 내용</option>
				</select>
				<input type="text" name="keyword" placeholder="검색어를 입력하세요">
				<input type="submit" value="찾기">
		</form>
		</div>
	</div>
<br><br><br>

<script>
$(function(){
	console.log("hello")
	
	$("#deleteQna").modal("hide")
	
	$(".deleteQna").click(function(){
		var c_no = $(this).data("cno")
		var qna_no = $(this).data("qnano")
		var path = "${pageContext.request.contextPath }/admin/qnaDeleteAdmin/" + c_no + "/" + qna_no
		$(".deleteBtn").attr("href",path)
		$("#deleteQna").modal("show")
	})
})
</script>
<jsp:include page="/WEB-INF/views/template/admin/main_admin_nav_footer.jsp"></jsp:include>
						<div class="modal fade" id="deleteQna" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
						  <div class="modal-dialog">
						    <div class="modal-content">
						      <div class="modal-header">
						        <h5 class="modal-title" id="exampleModalLabel">Q & A 삭제</h5>
						        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
						          <span aria-hidden="true">&times;</span>
						        </button>
						      </div>
						      <div class="modal-body">
						       	해당 게시글을 삭제하시겠습니까?
						      </div>
						      <div class="modal-footer">
						        <button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>
						        <a type="button" class="btn btn-primary deleteBtn">삭제하기</a>
						      </div>
						    </div>
						  </div>
						</div>