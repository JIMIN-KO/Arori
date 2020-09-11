<jsp:include
	page="/WEB-INF/views/template/admin/main_admin_nav_header.jsp"></jsp:include>
<jsp:include
	page="/WEB-INF/views/template/member/member_classes_nav_header.jsp"></jsp:include>
<%@page contentType="text/html; charset=UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script>
$(function(){
    $("input").val("필수로 입력해주세요.").css("color","gray").one("focus",
    function(){
$(this).val("").css("color","#000");
    
    })

    .blur(function(){
        if($(this).val()==""){
            $(this).val("필수로 입력해주세요.").css("color","gray").one("focus",
    function(){
$(this).val("").css("color","#000");
        });
        }

    });
});

</script>

<form action="delete" method="post">
<h1 class="font-weight-bold mt-4">신고글 삭제</h1>
	<table class="table table-hover">
		<tr>
			<th scope="col">신고글을 삭제하시려면 신고번호를 입력해주세요.</th>
		<tr>
			<td><input type="text" name="report_no"></td></tr>
			<tr>
			<td><input type="submit" value="삭제하기"
				class="btn btn-danger btn-sm font-weight-bold"></td>
		</tr>

	</table>
</form>

<jsp:include
	page="/WEB-INF/views/template/admin/main_admin_nav_footer.jsp"></jsp:include>