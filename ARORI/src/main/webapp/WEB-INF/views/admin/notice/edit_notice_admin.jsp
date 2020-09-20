<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@page contentType="text/html; charset=UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:include page="/WEB-INF/views/template/admin/main_admin_nav_header.jsp"></jsp:include>
<br><br>
	<div class="d-flex">
		<h1 class="font-weight-bold mt-4" style="flex:18;">Admin | NOTICE Edit</h1>
	</div>	
    	<hr><br>
    	
<div class="ml-5 mr-5 pr-5 pl-5">	
	<!-- 제목 입력 영역 -->
	<div class="input-group input-group-lg">
		<div class="input-group-prepend">
			<span class="input-group-text" id="inputGroup-sizing-lg">Title</span>
		</div>
		<input type="text" class="form-control" id="n_title" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-lg" value="${noticeDto.n_title }">
	</div>
	
	<!-- 게시글 작성 영역 -->
	<div id="editor" class="mt-5"></div>
	
 	<!-- model 로 받아온 n_content 데이터 문자열 화 -->
	<input type="hidden" id="edit_notice_content" value="${noticeDto.n_content }">
	
	<div class="float-right mt-5">
	
		<!-- 전송 영역 -->
		<form action="${pageContext.request.contextPath }/admin/noticeEditAdmin" method="post" style="display: inline-block;" id="editForm">
			<input type="hidden" name="c_no" value="${noticeDto.c_no }">
			<input type="hidden" name="n_no" value="${noticeDto.n_no }">
			<input type="hidden" name="n_title" value="${noticeDto.n_title}">
			<input type="hidden" name="n_state" value="1">
			<input type="hidden" name="content" id="n_content" value="${noticeDto.n_content}">
			<input type="submit" class="btn btn-warning btn-lg font-weight-bold" id="editNotice" value="수정">
		</form>
		
		<!-- 취소 영역 -->
		<a class="btn btn-primary btn-lg font-weight-bold" id="cancel">취소</a>
	</div>
</div>	
	
<!-- Toast Editor 비동기 Javascript 영역 -->
    <!-- Toast Editor -->
	<script src="https://uicdn.toast.com/editor/latest/toastui-editor-all.min.js"></script>
	<script src="https://uicdn.toast.com/editor-plugin-color-syntax/latest/toastui-editor-plugin-color-syntax.min.js"></script>
	<script src="https://uicdn.toast.com/editor-plugin-code-syntax-highlight/latest/toastui-editor-plugin-code-syntax-highlight-all.min.js"></script>
	<script src="https://uicdn.toast.com/editor-plugin-table-merged-cell/latest/toastui-editor-plugin-table-merged-cell.min.js"></script>
<script>
$(function(){
	$("#cancel").click(function(){
		history.back()
	})
	/////////////////// 에디터 기본 설정 /////////////////////
	// Notice 게시글 기존 내용 에디터 안에 넣기 
	var n_content =$("#edit_notice_content").val()
	editor.setMarkdown(n_content)
	var origin_notice_title = $("#n_title").val()

		
	// Notice 게시글 제목 설정하기 
	$("#n_title").on("input",function(){
		var n_title = $("#n_title").val()
		$("input[name=n_title]").val(n_title)
	})
	
	// Notice 게시글 작성하기
	$("#editNotice").click(function(){
		/* $("#n_content").val(editor.getTextObject()._mde.toastMark.lineTexts) */
		$("#n_content").val(editor.getMarkdown());
	})

})

//Toast Ui Editor
const Editor = toastui.Editor;
const { colorSyntax } = Editor.plugin;
const { codeSyntaxHighlight } = Editor.plugin;
const { tableMergedCell } = Editor.plugin;

const editor = new Editor({
	  el: document.querySelector('#editor'),
	  height: '600px',
	  initialEditType: 'markdown',
	  previewStyle: 'vertical',
	  plugins: [colorSyntax, codeSyntaxHighlight, tableMergedCell],
	  hooks:{
		'addImageBlobHook':function(blob, callback){
			console.log(blob, callback);
			
			var frm = new FormData();
			frm.append("f", blob);
			
			axios({
				contentType: false,
				processData: false,
				url:"/arori/imgAjax/notice/upload/${noticeDto.n_no }" ,
				method:"post",
				data:frm
			}).then(function(resp) {
				callback("/arori/imgAjax/notice/download/" + resp.data);
			})
		}
	}
});
</script>
<jsp:include page="/WEB-INF/views/template/admin/main_admin_nav_footer.jsp"></jsp:include>