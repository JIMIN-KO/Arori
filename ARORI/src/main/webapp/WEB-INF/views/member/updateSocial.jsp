<jsp:include page="/WEB-INF/views/template/member/main_member_nav_header.jsp"></jsp:include>
<%@page contentType="text/html; charset=UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<script src="https://cdnjs.cloudflare.com/ajax/libs/axios/0.19.2/axios.js" integrity="sha512-VGxuOMLdTe8EmBucQ5vYNoYDTGijqUsStF6eM7P3vA/cM1pqOwSBv/uxw94PhhJJn795NlOeKBkECQZ1gIzp6A==" crossorigin="anonymous"></script>
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
	  var span = document.querySelector("input[name=member_nick]+span"); 
	  var isValid = regex.test(input.value); //입력한 아이디가 조건식에 맞는지 검사 
	  var member_nick = input.value; //사용자가 입력한 값 
	  var prohibition ="관리자"; //금지할 단어

	  if(input.value==="${memberDto.member_nick}"){ //사용자가 원래 쓰던 닉네임 입력시 
	 	 	span.textContent="멋진닉네임입니다.";	
	 		 return true;
			}else{
	    	 if(input.value.indexOf(prohibition)!=-1){ //금지단어를가지고 있다면 
			  span.textContent="해당 닉네임은 관리자 전용입니다.";
		 		 return false;

		  	 }else{//금지하는 단어가 없을경우 정규표현식검사
		  		  if(isValid){//정상적인 이름인 경우  아이디 중복체크 
				
				  axios({
					  url:"${pageContext.request.contextPath}/nonMemberAjax/checkOverlapNick?member_nick="+member_nick,
					 method:"get"  
				  })
				  .then(function(resp){
					  console.log(resp)
					  if(!resp.data){ //결과가 없다면 
						  span.textContent = "멋진 닉네임입니다";
					  		return true;

					  }else{
						  span.textContent="이미 사용중인 닉네임입니다.";
					  		return false;

					  }	  
				  });
			  }  
		      else{//정규표현식 안맞으면
		    	  span.textContent="2~10자 한글,영어,숫자만  공백없이 사용가능합니다. ";
		    	  	return false;
		      }
			}
		 }   
	   }

</script>
	<h1>정보수정</h1>
		<div>아이디  ${memberDto.member_id}  </div>
	<form action="updateSocial" method="post" onSubmit="return finalcheck()";>
	 <div>닉네임<input type = "text"  name="member_nick" value="${memberDto.member_nick}"  onblur="checkNick()"><span></span></div>
	<button type="submit" data-target="#memberUpdateFail">수정</button>
</form>
<jsp:include page="/WEB-INF/views/template/member/main_member_nav_footer.jsp"></jsp:include>
