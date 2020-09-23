<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="/WEB-INF/views/template/member/main_member_nav_header.jsp"></jsp:include>
<jsp:include page="/WEB-INF/views/template/member/member_myPage_nav_header.jsp"></jsp:include>
                    <div class="offset-1 null-side null-side2"></div>                        
                    <div class="col-9 overflow-auto" style="border-right: 1px solid rgba(190, 190, 190, 0.493);">
                        <br>
                        <div class="d-flex">
	                        <h1 class="font-weight-bold mt-4" style="flex:18;">Edit | Arori</h1>
                        </div>
                        <hr><br>
                        	<div class="card mt-3 mb-3 mr-5 ml-5">
                        	<div class="card-header bg-primary text-white font-weight-bold mb-3" style="font-size: 1.5rem;">
                        		비밀번호 수정	
                        	</div>
						  <div class="card-body">
						    <div class="input-group input-group-lg mb-4">
							  <div class="input-group-prepend">
							    <span class="input-group-text" id="basic-addon1">ID</span>
							  </div>
							  <input type="text" class="form-control" placeholder="ID" aria-label="Username" aria-describedby="basic-addon1" readonly="readonly" value="${memberDto.member_id} ">
							</div>
							<form action="${pageContext.request.contextPath }/member/changePW" method="post" onSubmit="return finalcheck();">
								<div class="input-group input-group-lg mb-4">
								  <div class="input-group-prepend">
								    <span class="input-group-text" id="basic-addon1">현재 비밀번호</span>
								  </div>
								  <input type="password" class="form-control" placeholder="현재 비밀번호를 입력해주세요." aria-label="Username" aria-describedby="basic-addon1" name="beforeMember_pw"  onblur="CheckBeforecheckPw()">
								</div>
								  <div class="text-center mb-4 text-danger" style="font-size: 18px;"></div>
								<div class="input-group input-group-lg mb-4">
								  <div class="input-group-prepend">
								    <span class="input-group-text" id="basic-addon1">새로운 비밀번호</span>
								  </div>
								  <input type="password" class="form-control" placeholder="새로운 비밀번호를 입력해주세요." aria-label="Username" aria-describedby="basic-addon1"  name="member_pw" onblur="checkPw()">
								</div>
								  <div class="text-center mb-4 text-danger" style="font-size: 18px;"></div>
								<div class="input-group input-group-lg mb-4">
								  <div class="input-group-prepend">
								    <span class="input-group-text" id="basic-addon1">비밀번호 확인</span>
								  </div>
								  <input type="password" class="form-control" placeholder="새로운 비밀번호를 입력해주세요." aria-label="Username" aria-describedby="basic-addon1" name="member_pw2" onblur="checkPasswordReinput()">
								</div>
								  <div class="text-center mb-4 text-danger" style="font-size: 18px;"></div>
								<button type="submit"  data-target="#changPwFail" class="btn btn-lg btn-warning btn-block font-weight-bold">수정</button>
							</form>
						  </div>
						</div>
                    </div>
<jsp:include page="/WEB-INF/views/template/member/member_classes_viewer_footer.jsp"></jsp:include>
<script>
$(function(){
	  $("#changPwFail").modal("hide")
})
//submit전에 회원가입 형식을 검사하는 함수  조건에 걸리면 모달을 보여줘라
function finalcheck(){
		if(CheckBeforecheckPw()== false || checkPw()== false || checkPasswordReinput() == false) {
			$("#changPwFail").modal("show") //회원가입양식 확인 하라는 모달 
			return false
		}  
	}


//기존의 사용자의 비밀번호를 비교 
function CheckBeforecheckPw(){

	  var member_id = document.querySelector("input[name=member_id]").value; 
	  var member_pw = document.querySelector("input[name=beforeMember_pw]").value;
	  var span = $("input[name=beforeMember_pw]").parent().next()
			 

	  	 axios({
					  url:"${pageContext.request.contextPath}/nonMemberAjax/checkChangePw?member_id="+member_id+"&member_pw="+member_pw,
					 method:"get"  
				  })
				  .then(function(resp){
					  if(resp.data==true){ //결과과 일치한다면
							span.style.color="blue"; 	
							 span.textContent = "비밀번호일치";
					  			check=1;
					  			return check;

					  }else{
						span.style.color="red"; 	
						span.textContent="기존비밀번호 불일치 ";
					  		check= 2;
					  		return check;
					  }	  
				  });
			 
	if(check==1){
		return true;
	} else {
		return false;

	}
	  	 
	   }
		
	  

//비밀번호 조건 검사 
	 function checkPw(){
var regex = /^[A-Za-z0-9]{6,12}$/;  //6~15글자의 영어(대,소문자) 숫자만으로 구성가능합니다
var input = document.querySelector("input[name=member_pw]"); //사용자가 input창에  입력한 값 
var span = $("input[name=member_pw]").parent().next()
var isValid = regex.test(input.value); //입력한 pw가 조건식에 맞는지 검사 
var member_pw = input.value; //사용자가 입력한 pw값 


if(isValid){//입력한 pw가 조건에맞는다면 
	span.style.color="blue"; 	
	span.textContent = "좋은 비밀번호입니다.";
	 return true;
	}	  
else{//정규표현식 안맞으면
		span.style.color="red"; 	
	   span.textContent="6~15글자의 영어(대,소문자) 숫자만으로 구성가능합니다";
return false;
}
}

//사용자가 입력한 비밀번호가 같은지를 비교합시다. 
	 function checkPasswordReinput(){
var pw1 = document.querySelector("input[name=member_pw]").value; //사용자가 input창에  입력한 값 
var pw2 = document.querySelector("input[name=member_pw2]").value;
var span = $("input[name=member_pw2]").parent().next()
var isValid = pw1 == pw2;  //입력한 식에 맞는지 검사 


if(isValid){//맞은경우
	
	span.style.color="blue"; 	
	span.textContent = "새로운 비밀번호 확인";
	
	 return true;
	}	  
else{//맞지않은경우 
	  span.style.color="red"; 	
	  span.textContent="일치하지 않습니다. 새로 사용하시려는 비밀번호를  다시 한번 입력하세요 ";
return false;
}
}
</script>
<jsp:include page="/WEB-INF/views/template/member/member_classes_nav_footer.jsp"></jsp:include>