<jsp:include page="/WEB-INF/views/template/member/main_member_nav_header.jsp"></jsp:include>
<%@page contentType="text/html; charset=UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<script src="https://cdnjs.cloudflare.com/ajax/libs/axios/0.19.2/axios.js" integrity="sha512-VGxuOMLdTe8EmBucQ5vYNoYDTGijqUsStF6eM7P3vA/cM1pqOwSBv/uxw94PhhJJn795NlOeKBkECQZ1gIzp6A==" crossorigin="anonymous"></script>


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
	  var span = document.querySelector("input[name=beforeMember_pw]+span"); 
		 

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
var span = document.querySelector("input[name=member_pw]+span"); 
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
var span = document.querySelector("input[name=member_pw2]+span"); 
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

	<h1>비밀번호변경</h1>
	<div>아이디 <input type="text" name="member_id" value="${memberDto.member_id}" readonly> </div><!-- 기존의 비밀번호 -->
	<form action="changePW" method="post" onSubmit="return finalcheck();">
	<div>현재 비밀번호<input type="text" name="beforeMember_pw"  onblur="CheckBeforecheckPw()"><span></span></div><!-- 기존의 비밀번호 -->
	<div>새 비밀번호 <input type="text" name="member_pw" onblur="checkPw()"><span></span></div>
 	<div>비밀번호 확인  <input type="text" name="member_pw2" onblur="checkPasswordReinput()"><span></span></div><!-- 확인할 비밀번호 -->
 	
    <button type="submit"  data-target="#changPwFail">변경</button>
</form>
<jsp:include page="/WEB-INF/views/template/member/main_member_nav_footer.jsp"></jsp:include>
