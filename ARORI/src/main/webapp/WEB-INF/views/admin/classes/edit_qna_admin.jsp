<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@page contentType="text/html; charset=UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:include page="/WEB-INF/views/template/admin/main_admin_nav_header.jsp"></jsp:include>
<br><br>
	<div class="d-flex">
		<h1 class="font-weight-bold mt-4" style="flex:18;">Admin | Q&A Edit ${QnaMemberDto.member_nick}</h1>
	</div>	
    	<hr><br>
    	
<div class="ml-5 mr-5 pr-5 pl-5">	
	<!-- 제목 입력 영역 -->
	<div class="input-group input-group-lg">
		<div class="input-group-prepend">
			<span class="input-group-text" id="inputGroup-sizing-lg">Title</span>
		</div>
		<input type="text" class="form-control" id="qna_title" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-lg" value="${qnaDto.qna_title }">
	</div>
	
	<!-- 게시글 작성 영역 -->
	<div id="editor" class="mt-5"></div>
	
 	<!-- model 로 받아온 qna_content 데이터 문자열 화 -->
	<input type="hidden" id="edit_qna_content" value="${qnaDto.qna_content }">
	
	<div class="float-right mt-5">
	
		<!-- 전송 영역 -->
		<form action="${pageContext.request.contextPath }/admin/qnaEditAdmin" method="post" style="display: inline-block;" id="editForm">
			<input type="hidden" name="c_no" value="${qnaDto.c_no }">
			<input type="hidden" name="qna_no" value="${qnaDto.qna_no }">
			<input type="hidden" name="qna_title" value="${qnaDto.qna_title}">
			<input type="hidden" name="qna_state" value="1">
			<input type="hidden" name="member_no" value="${userinfo.member_no }">
			<input type="hidden" name="content" id="qna_content" value="${qnaDto.qna_content}">
			<input type="submit" class="btn btn-warning btn-lg font-weight-bold" id="editQna" value="수정">
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
	<script src="https://uicdn.toast.com/editor-plugin-chart/latest/toastui-editor-plugin-chart.min.js"></script>
	<script src="https://uicdn.toast.com/editor-plugin-uml/latest/toastui-editor-plugin-uml.min.js"></script>
<script>
$(function(){
	$("#cancel").click(function(){
		history.back()
	})
	/////////////////// 에디터 기본 설정 /////////////////////
	// QNA 게시글 기존 내용 에디터 안에 넣기 
	var qna_content =$("#edit_qna_content").val()
	editor.setMarkdown(qna_content)
	var origin_qna_title = $("#qna_title").val()

		
	// QNA 게시글 제목 설정하기 
	$("#qna_title").on("input",function(){
		var qna_title = $("#qna_title").val()
		$("input[name=qna_title]").val(qna_title)
	})
	
	// QNA 게시글 작성하기
	$("#editQna").click(function(){
		/* $("#qna_content").val(editor.getTextObject()._mde.toastMark.lineTexts) */
		$("#qna_content").val(editor.getMarkdown());
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
				url:"/arori/imgAjax/qna/upload/${qnaDto.qna_no }" ,
				method:"post",
				data:frm
			}).then(function(resp) {
				callback("/arori/imgAjax/qna/download/" + resp.data);
			})
		}
	}
});
</script>
<jsp:include page="/WEB-INF/views/template/admin/main_admin_nav_footer.jsp"></jsp:include>