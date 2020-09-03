<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="/WEB-INF/views/template/member/main_member_nav_header.jsp"></jsp:include>
<jsp:include page="/WEB-INF/views/template/member/member_classes_nav_header.jsp"></jsp:include>
                    <div class="offset-1 null-side null-side2"></div>                        
                    <div class="col-9 overflow-auto" style="border-right: 1px solid rgba(190, 190, 190, 0.493);">
                        <br>
                        <h1 class="font-weight-bold mt-4">Notice | Edit</h1>
                        <hr><br>
                        <!-- 제목 입력 영역 -->
                        <div class="input-group input-group-lg">
							<div class="input-group-prepend">
								<span class="input-group-text" id="inputGroup-sizing-lg">Title</span>
							</div>
							<input type="text" class="form-control" id="n_title" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-lg" value="${noticeDto.n_title }">
						</div>
						<!-- 게시글 작성 영역 -->
                        <div id="editor"></div>
                        <!-- model 로 받아온 n_content 데이터 문자열 화 -->
                        <input type="hidden" id="edit_n_content" value="${noticeDto.n_content }">
                        <div class="float-right mt-5">
                        	<a href="javascript:history.back();" class="btn btn-primary btn-lg font-weight-bold" id="editCancel">취소</a>
                        	<!-- 전송 영역 -->
                        	<form action="${pageContext.request.contextPath }/classes/notice/edit" method="post" style="display: inline-block;">
                        		<input type="hidden" name="c_no" value="${c_no }">
                        		<input type="hidden" name="n_no" value="${noticeDto.n_no }">
                        		<input type="hidden" name="n_title">
                        		<input type="hidden" name="n_content" id="n_content">
	                        	<input type="submit" class="btn btn-warning btn-lg font-weight-bold" id="editNotice" value="수정">
                        	</form>
                        </div>
                    </div>
<jsp:include page="/WEB-INF/views/template/member/member_classes_editor_footer.jsp"></jsp:include>
<!-- Toast Editor 비동기 Javascript 영역 -->
<script type="text/javascript" src="${pageContext.request.contextPath }/resources/js/member/toast_ui_editor.js"></script>
<script>
$(function(){
	// 공지 게시글 내용 에디터 안에 넣기 
	var n_content = $("#edit_n_content").val()
	editor.setMarkdown(n_content)
	
	// 공지 게시글 제목 설정하기 
	$("#n_title").on("input",function(){
		var n_title = $("#n_title").val()
		console.log(n_title)
		$("input[name=n_title]").val(n_title)
	})
	
	// 공지 게시글 작성하기
	$("#editNotice").click(function(){
		/* $("#n_content").val(editor.getTextObject()._mde.toastMark.lineTexts) */
		$("#n_content").val(editor.getMarkdown());
	})

})
</script>
<jsp:include page="/WEB-INF/views/template/member/member_classes_nav_footer.jsp"></jsp:include>