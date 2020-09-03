<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 <head>
  <style>
        textarea {
            width: 400px; height: 100px;
        }
    </style>
    <script src="https://cdn.jsdelivr.net/npm/jquery@1.12.4/dist/jquery.min.js"></script>
    <script>
        $(function(){
            //답안유형 숨김
            $(".ox").hide();
            $(".mul").hide();
            $(".ex").hide();

            //시작하자마자 .question-add 를 하나 추가용으로 백업
            var backup = $(".question-add").first().clone();
            
            $(".type_select").change(function(){
                var state = $(this).val();
                if(state == "ox-menu"){
                    $(".ox").show(); $(".mul").hide(); $(".ex").hide();
                }
                else if(state == "mul-menu"){
                    $(".mul").show(); $(".ox").hide(); $(".ex").hide();
                }
                else {
                    $(".ex").show(); $(".ox").hide(); $(".mul").hide();
                }
            });

            $(".add").click(function(){
                //문항 추가 = .question-add를 복사해서 뒤에 추가
                var clone = backup.clone();
                $(".question-add").last().after(clone);
                //수정삭제 버튼
                $("<button>").text("수정").appendTo(clone);
                $("<button>").text("삭제")
                                    .addClass("del")
                                    .click(function(){
                                        $(this).parent().remove();
                                    })
                                    .appendTo(clone);
 
                //clone에 있는 .type_select에 change이벤트를 설정해야 함
                clone.find(".type_select").change(function(){
                    //this는 select 태그
                    var state = $(this).val();
                    if(state == "ox-menu"){
                        $(this).nextAll(".ox").show(); //this(select) 뒤에 있는 모든 애들 중에서 ox라는 클래스를 가진 항목을 표시해라
                        $(this).nextAll(".mul").hide(); 
                        $(this).nextAll(".ex").hide();
                    }
                    else if(state == "mul-menu"){
                        $(this).nextAll(".mul").show(); 
                        $(this).nextAll(".ox").hide(); 
                        $(this).nextAll(".ex").hide();
                    }
                    else {
                        $(this).nextAll(".ex").show(); 
                        $(this).nextAll(".ox").hide(); 
                        $(this).nextAll(".mul").hide();
                    }
                });
            });

            //form버튼 
            function qsubmit() {
                return true;
            }
            function qsubmit2() {
                frm.action="create";
                frm.submit();
                return true;
            }
                
        });
    </script>
 </head>
 <body>

<h2>퀘스천 등록</h2>
<h2>총 배점 : ${q_score}점</h2>

<hr>
<form action="create" method="post" class="form-create" onsubmit="return qsubmit()">
    <input type="hidden" name="q_no" value="${q_nform-createo}">

    <div class="question-add">
        <!--질문 영역-->
        <h4>질문 작성</h4>
        <select class="type_select">
            <option>유형 선택</option>
            <option value="ox-menu">ox</option>
            <option value="mul-menu">선다형</option>
            <option value="ex-menu">단답/서술형</option>
        </select>
        <h4>배점</h4> <input type="text" placeholder="점" name="sq_score">
        <h4>질문</h4> <textarea name="aq_content" class="aq_content" value="지문을 적어주세요"></textarea>
        
        <h4>답변</h4>
        <!--ox답변 영역-->
        <span class="ox">
            <h4>OX 답안 작성</h4>
            <h4>O : </h4> <textarea name="o_content"></textarea>
            <h4>X : </h4> <textarea name="x_content"></textarea>
            <input type="text" name="ox_answer" placeholder="둘 중 답은? O=1,X=0">
        </span>
        <!--선다형 답변 영역-->
        <span class="mul">
            <h4>선다형 답안 작성</h4>
            <input type="checkbox" value="1">1. <input type="text"><br>
            <input type="checkbox" value="2">2. <input type="text"><br>
            <input type="checkbox" value="3">3. <input type="text"><br>
            <input type="checkbox" value="4">4. <input type="text"><br>
            <input type="text" name="multiple_answer" placeholder="답은 몇번?">
        </span>
        <!--단답/서술형 답변 영역-->
        <span class="ex">
            <h4>서술형 답안 작성</h4>
            <input type="text" name="explane_answer" placeholder="정답이면1 오답이면0"><br>
            <textarea name="explane_answer"></textarea>
        </span>
    </div>
    
    <hr>
    <!--Submit-->
    <input type="button" class="add" value="퀘스천 추가">
	<input type="submit" onclick="return qsubmit2(this.form);" value="완료">
</form> 

</body>
