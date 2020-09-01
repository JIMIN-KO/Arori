<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <jsp:include page="/WEB-INF/views/template/member/main_member_nav_header.jsp"></jsp:include>
 <head>
 <script src="https://cdn.jsdelivr.net/npm/jquery@1.12.4/dist/jquery.min.js"></script>
    <script>
        $(function(){
            $(".add").click(function(){
                var div = $("<div>");
                $("<hr>").appendTo(div);
                $("<h4>").text("퀘스천").appendTo(div);
                $("<h4>").text("배점").appendTo(div);
                $("<input>").attr("type","text")
                                    .attr("placeholder","총 ?점")
                                    .attr("name","aq_score")
                                    .appendTo(div);
                $("<h4>").text("질문 : ").appendTo(div);
                $("<textarea>").attr("name","aq_content")
                                     .appendTo(div);
                $("<button>").text("수정").appendTo(div);
                $("<button>").text("삭제")
                                    .addClass("del")
                                    .click(function(){
                                        $(this).parent().remove();
                                    })
                                    .appendTo(div);
                $(".result").append(div);                               
            });
        });
    </script>
 </head>
 <body>
<h2>퀘스천 생성</h2>
<button class="add" id="q-add">퀘스천 추가</button>
<form id=""action="create" method="post">
    <h4>퀘스천</h4>
    <select>
        <option>ox</option>
        <option>선다형</option>
        <option>단답/서술형</option>
    </select>
    <h4>배점</h4> <input type="text" placeholder="점" name="sq_score">
    <h4>질문</h4> <textarea name="aq_content"></textarea>
    <button>수정</button>
	<input type="hidden" name="q_no" value="${q_no}">
    <div class="result">
    </div>
	<hr>
	<button type="submit">퀘스천생성</button>
</form>  
</body>
<jsp:include page="/WEB-INF/views/template/member/main_member_nav_footer.jsp"></jsp:include>