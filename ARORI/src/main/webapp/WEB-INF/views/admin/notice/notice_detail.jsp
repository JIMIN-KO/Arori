<jsp:include
	page="/WEB-INF/views/template/admin/main_admin_nav_header.jsp"></jsp:include>
<%@page contentType="text/html; charset=UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div class="row mt-5">
	<div class="col-8 offset-2">
			<h1 class="font-weight-bold mt-4"> NOTICE 상세정보</h1> <br>
			<table class="table table-hover">
				<thead>
				<tr>
					</tr>
				</thead>
				<tbody>
					<tr>					
					</tr>
					<tr>
						<th scope="col">CLASS.No</th>
						<td><input type="text" class="form-control"
							value="${noticeDto.c_no}" readonly="readonly"></td>
					</tr>


					<tr>
						<th scope="col">NOTICE.No</th>
						<td><input type="text" class="form-control"
							value="${noticeDto.n_no}" readonly="readonly"></td>
					</tr>

					<tr>
						<th scope="col">NOTICE TITLE</th>
						<td><input type="text" class="form-control"
							value="${noticeDto.n_title}" readonly="readonly"></td>
					</tr>
					<tr>
						<th scope="col">NOTICE CONTENT</th>
						<td>
							<div id="viewer"></div>
							<input type="hidden" class="form-control" id="n_content" value="${noticeDto.n_content}" readonly="readonly">
						</td>
					</tr>

					<tr>
						<th scope="col">NOTICE DATE</th>
						<td><input type="text" class="form-control"
							value="${noticeDto.n_when}" readonly="readonly"></td>
					</tr>

					<tr>
						<th scope="col">STATE</th>
						<td><input type="text" class="form-control"
							value="${noticeDto.n_state}" readonly="readonly"></td>
					</tr>


					<tr>
						<td></td>
						<td>
						<a href="${pageContext.request.contextPath }/admin/noticeEditAdmin/${noticeDto.c_no}/${noticeDto.n_no}"
							class="btn btn-warning btn-lg font-weight-bold">수정하기</a>
						<a href="${pageContext.request.contextPath}/admin/noticeDeleteAdmin/${noticeDto.c_no}/${noticeDto.n_no}"
							class="btn btn-danger btn-lg font-weight-bold">삭제하기</a> 
						<a href="${pageContext.request.contextPath}/admin/noticeList/1"
							class="btn btn-primary btn-lg font-weight-bold">목록으로</a></td>
					</tr>
				</tbody>
			</table>
	</div>
</div>
<!-- Toast Editor Plugin -->
	<script src="https://uicdn.toast.com/editor/latest/toastui-editor-all.min.js"></script>
	<script src="https://uicdn.toast.com/editor-plugin-color-syntax/latest/toastui-editor-plugin-color-syntax.min.js"></script>
	<script src="https://uicdn.toast.com/editor-plugin-code-syntax-highlight/latest/toastui-editor-plugin-code-syntax-highlight-all.min.js"></script>
	<script src="https://uicdn.toast.com/editor-plugin-table-merged-cell/latest/toastui-editor-plugin-table-merged-cell.min.js"></script>
<script>
var n_content = document.querySelector("#n_content").value
// Toast Plugin 불러오기 
const Viewer = toastui.Editor;
const {codeSyntaxHighlight, colorSyntax, tableMergedCell} = Viewer.plugin;

const viewer = toastui.Editor.factory({
	el: document.querySelector('#viewer'),
	viewer: true,
	height: '1000px',
	initialValue: n_content,
	initialEditType: 'markdown',
	plugins: [codeSyntaxHighlight, tableMergedCell]
});
</script>
<jsp:include page="/WEB-INF/views/template/admin/main_admin_nav_footer.jsp"></jsp:include>