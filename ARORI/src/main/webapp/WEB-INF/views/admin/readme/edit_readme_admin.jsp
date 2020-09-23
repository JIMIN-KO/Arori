<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@page contentType="text/html; charset=UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:include page="/WEB-INF/views/template/admin/main_admin_nav_header.jsp"></jsp:include>
<br><br>
	<div class="d-flex">
		<h1 class="font-weight-bold mt-4" style="flex:18;">Admin | README Edit</h1>
	</div>	
    	<hr><br>
    	
<div class="ml-5 mr-5 pr-5 pl-5">	
	
	<!-- 게시글 작성 영역 -->
	<div id="editor" class="mt-5"></div>
	
 	<!-- model 로 받아온 r_content 데이터 문자열 화 -->
	<input type="hidden" id="edit_readme_content" value="${readmeDto.r_content }">
	
	<div class="float-right mt-5">
	
		<!-- 전송 영역 -->
		<form action="${pageContext.request.contextPath }/admin/readmeEditAdmin" method="post" style="display: inline-block;" id="editForm">
			<input type="hidden" name="c_no" value="${readmeDto.c_no }">
			<input type="hidden" name="r_no" value="${readmeDto.r_no }">
			<input type="hidden" name="content" id="r_content" value="${readmeDto.r_content}">
			<input type="submit" class="btn btn-warning btn-lg font-weight-bold" id="editReadme" value="수정">
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
	// Readme 게시글 기존 내용 에디터 안에 넣기 
	var r_content =$("#edit_readme_content").val()
	editor.setMarkdown(r_content)
	
	// Readme 게시글 작성하기
	$("#editReadme").click(function(){
		/* $("#r_content").val(editor.getTextObject()._mde.toastMark.lineTexts) */
		$("#r_content").val(editor.getMarkdown());
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
			
			var frm = new FormData();
			frm.append("f", blob);
			
			axios({
				contentType: false,
				processData: false,
				url:"/arori/imgAjax/readme/upload/${readmeDto.r_no }" ,
				method:"post",
				data:frm
			}).then(function(resp) {
				callback("/arori/imgAjax/readme/download/" + resp.data);
			})
		}
	}
});
</script>
<jsp:include page="/WEB-INF/views/template/admin/main_admin_nav_footer.jsp"></jsp:include>