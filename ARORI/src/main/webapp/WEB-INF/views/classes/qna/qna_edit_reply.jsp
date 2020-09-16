<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="/WEB-INF/views/template/member/main_member_nav_header.jsp"></jsp:include>
<jsp:include page="/WEB-INF/views/template/member/member_classes_nav_header.jsp"></jsp:include>
                    <div class="offset-1 null-side null-side2"></div>                        
                    <div class="col-9 overflow-auto" style="border-right: 1px solid rgba(190, 190, 190, 0.493);">
                        <br>
                        <div class="d-flex">
	                        <h1 class="font-weight-bold mt-4" style="flex:18;">Q&A</h1>
	                        <c:if test="${not empty temp }">
								<select class="custom-select custom-select-lg mt-4" id="tempSelect" style="flex: 10;">
									<option selected="selected" disabled="disabled">임시 저장 리스트</option>
									<c:forEach var="temp" items="${temp }">
										<option value="${temp.qna_content }">${temp.qna_title }</option>
									</c:forEach>
								</select>
			                </c:if>
                        </div>
                        <hr><br>
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
                        	<form action="${pageContext.request.contextPath }/classes/qna/edit_reply" method="post" style="display: inline-block;" id="editForm">
                        		<input type="hidden" name="c_no" value="${c_no }">
                        		<input type="hidden" name="qna_no" value="${qnaDto.qna_no }">
                        		<input type="hidden" name="qna_title" value="${qnaDto.qna_title}">
                        		<input type="hidden" name="qna_state" value="1">
                        		<input type="hidden" name="qna_content" id="qna_content">
	                        	<input type="submit" class="btn btn-warning btn-lg font-weight-bold" id="editQna" value="수정">
                        	</form>
                        	<!-- 취소 영역 -->
                        	<a class="btn btn-primary btn-lg font-weight-bold" id="cancel">취소</a>
                        </div>
                    </div>
<jsp:include page="/WEB-INF/views/template/member/member_classes_editor_footer.jsp"></jsp:include>
<!-- Toast Editor 비동기 Javascript 영역 -->
<script>
$(function(){

	///////////// 임시 저장소 ///////////////
	$("#tempSelect").on("change",function(){
		// 제목 설정
		$("#qna_title").val($("#tempSelect option:selected").text()) // input 
		$("input[name=qna_title]").val($("#tempSelect option:selected").text()) // form

		// 에디터 삽입
		editor.setMarkdown($("#tempSelect").val())
	})

	/////////// 모달 ///////////
	$('#saveModal').modal('hide') // 모달 숨기기 
	
	// 취소 버튼 클릭 시 모달 띄우기 
	$("#cancel").click(function(){
		$('#saveModal').modal('show') // 모달 띄우기 
	})
	
	// 모달 ) 취소 클릭시 목록으로 이동 
	$("#saveCancel").click(function(){
		history.back()
	})
	
	// 모달 ) 임시 저장 클릭 시 현재 데이터 저장 
	$("#save").click(function(){
		$("#qna_content").val(editor.getMarkdown()); // 에디터 데이터를 폼에 삽입 
		$("#editForm").attr("action","${pageContext.request.contextPath }/classes/qna/temp") // 경로 변경
		$("#editQna").trigger("click") // submit
	})
	
	/////////////////// 에디터 기본 설정 /////////////////////
	// QNA 게시글 기존 내용 에디터 안에 넣기 
	var qna_content = $("#edit_qna_content").val()
	editor.setMarkdown(qna_content)
	var origin_qna_title = $("#qna_title").val()
	$("input[name=qna_title]").val(origin_qna_title)
	$("#qna_title").val(origin_qna_title)
		
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
<jsp:include page="/WEB-INF/views/template/member/member_classes_nav_footer.jsp"></jsp:include>