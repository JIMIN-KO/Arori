<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="/WEB-INF/views/template/member/main_member_nav_header.jsp"></jsp:include>
<jsp:include page="/WEB-INF/views/template/member/member_classes_nav_header.jsp"></jsp:include>
                    <div class="offset-1 null-side null-side2"></div>                        
                    <div class="col-9 overflow-auto" style="border-right: 1px solid rgba(190, 190, 190, 0.493);">
                        <br>
                        <h1 class="font-weight-bold mt-4">Notice | Create</h1>
                        <hr><br>
                        <!-- 제목 입력 영역 -->
                        <div class="input-group input-group-lg">
							<div class="input-group-prepend">
								<span class="input-group-text" id="inputGroup-sizing-lg">Title</span>
							</div>
							<input type="text" class="form-control" id="n_title" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-lg">
						</div>
						<!-- 게시글 작성 영역 -->
                        <div id="editor" class="mt-5"></div>
                        <div class="float-right mt-5">
                        	<!-- 전송 영역 -->
                        	<form action="${pageContext.request.contextPath }/classes/notice/edit" method="post" style="display: inline-block;">
                        		<input type="hidden" name="c_no" value="${noticeDto.c_no }">
                        		<input type="hidden" name="n_no" value="${noticeDto.n_no }">
                        		<input type="hidden" name="n_title">
                        		<input type="hidden" name="n_content" id="n_content">
                        		<input type="hidden" name="n_state" value="1">
	                        	<input type="submit" class="btn btn-warning btn-lg font-weight-bold" id="createNotice" value="작성">
                        	</form>
                        	<!-- 취소 영역 -->
                            <a class="btn btn-primary btn-lg font-weight-bold" id="cancel">취소</a>
                        </div>
                    </div>
<jsp:include page="/WEB-INF/views/template/member/member_classes_editor_footer.jsp"></jsp:include>
<!-- Toast Editor 비동기 Javascript 영역 -->
<script>
$(function(){
	
	$('#saveModal').modal('hide') // 모달 숨기기 
	
	// 취소 버튼 클릭 시 모달 띄우기 
	$("#cancel").click(function(){
		$('#saveModal').modal('show') // 모달 띄우기 
	})
	
	// 모달 ) 취소 클릭시 해당 데이터 삭제 및 목록으로 이동 
	$("#saveCancel").click(function(){
		location.href = "/arori/classes/notice/delete/${noticeDto.c_no}/${noticeDto.n_no}"
	})
	
	// 모달 ) 임시 저장 클릭 시 n_state 상태 0  으로 변경 
	$("#save").click(function(){
		$("input[name=n_state]").val(0)
		$("#n_content").val(editor.getMarkdown()); // 에디터 데이터를 폼에 삽입 
		$("#createNotice").trigger("click")
	})
	
	// 공지 게시글 제목 설정하기 
	$("#n_title").on("input",function(){
		var n_title = $("#n_title").val()
		$("input[name=n_title]").val(n_title)
	})
	
	// 공지 게시글 작성하기
	$("#createNotice").click(function(){
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
<jsp:include page="/WEB-INF/views/template/member/member_classes_nav_footer.jsp"></jsp:include>