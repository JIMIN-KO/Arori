<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="/WEB-INF/views/template/member/main_member_nav_header.jsp"></jsp:include>
<jsp:include page="/WEB-INF/views/template/member/member_classes_nav_header.jsp"></jsp:include>
                    <div class="offset-1 null-side null-side2"></div>                        
                    <div class="col-9 overflow-auto" style="border-right: 1px solid rgba(190, 190, 190, 0.493);">
                        <br>
                        <h1 class="font-weight-bold mt-4">Read Me | Edit</h1>
                        <hr><br>
                        <!-- 에디터 영역 -->
                        <div id="editor"></div>
                        <!-- model 로 받아온 r_content 데이터 문자열 화 -->
                        <input type="hidden" value="${readmeDto.r_content }" id="edit_r_content">
                        <div class="float-right mt-5">
                        	<!-- 전송 영역 -->
                        	<form action="${pageContext.request.contextPath }/classes/readme/edit" method="post" style="display: inline-block;">
                        		<input type="hidden" name="c_no" value="${c_no }">
                        		<input type="hidden" name="r_content" id="r_content">
	                        	<input type="submit" class="btn btn-warning btn-lg font-weight-bold" id="editReadme" value="수정">
                        	</form>
                        	<a href="javascript:history.back();" class="btn btn-primary btn-lg font-weight-bold" id="createCancel">취소</a>
                        </div>
                    </div>
<jsp:include page="/WEB-INF/views/template/member/member_classes_editor_footer.jsp"></jsp:include>
<!-- Toast Editor 비동기 Javascript 영역 -->
<script>
$(function(){
	
	// model  로 받아온 데이터가 value 로 저장된 태그를 불러온 후 해당 데이터를 에디터에 삽입 
	var edit_r_content = document.querySelector("#edit_r_content")
	editor.setMarkdown(edit_r_content.value)
	
	// 리드미 작성하기
	$("#editReadme").click(function(){
		$("#r_content").val(editor.getMarkdown())
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
				url:"/arori/imgAjax/readme/upload/${c_no}" ,
				method:"post",
				data:frm
			}).then(function(resp) {
				callback("/arori/imgAjax/readme/download/" + resp.data);
			})
		}
	}
});
</script>
<jsp:include page="/WEB-INF/views/template/member/member_classes_nav_footer.jsp"></jsp:include>