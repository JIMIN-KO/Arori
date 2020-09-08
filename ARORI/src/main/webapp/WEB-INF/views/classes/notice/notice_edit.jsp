<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="/WEB-INF/views/template/member/main_member_nav_header.jsp"></jsp:include>
<jsp:include page="/WEB-INF/views/template/member/member_classes_nav_header.jsp"></jsp:include>
                    <div class="offset-1 null-side null-side2"></div>                        
                    <div class="col-9 overflow-auto" style="border-right: 1px solid rgba(190, 190, 190, 0.493);">
                        <br>
                        <div class="d-flex">
	                        <h1 class="font-weight-bold mt-4" style="flex:18;">Notice</h1>
	                        <c:if test="${not empty temp }">
								<select class="custom-select custom-select-lg mt-4" id="tempSelect" style="flex: 10;">
									<option selected="selected" disabled="disabled">임시 저장 리스트</option>
									<c:forEach var="temp" items="${temp }">
										<option value="${temp.n_content }">${temp.n_title }</option>
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
							<input type="text" class="form-control" id="n_title" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-lg" value="${noticeDto.n_title }">
						</div>
						<!-- 게시글 작성 영역 -->
                        <div id="editor" class="mt-5"></div>
                        <!-- model 로 받아온 n_content 데이터 문자열 화 -->
                        <input type="hidden" id="edit_n_content" value="${noticeDto.n_content }">
                        <div class="float-right mt-5">
                        	<!-- 전송 영역 -->
                        	<form action="${pageContext.request.contextPath }/classes/notice/edit" method="post" style="display: inline-block;" id="editForm">
                        		<input type="hidden" name="c_no" value="${c_no }">
                        		<input type="hidden" name="n_no" value="${noticeDto.n_no }">
                        		<input type="hidden" name="n_title">
                        		<input type="hidden" name="n_state" value="1">
                        		<input type="hidden" name="n_content" id="n_content">
	                        	<input type="submit" class="btn btn-warning btn-lg font-weight-bold" id="editNotice" value="수정">
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
		$("#n_title").val($("#tempSelect option:selected").text()) // input 
		$("input[name=n_title]").val($("#tempSelect option:selected").text()) // form

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
		$("#n_content").val(editor.getMarkdown()); // 에디터 데이터를 폼에 삽입 
		$("#editForm").attr("action","${pageContext.request.contextPath }/classes/notice/temp") // 경로 변경
		$("#editNotice").trigger("click") // submit
	})
	
	/////////////////// 에디터 기본 설정 /////////////////////
	// 공지 게시글 기존 내용 에디터 안에 넣기 
	var n_content = $("#edit_n_content").val()
	editor.setMarkdown(n_content)
	var origin_n_title = $("#n_title").val()
	$("input[name=n_title]").val(origin_n_title)
	$("#n_title").val(origin_n_title)
		
	// 공지 게시글 제목 설정하기 
	$("#n_title").on("input",function(){
		var n_title = $("#n_title").val()
		$("input[name=n_title]").val(n_title)
	})
	
	// 공지 게시글 작성하기
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
<jsp:include page="/WEB-INF/views/template/member/member_classes_nav_footer.jsp"></jsp:include>