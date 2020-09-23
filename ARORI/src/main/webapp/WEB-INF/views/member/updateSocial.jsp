<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="/WEB-INF/views/template/member/main_member_nav_header.jsp"></jsp:include>
<jsp:include page="/WEB-INF/views/template/member/member_myPage_nav_header.jsp"></jsp:include>
                    <div class="offset-1 null-side null-side2"></div>                        
                    <div class="col-9 overflow-auto" style="border-right: 1px solid rgba(190, 190, 190, 0.493);">
                        <br>
                        <div class="d-flex">
	                        <h1 class="font-weight-bold mt-4" style="flex:18;">Edit | Social</h1>
                        </div>
                        <hr><br>
                        	<div class="card mt-3 mb-3 mr-5 ml-5">
                        	<div class="card-header bg-primary text-white font-weight-bold mb-3" style="font-size: 1.5rem;">
                        		회원 정보 수정	
                        	</div>
						  <div class="card-body">
						    <div class="input-group input-group-lg mb-4">
							  <div class="input-group-prepend">
							    <span class="input-group-text" id="basic-addon1">ID</span>
							  </div>
							  <input type="text" class="form-control" placeholder="ID" aria-label="Username" aria-describedby="basic-addon1" readonly="readonly" value="${memberDto.member_id} ">
							</div>
							<form action="${pageContext.request.contextPath }/member/updateSocial" method="post" onSubmit="return finalcheck()">
								<div class="input-group input-group-lg mb-4">
								  <div class="input-group-prepend">
								    <span class="input-group-text" id="basic-addon1">NICK</span>
								  </div>
								  <input type="text" class="form-control" placeholder="닉네임을 입력해주세요." aria-label="Username" aria-describedby="basic-addon1"  name="member_nick" value="${memberDto.member_nick}"  oninput="checkNick()">
								</div>
								  <div class="text-center mb-4 text-danger" style="font-size: 18px;"></div>
								<button type="submit"  data-target="#memberUpdateFail" class="btn btn-lg btn-warning btn-block font-weight-bold">수정</button>
							</form>
								<a type="button" class="btn btn-lg btn-danger btn-block font-weight-bold mt-4" href="${pageContext.request.contextPath }/member/delete">탈퇴</a>
						  </div>
						</div>
                    </div>
<jsp:include page="/WEB-INF/views/template/member/member_classes_viewer_footer.jsp"></jsp:include>
<script>
//모달 가리기
$(function(){
	  $("#memberUpdateFail").modal("hide")
})
//submit전에 회원가입 형식을 검사하는 함수  조건에 걸리면 모달을 보여줘라
function finalcheck(){
		if(checkNick()== false) {
			$("#memberUpdateFail").modal("show") //회원가입양식 확인 하라는 모달 
			return false
		}  
	}
	
//닉넴검사
function checkNick(){
	var regex =/^[가-힣a-zA-Z0-9]{2,10}$/g; //정규식:2~10자 한글,영어,숫자 사용가능 
	var input = document.querySelector("input[name=member_nick]"); //사용자가 input창에  입력한 값 
	var span = $("input[name=member_nick]").parent().next()
	var isValid = regex.test(input.value); //입력한 아이디가 조건식에 맞는지 검사 
	var member_nick = input.value; //사용자가 입력한 값 
	var prohibition ="관리자"; //금지할 단어
	
	if(input.value==="${memberDto.member_nick}"){ //사용자가 원래 쓰던 닉네임 입력시 
		 	$(span).text("멋진 닉네임입니다.");	
			 return true;
			}else{
	 	 if(input.value.indexOf(prohibition)!=-1){ //금지단어를가지고 있다면 
			  $(span).text("해당 닉네임은 관리자 전용입니다.");
		 		 return false;
	
		  	 }else{//금지하는 단어가 없을경우 정규표현식검사
		  		  if(isValid){//정상적인 이름인 경우  아이디 중복체크 
				
				  axios({
					  url:"${pageContext.request.contextPath}/nonMemberAjax/checkOverlapNick?member_nick="+member_nick,
					 method:"get"  
				  }).then(function(resp){
						if(!resp.data){ //결과가 없다면 
						  		$(span).text("멋진 닉네임입니다");
					  			return true;
	
							  } else {
									  $(span).text("이미 사용중인 닉네임입니다.");
							  		return false;
	
					  				}	  
				  			});
			  			} else{//정규표현식 안맞으면
		    	  				$(span).text("2~10자 한글,영어,숫자만  공백없이 사용가능합니다. ");
		    	  				return false;
		   			   }
				}
		 }   
}

</script>
<jsp:include page="/WEB-INF/views/template/member/member_classes_nav_footer.jsp"></jsp:include>

