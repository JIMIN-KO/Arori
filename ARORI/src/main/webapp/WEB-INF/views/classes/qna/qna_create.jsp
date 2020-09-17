<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="/WEB-INF/views/template/member/main_member_nav_header.jsp"></jsp:include>
<jsp:include page="/WEB-INF/views/template/member/member_classes_nav_header.jsp"></jsp:include>
                    <div class="offset-1 null-side null-side2"></div>                        
                    <div class="col-9 overflow-auto" style="border-right: 1px solid rgba(190, 190, 190, 0.493);">
                        <br>
                        <h1 class="font-weight-bold mt-4">Q&A | Create</h1>
                        <hr><br>
                        
                        <!-- 제목 입력 영역 -->
                        <div class="input-group input-group-lg">
							<div class="input-group-prepend">
								<span class="input-group-text" id="inputGroup-sizing-lg">Title</span>
							</div>
							<input type="text" class="form-control" id="qna_title" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-lg">
						</div>
						
						<!-- 게시글 작성 영역 -->
                        <div id="editor"></div>
                        <div class="float-right mt-5">
                        	
                        	<!-- 전송 영역 -->
                        	<form action="${pageContext.request.contextPath }/classes/qna/edit" method="post" style="display: inline-block;">
                        		<input type="hidden" name="c_no" value="${qnaDto.c_no}">
                        		<input type="hidden" name="member_no" value="${userinfo.member_no}">
                        		<input type="hidden" name="qna_no" value="${qnaDto.qna_no }">
                        		<input type="hidden" name="qna_title"> 
                        		<input type="hidden" name="content" id="qna_content">
	                        	<input type="submit" class="btn btn-warning btn-lg font-weight-bold" id="createQna" value="작성">
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
		location.href = "/arori/classes/qna/delete/${qnaDto.c_no}/${qnaDto.qna_no}"
	})
	
	// 모달 ) 임시 저장 클릭 시 qna_state 상태 0  으로 변경 
	$("#save").click(function(){
		$("input[name=qna_state]").val(0)
		$("#qna_content").val(editor.getMarkdown()); // 에디터 데이터를 폼에 삽입 
		$("#createQna").trigger("click")
	})
	
	// qna 게시글 제목 설정하기 
	$("#qna_title").on("input",function(){
		var qna_title = $("#qna_title").val()
		$("input[name=qna_title]").val(qna_title)
	})
	
	// qna 게시글 작성하기
	$("#createQna").click(function(){
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
				url:"/arori/imgAjax/qna/upload/${qnaDto.qna_no}" ,
				method:"post",
				data:frm
			}).then(function(resp) {
				callback("/arori/imgAjax/qna/download/" + resp.data);
			})
		}
	}
});
</script>
<jsp:include page="/WEB-INF/views/template/member/member_classes_nav_footer.jsp"></jsp:include>