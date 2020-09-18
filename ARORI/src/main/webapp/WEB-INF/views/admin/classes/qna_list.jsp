<jsp:include page="/WEB-INF/views/template/admin/main_admin_nav_header.jsp"></jsp:include>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@page contentType="text/html; charset=UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>
<br><br><br>
	<div class="d-flex">
		<h1 class="font-weight-bold mt-4" style="flex:18;">Admin | Q&A List</h1>
	</div>	
	<br>
		<div align="right" style="margin-right: 50px;">
			<a class="btn btn-primary btn-lg font-weight-bold" id="delete">선택삭제</a>
		</div>
	<br>
	<!-- QNA 리스트 -->
	<div class="ml-3 mr-3">
		<table class="table table-hover">
			<thead>
				<tr align="center">
					<th><input type="checkbox"></th>
					<th scope="col" class="font-weight-bold">Qna_No</th>
					<th scope="col" class="font-weight-bold">Classes_No</th>
					<th scope="col" class="font-weight-bold">Title</th>
					<th scope="col" class="font-weight-bold">Content</th>
					<th scope="col" class="font-weight-bold">Writer_No</th>
					<th scope="col" class="font-weight-bold">Date</th>
					<th scope="col" class="font-weight-bold">Ctrl</th>
					
				</tr>
			</thead>
			<tbody>
				<c:forEach var="list" items="${list}">
				<tr>
					<td>
						<input type="checkbox">
					</td>
					<td align="center">${list.qna_no}</td>
					<td align="center">${list.c_no}</td>
					<td>${list.qna_title}</td>
	 				<td>${list.qna_content}</td>
	 				<td align="center">${list.member_no}</td>
	 				<td align="center">${list.qna_when}</td>
	 				<td align="center">
						<a class="text-primary font-weight-bold mr-3" href="#">
							<svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-hammer" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
								<path d="M9.812 1.952a.5.5 0 0 1-.312.89c-1.671 0-2.852.596-3.616 1.185L4.857 5.073V6.21a.5.5 0 0 1-.146.354L3.425 7.853a.5.5 0 0 1-.708 0L.146 5.274a.5.5 0 0 1 0-.706l1.286-1.29a.5.5 0 0 1 .354-.146H2.84C4.505 1.228 6.216.862 7.557 1.04a5.009 5.009 0 0 1 2.077.782l.178.129z"/>
								<path fill-rule="evenodd" d="M6.012 3.5a.5.5 0 0 1 .359.165l9.146 8.646A.5.5 0 0 1 15.5 13L14 14.5a.5.5 0 0 1-.756-.056L4.598 5.297a.5.5 0 0 1 .048-.65l1-1a.5.5 0 0 1 .366-.147z"/>
							</svg>
						</a>
						<a class="text-danger font-weight-bold ml-3" href="#">
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
  				<li class="page-item"><a class="page-link" href="${pageContext.request.contextPath }/admin/qnaList//${block}">${block }</a></li>
				</c:forEach>
				<li class="page-item">
					<a class="page-link" href="${pageContext.request.contextPath }/admin/qnaList/${classes.c_no }/${block[9]+1}" aria-label="Next">
						<span aria-hidden="true">&raquo;</span>
					</a>
				</li>
			</ul>
		</nav>		
		
		
		<div align="center">
		<!-- 검색창 -->
		<form action="">
		<select name="" class="">
					<option value="member_no">회원번호</option>
					<option value="qna_title">게시글 제목</option>
					<option value="qna_content">게시글 내용</option>
				</select>
				<input type="text" placeholder="검색어를 입력하세요">
				<input type="submit" value="찾기">
		</form>
		</div>
	</div>
<br><br><br>

<script>
	var viewers = document.querySelectorAll(".viewer") /* viewer 클래스 생성 */
	var qna_content = document.querySelectorAll(".qna_content") /* String 으로 뭉쳐진 마크다운 코드 받아오기 */

	// Toast Plugin 불러오기 
	const Viewer = toastui.Editor;
	const chartOptions = {
	        minWidth: 100,
	        maxWidth: 600,
	        minHeight: 100,
	        maxHeight: 300
	      };
    const { chart, codeSyntaxHighlight, colorSyntax, tableMergedCell, uml } = Viewer.plugin;
	// viewer 갯수만큼 반복하기 (최대 10개)
	for(var i = 0; i < viewers.length; i++) {
		
	    // Toast Viewer .viewer 만큼 불러오기 
	    const viewer = toastui.Editor.factory({
	        el: viewers[i],
	        viewer: true,
	        height: '1000px',
	        initialValue: qna_content[i].value,
	        initialEditType: 'markdown',
	        plugins: [[chart, chartOptions], codeSyntaxHighlight, tableMergedCell, uml]
	    });
	}
</script>

<jsp:include page="/WEB-INF/views/template/admin/main_admin_nav_footer.jsp"></jsp:include>